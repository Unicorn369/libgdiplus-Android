LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CPP_FEATURES := exceptions

LOCAL_CPPFLAGS := -std=c++11

LOCAL_CFLAGS += \
    -Wno-shift-op-parentheses \
    -Wno-string-plus-int \
    -Wno-dangling-else \
    -Wno-bitwise-op-parentheses

LOCAL_MODULE     := libiconv

LOCAL_SRC_FILES  := src/iconv.c src/libintl.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

include $(BUILD_STATIC_LIBRARY)