#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Product Makefiles
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/statix_miatoll.mk \
    $(LOCAL_DIR)/statix_miatoll_64.mk

# Lunch targets
COMMON_LUNCH_CHOICES := \
    statix_miatoll-ap3a-user \
    statix_miatoll-ap3a-userdebug \
    statix_miatoll-ap3a-eng \
    statix_miatoll_64-ap3a-user \
    statix_miatoll_64-ap3a-userdebug \
    statix_miatoll_64-ap3a-eng
