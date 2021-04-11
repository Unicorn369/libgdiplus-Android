LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libexpat

LOCAL_CFLAGS := -DHAVE_EXPAT_CONFIG_H -DXML_ENABLE_VISIBILITY=1

LOCAL_SRC_FILES := \
    xmlparse.c \
    xmlrole.c \
    xmltok.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)