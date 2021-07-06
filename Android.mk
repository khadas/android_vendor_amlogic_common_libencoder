LOCAL_PATH := $(call my-dir)

build:=0

ifeq ($(PLATFORM_SDK_VERSION),28)
$(warning build for android p)
build=1
endif

ifeq ($(PLATFORM_SDK_VERSION),30)

$(warning build for android r)

build=1
endif

ifeq ($(build), 1)
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 && echo OK),OK)
OMX_PATH_32 := $(TARGET_OUT_VENDOR)/lib/
OMX_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/
else
OMX_PATH_32 := $(TARGET_OUT)/lib/
OMX_PATH_64 := $(TARGET_OUT)/lib64/
endif

include $(CLEAR_VARS)
LOCAL_MODULE := libamvenc_api
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(OMX_PATH_32)
LOCAL_MODULE_PATH_64 := $(OMX_PATH_64)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libvpcodec
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(OMX_PATH_32)
LOCAL_MODULE_PATH_64 := $(OMX_PATH_64)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libjpegenc_api
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(OMX_PATH_32)
LOCAL_MODULE_PATH_64 := $(OMX_PATH_64)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

endif

include $(call all-makefiles-under,$(LOCAL_PATH))
