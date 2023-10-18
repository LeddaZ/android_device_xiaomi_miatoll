#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Audio
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.2-impl \
    audio.primary.atoll \
    audio.r_submix.default \
    audio.usb.default \
    liba2dpoffload \
    libaudiopreprocessing \
    libaudio-resampler \
    libbatterylistener \
    libbundlewrapper \
    libcomprcapture \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libsndmonitor \
    libspkrprot \
    libvisualizer \
    libvolumelistener \
    sound_trigger.primary.atoll:32

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libdng_sdk.vendor \
    libgui_vendor \
    libmegface \
    libMegviiFacepp-0.5.2 \
    libstdc++_vendor \
    vendor.qti.hardware.camera.device@1.0.vendor

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Display / Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-impl \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    disable_configstore \
    gralloc.atoll \
    hwcomposer.atoll \
    libdisplayconfig.qti \
    libdisplayconfig.system.qti \
    libqdMetaData \
    libqdMetaData.system \
    libsdmcore \
    libsdmutils \
    libtinyxml \
    libvulkan \
    memtrack.atoll \
    vendor.display.config@1.5 \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0 \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.4.vendor

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti

PRODUCT_PACKAGES += \
    libbatching \
    libgeofencing \
    libgnss \
    libsensorndkbridge

PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    gnss_antenna_info.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf

PRODUCT_PACKAGES += \
    gnss@2.0-base.policy \
    gnss@2.0-xtra-daemon.policy

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    libhwbinder.vendor

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Inherit non-ab devices
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/idc/,$(TARGET_COPY_OUT_VENDOR)/usr/idc)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# IPACM
PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0 \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    hardware/qcom-caf/sm8150/media/conf_files/atoll/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    hardware/qcom-caf/sm8150/media/conf_files/atoll/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Netmgr
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    Tag

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.nxp.mifare.xml

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Optimizations
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Overlays
PRODUCT_PACKAGES += \
    CurtanaGlobalPASettingsOverlay \
    CurtanaGlobalPASettingsProviderOverlay \
    CurtanaGlobalPAWifiOverlay \
    CurtanaGlobalTWOSettingsOverlay \
    CurtanaGlobalTWOSettingsProviderOverlay \
    CurtanaGlobalTWOWifiOverlay \
    CurtanaIndiaSettingsOverlay \
    CurtanaIndiaSettingsProviderOverlay \
    CurtanaIndiaWifiOverlay \
    CurtanaJapanSettingsOverlay \
    CurtanaJapanSettingsProviderOverlay \
    CurtanaJapanWifiOverlay

PRODUCT_PACKAGES += \
    ExcaliburSettingsOverlay \
    ExcaliburSettingsProviderOverlay \
    ExcaliburWifiOverlay

PRODUCT_PACKAGES += \
    GramSettingsOverlay \
    GramSettingsProviderOverlay \
    GramWifiOverlay

PRODUCT_PACKAGES += \
    JoyeuseSettingsOverlay \
    JoyeuseSettingsProviderOverlay \
    JoyeuseWifiOverlay

PRODUCT_PACKAGES += \
    MiatollApertureOverlay \
    MiatollCarrierConfigOverlay \
    MiatollFrameworksOverlay \
    MiatollSettingsOverlay \
    MiatollSystemUIOverlay \
    MiatollTelephonyOverlay \
    MiatollWifiOverlay

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Perf
PRODUCT_PACKAGES += \
    libqti-perfd-client

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# Platform
PRODUCT_BOARD_PLATFORM := atoll
PRODUCT_USES_QCOM_HARDWARE := true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.xiaomi-libperfmgr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libprotobuf-cpp-full-3.9.1-vendorcompat

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    librmnetctl \
    libwpa_client \
    libxml2

# Screen resolution
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Secure element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Shims
PRODUCT_PACKAGES += \
    libpiex_shim

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Rootdir
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.sh \
    init.qti.chg_policy.sh \
    init.sensors_fixup.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc \
    init.miatoll.perf.rc \
    init.qcom.power.rc \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc

# Sensors
$(call inherit-product, vendor/hardware/xiaomi/hidl/sensors/sensors_product.mk)

PRODUCT_PACKAGES += \
    libsensorndkbridge

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    vendor/hardware/xiaomi

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
$(call soong_config_set,thermal_hal_feature,pid,apply_1_0)

PRODUCT_PACKAGES += \
    android.hardware.thermal-service.pixel

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/thermal/,$(TARGET_COPY_OUT_VENDOR)/etc)

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service \
    init.qcom.usb.rc \
    init.qcom.usb.sh

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/usb/etc

# Variant-specific props
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,odm.*.prop,$(LOCAL_PATH)/props/odm/,$(TARGET_COPY_OUT_ODM)/etc) \
    $(call find-copy-subdir-files,product.*.prop,$(LOCAL_PATH)/props/product/,$(TARGET_COPY_OUT_PRODUCT)/etc) \
    $(call find-copy-subdir-files,system.*.prop,$(LOCAL_PATH)/props/system/,$(TARGET_COPY_OUT_SYSTEM)) \
    $(call find-copy-subdir-files,system_ext.*.prop,$(LOCAL_PATH)/props/system_ext/,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc) \
    $(call find-copy-subdir-files,vendor.*.prop,$(LOCAL_PATH)/props/vendor/,$(TARGET_COPY_OUT_VENDOR))

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verify apps
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
RELAX_USES_LIBRARY_CHECK := true

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwpa_client \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.2.vendor \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# Proprietary blobs
$(call inherit-product, vendor/xiaomi/miatoll/miatoll-vendor.mk)
