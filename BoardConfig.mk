#
# Copyright (C) 2015 The CyanogenMod Project
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

# inherit from the proprietary version
-include vendor/samsung/i9500/BoardConfigVendor.mk

LOCAL_PATH := device/samsung/i9500

BOARD_VENDOR := samsung

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := ja3g,i9500,GT-I9500

# Build
TARGET_USES_BLOCK_BASED_OTA := false
TARGET_NEEDS_NON_PIE_SUPPORT := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := universal5410
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := insignal
TARGET_SOC := exynos5410

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15

# Enable QC's libm optimizations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := omnirom_i9500_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/exynos5410

# Audio
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
BOARD_DYNAMIC_WIDEBAND_SWITCHING := false
COMMON_GLOBAL_CFLAGS += -DSAMPLE_RATE_48K

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Logging
TARGET_USES_LOGD := false

# Camera
BOARD_NEEDS_MEMORYHEAPION := true

# OMX
BOARD_USE_ALP_AUDIO := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_STOREMETADATA := true
COMMON_GLOBAL_CFLAGS += -DSURFACE_IS_BGR32
COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED

# GScaler
BOARD_USES_GSC_VIDEO := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_SYSTEMUI_PBSIZE_HACK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
COMMON_GLOBAL_CFLAGS += -DUSES_PVR_GPU -DEXYNOS_SUPPORT_BGRX_8888
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_SAMSUNG_GRALLOC_EXTERNAL_USECASES := true
HWUI_COMPILE_FOR_PERF := true

# Widevine
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
BOARD_USES_LEGACY_MMAP := true

# NFC
BOARD_NFC_HAL_SUFFIX := universal5410

# Radio
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6360
BOARD_RIL_CLASS := ../../../device/samsung/i9500/ril

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_BAND                        := 802_11_ABG

CONFIG_EAP_TLS                   := true
CONFIG_EAP_TTLS                  := true
CONFIG_EAP_PEAP                  := true
CONFIG_EAP_MD5                   := true
CONFIG_EAP_MSCHAPV2              := true
CONFIG_EAP_SIM                   := true
CONFIG_EAP_LEAP                  := true
CONFIG_EAP_PSK                   := true
CONFIG_EAP_AKA                   := true
CONFIG_EAP_PWD                   := true
CONFIG_EAP_IKEV2                 := true

# Filesystems
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2898264064
BOARD_USERDATAIMAGE_PARTITION_SIZE := 9604939776
BOARD_FLASH_BLOCK_SIZE := 4096

# PowerHAL
TARGET_POWERHAL_VARIANT := universal5410

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true

BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_LARGE_FILESYSTEM := true
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.universal5410
TARGET_RECOVERY_DEVICE_MODULES += init.recovery.usb.rc

BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP Specific
TW_THEME := portrait_hdpi

RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true

TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true

TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255

#TW_INCLUDE_L_CRYPTO := true

TW_NO_EXFAT_FUSE := true
TW_NO_USB_STORAGE := true

# Charging mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
RED_LED_PATH := "/sys/class/leds/led_r/brightness"
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness"
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness"
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/i9500/sepolicy

BOARD_SEPOLICY_UNION := \
    bluetooth.te \
    device.te \
    drmserver.te \
    file_contexts \
    file.te \
    gpsd.te \
    mediaserver.te \
    property_contexts \
    property.te \
    pvrsrvctl.te \
    rild.te \
    shell.te \
    system_server.te \
    ueventd.te \
    wpa.te

# Releasetools
#TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)
