LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libuuid

LOCAL_CFLAGS := -DHAVE_CONFIG_H

LOCAL_SRC_FILES := \
    clear.c \
    compare.c \
    copy.c \
    gen_uuid.c \
    isnull.c \
    pack.c \
    parse.c \
    randutils.c \
    unpack.c \
    unparse.c \
    uuid_time.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

include $(BUILD_STATIC_LIBRARY)