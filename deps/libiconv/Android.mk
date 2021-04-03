LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CPP_FEATURES := exceptions

LOCAL_CPPFLAGS := -std=c++11

LOCAL_MODULE     := libiconv

LOCAL_SRC_FILES  := libcharset/localcharset.c libintl-lite/libintl.cpp src/iconv.c

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/android \
    $(LOCAL_PATH)/include

include $(BUILD_STATIC_LIBRARY)