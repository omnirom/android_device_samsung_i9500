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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/samsung/i9500

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.universal5410 \
	init.universal5410.rc \
	init.universal5410.usb.rc \
	init.universal5410.wifi.rc \
	ueventd.universal5410.rc

# Recovery Ramdisk
PRODUCT_PACKAGES += \
	init.recovery.universal5410.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
	$(LOCAL_PATH)/configs/audio/silence.wav:system/etc/sound/silence.wav

PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.primary.universal5410 \
	audio.r_submix.default \
	audio.usb.default \
	tinymix \
	tinyplay

PRODUCT_PROPERTY_OVERRIDES += \
	audio.offload.disable=1
	
#PRODUCT_PROPERTY_OVERRIDES += \
#	af.fast_track_multiplier=1

# Bluetooth
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/bcm4335_prepatch.hcd:system/vendor/firmware/bcm4335_prepatch.hcd

# Camera
PRODUCT_PACKAGES += \
	camera.universal5410 \
	libhwjpeg

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	camera2.portability.force_api=1

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# Charger
PRODUCT_PACKAGES += \
	charger_res_images

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps/gps.cer:system/etc/gps.cer \
	$(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/gps/gps.xml:system/etc/gps.xml

# HW Composer
PRODUCT_PACKAGES += \
	hwcomposer.exynos5 \
	libion

# GPU
PRODUCT_PACKAGES += \
	pvrsrvctl \
	libcorkscrew

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc \
	$(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Keystore
PRODUCT_PACKAGES += \
	keystore.exynos5

# Lights
PRODUCT_PACKAGES += \
	lights.universal5410

# Media
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# USB
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=true

# MobiCore
PRODUCT_PACKAGES += \
	mcDriverDaemon

# IR
PRODUCT_PACKAGES += \
	consumerir.universal5410

# NFC
PRODUCT_PACKAGES += \
	libnfc-nci \
	libnfc_nci_jni \
	nfc_nci.bcm2079x.universal5410 \
	NfcNci \
	Tag \
	com.android.nfc_extras

# NFCEE access control + configuration
NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfc/nfcee_access.xml

PRODUCT_COPY_FILES += \
	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
	$(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# OMX
PRODUCT_PACKAGES += \
	libstagefrighthw

# Extra Apps
PRODUCT_PACKAGES += \
	AdvancedDisplay

# Radio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ril/sbin/cbd:system/bin/cbd

PRODUCT_PACKAGES += \
	libsecril-client \
	libsecril-client-sap

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.ril_class=ExynosXMM6360RIL \
	mobiledata.interfaces=pdp0,gprs,ppp0,rmnet0,rmnet1 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000

# GearOMNI init
PRODUCT_PACKAGES += \
	gearinit.sh

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/busybox:root/sbin/busybox

# Samsung STK
PRODUCT_PACKAGES += \
	SamsungServiceMode

# ANT+
PRODUCT_PACKAGES += \
	AntHalService \
	com.dsi.ant.antradio_library \
	libantradio

# Wi-Fi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	libwpa_client \
	hostapd \
	wpa_supplicant \
	wpa_supplicant.conf \
	hostapd_default.conf \
	hostapd.accept \
	hostapd.deny \
	libnetcmdiface \
	macloader

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf
	
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
	net.tethering.noprovisioning=true

# Misc dependency packages
PRODUCT_PACKAGES += \
	ebtables \
	ethertypes \
	curl \
	libnl_2 \
	libbson \
	libxml2

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# Hardware Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Power
PRODUCT_PACKAGES += \
	power.universal5410

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
	
# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/i9500/i9500-vendor.mk)
