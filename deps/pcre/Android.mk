MAKEFILE_PATH := $(call my-dir)
GLIB_SOURCES_PATH := $(MAKEFILE_PATH)/../glib/distsrc
LOCAL_PATH:= $(GLIB_SOURCES_PATH)/glib/pcre

include $(CLEAR_VARS)

include $(LOCAL_PATH)/Sources.mk

LOCAL_MODULE:= pcre
LOCAL_SRC_FILES:= $(filter %.c, $(libpcre_la_SOURCES))
LOCAL_CFLAGS += $(libpcre_la_CPPFLAGS) -DNVALGRIND=1
LOCAL_C_INCLUDES := $(GLIB_SOURCES_PATH) $(GLIB_SOURCES_PATH)/glib  \
                    $(MAKEFILE_PATH)/../glib $(MAKEFILE_PATH)/../glib/include \
                    $(MAKEFILE_PATH)/../libiconv/include

LOCAL_STATIC_LIBRARIES := libiconv

include $(BUILD_STATIC_LIBRARY)
$(call import-module,deps/libiconv)
