LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE     := fontconfig

LOCAL_CFLAGS := -DHAVE_CONFIG_H

# Additional font directories
LOCAL_CFLAGS += -DFC_CACHEDIR=\"/sdcard/fontconfig/cache\"
LOCAL_CFLAGS += -DFC_TEMPLATEDIR=\"/sdcard/fontconfig/conf.avail\"
LOCAL_CFLAGS += -DFONTCONFIG_PATH=\"/sdcard/fontconfig/etc/fonts\"
LOCAL_CFLAGS += -DFC_ADD_FONTS=\"/sdcard/fontconfig/fonts\"
# System font directory
LOCAL_CFLAGS += -DFC_DEFAULT_FONTS=\"/system/fonts\"

include $(LOCAL_PATH)/src/Makefile.sources

libfontconfig_la_SOURCES := $(filter-out fcarch.c, $(libfontconfig_la_SOURCES))

LOCAL_SRC_FILES  := $(addprefix src/, $(filter %.c, $(libfontconfig_la_SOURCES)))

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/android \
    $(LOCAL_PATH)/src \
	$(LOCAL_PATH)/../freetype/include \
	$(LOCAL_PATH)/../libexpat/lib \
	$(LOCAL_PATH)/../libuuid/include \
	$(LOCAL_PATH)/../libiconv/include

LOCAL_STATIC_LIBRARIES := freetype libexpat libiconv libuuid

include $(BUILD_STATIC_LIBRARY)

$(call import-module,deps/freetype)
$(call import-module,deps/libexpat)
$(call import-module,deps/libuuid)
$(call import-module,deps/libiconv)