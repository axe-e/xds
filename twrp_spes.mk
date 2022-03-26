#
# Copyright (C) 2022 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from spes device
#$(call inherit-product, device/xiaomi/spes/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
#$(call inherit-product, vendor/omni/config/gsm.mk)

# Device identifier. This must come after all inclusions
BOARD_VENDOR := Redmi
PRODUCT_BRAND := Redmi

PRODUCT_DEVICE := spes
PRODUCT_NAME := twrp_spes
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_MODEL := Redmi Note 11
PRODUCT_RELEASE_NAME := spes

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    # These lines are from my device. You MUST Replace yours.
    BUILD_FINGERPRINT="Redmi/qssi/qssi:11/RKQ1.211001.001/V13.0.8.0.RGCINXM:user/release-keys" \
    PRIVATE_BUILD_DESC="full_gionee6735_65u_m0-user 6.0 MRA58K 1465782828 release-keys"