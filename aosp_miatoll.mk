#
# Copyright (C) 2020 The ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from miatoll  device
$(call inherit-product, device/xiaomi/miatoll/device.mk)

# Inherit some common PixelOS stuff
TARGET_BOOT_ANIMATION_RES := 1080
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
TARGET_GAPPS_ARCH := arm64

# Device identifier
PRODUCT_NAME := aosp_miatoll
PRODUCT_DEVICE := miatoll
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 9S
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Live Wallpapers
TARGET_INCLUDE_LIVE_WALLPAPERS := true

# Face unlock
TARGET_FACE_UNLOCK := true

# Fingerprint
BUILD_FINGERPRINT := google/redfin/redfin:11/RQ3A.210605.005/7349499:user/release-keys
BUILD_DESCRIPTION := redfin-user 11 RQ3A.210605.005 7349499 release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"
