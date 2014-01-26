#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/gardalte/gardalte-vendor.mk)

LOCAL_PATH := device/samsung/gardalte

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.universal3470 \
    init.recovery.universal3470.rc \
    init.universal3470.rc \
    init.universal3470.usb.rc \
    ubuntu-sd-partitioner.sh \
    ueventd.universal3470.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Lights
PRODUCT_PACKAGES += \
    lights.exynos3

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Radio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/sbin/cbd:root/sbin/cbd

# Ubuntu Overlay Files
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/ubuntu/udev.rules:system/ubuntu/lib/udev/rules.d/70-android.rules \
   $(LOCAL_PATH)/ubuntu/display.conf:system/ubuntu/etc/ubuntu-touch-session.d/android.conf

# Dalvik VM specific for devices with 1024 MB of RAM
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Inherit from smdk3470-common
$(call inherit-product, device/samsung/smdk3470-common/smdk3470-common.mk)
