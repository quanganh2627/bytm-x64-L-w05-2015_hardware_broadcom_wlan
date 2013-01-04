ifeq ($(BOARD_WLAN_DEVICE), bcmdhd)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(BUILD_WITH_CHAABI_SUPPORT),true)
LOCAL_C_INCLUDES = \
	$(TARGET_OUT_HEADERS)/chaabi
endif

LOCAL_SRC_FILES:= \
	wlan_provisioning.c

LOCAL_CFLAGS:=

ifeq ($(BUILD_WITH_CHAABI_SUPPORT),true)
LOCAL_CFLAGS += -DBUILD_WITH_CHAABI_SUPPORT
LOCAL_STATIC_LIBRARIES := \
	CC6_UMIP_ACCESS CC6_ALL_BASIC_LIB
endif


LOCAL_SHARED_LIBRARIES := \
	libc libcutils libhardware_legacy libcrypto

LOCAL_MODULE:= wlan_prov.bcm
LOCAL_MODULE_STEM := wlan_prov
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

endif
