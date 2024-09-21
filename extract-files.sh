#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=miatoll
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

# If XML files don't have comments before the XML header, use this flag
# Can still be used with broken XML files by using blob_fixup
export TARGET_DISABLE_XML_FIXING=true

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup)
            CLEAN_VENDOR=false
            ;;
        -k | --kang)
            KANG="--kang"
            ;;
        -s | --section)
            SECTION="${2}"
            shift
            CLEAN_VENDOR=false
            ;;
        *)
            SRC="${1}"
            ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        # Suppress CamX debug
        vendor/etc/camera/camxoverridesettings.txt)
            [ "$2" = "" ] && return 0
            sed -i "s/0x10080/0/g" "${2}"
            sed -i "s/0x1F/0x0/g" "${2}"
            ;;
        # Use VNDK 32 libhidlbase
        vendor/lib64/libvendor.goodix.hardware.biometrics.fingerprint@2.1.so)
            [ "$2" = "" ] && return 0
            sed -i "s|libhidlbase.so|v32hidlbase.so|g" "${2}"
            ;;
        # Load keymaster 4.1
        vendor/etc/init/android.hardware.keymaster@4.0-service-qti.rc)
            [ "$2" = "" ] && return 0
            sed -i "s/4\.0/4\.1/g" "${2}"
            ;;
        # Fix camera in 3rd party apps
        vendor/lib64/camera/components/com.qti.node.watermark.so)
            [ "$2" = "" ] && return 0
            grep -q "libpiex_shim.so" "$2" || "${PATCHELF}" --add-needed "libpiex_shim.so" "${2}"
            ;;
        # NOP out report_input_event()
        vendor/lib64/hw/fingerprint.fpc.default.so)
            [ "$2" = "" ] && return 0
            "${SIGSCAN}" -p "30 00 00 90 11 3a 42 f9" -P "30 00 00 90 1f 20 03 d5" -f "${2}"
            ;;
        # Patch camera provider to load the new symbols
        vendor/lib64/android.hardware.camera.provider@2.4-legacy.so)
            [ "$2" = "" ] && return 0
            grep -q "libcamera_provider_shim.so" "${2}" || "${PATCHELF}" --add-needed "libcamera_provider_shim.so" "${2}"
            ;;
        # Patch widevine service to load libcrypto-v34
        vendor/lib64/libwvhidl.so)
            [ "$2" = "" ] && return 0
            sed -i "s|libcrypto.so|v34crypto.so|g" "${2}"
            ;;
            *)
                return 1
                ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
