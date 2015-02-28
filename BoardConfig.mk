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

# inherit from common smdk3470
-include device/samsung/smdk3470-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := gardalte,gardalteMetroPCS,gardaltetmo

# Filesystems
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1468006400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5679087616

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/samsung/gardalte/include

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_gardalte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/gardalte

# Audio
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/gardalte/bluetooth

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/gardalte
TARGET_RECOVERY_FSTAB := device/samsung/gardalte/rootdir/etc/fstab.universal3470

# SELinux
BOARD_SEPOLICY_DIRS += \
   device/samsung/gardalte/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    service_contexts \
    device.te \
    domain.te \
    drmserver.te \
    file.te \
    gpsd.te \
    init.te \
    mediaserver.te \
    servicemanager.te \
    system_app.te \
    system_server.te \
    vold.te \
    wpa.te

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_gardalte
TARGET_LIBINIT_DEFINES_FILE := device/samsung/gardalte/init/init_gardalte.c

# TWRP
DEVICE_RESOLUTION := 480x800
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := "/sys/devices/platform/s5p-mipi-dsim.0/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_SCREEN_TIMEOUT := true
TW_HAS_DOWNLOAD_MODE := true
