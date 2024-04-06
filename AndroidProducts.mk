#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Product Makefiles
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/hentai_miatoll.mk \
    $(LOCAL_DIR)/hentai_miatoll_64.mk

# Lunch targets
COMMON_LUNCH_CHOICES := \
    hentai_miatoll-ap1a-user \
    hentai_miatoll-ap1a-userdebug \
    hentai_miatoll-ap1a-eng \
    hentai_miatoll_64-ap1a-user \
    hentai_miatoll_64-ap1a-userdebug \
    hentai_miatoll_64-ap1a-eng
