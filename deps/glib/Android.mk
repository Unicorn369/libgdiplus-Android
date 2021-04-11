MAKEFILE_PATH := $(call my-dir)
GLIB_SOURCES_PATH := $(MAKEFILE_PATH)/distsrc
LOCAL_PATH:= $(GLIB_SOURCES_PATH)/glib

include $(CLEAR_VARS)

include $(LOCAL_PATH)/Sources.mk

GNULIB_SOURCES = $(addprefix gnulib/, vasnprintf.c printf-parse.c printf-args.c printf.c asnprintf.c)
CHARSET_SOURCES = libcharset/localcharset.c
GLIB_CORE_SOURCES = $(filter %.c, $(libglib_2_0_la_SOURCES)) gspawn.c giounix.c

LOCAL_MODULE:= glib
LOCAL_SRC_FILES:= $(GLIB_CORE_SOURCES) $(GNULIB_SOURCES) $(CHARSET_SOURCES)
LOCAL_CFLAGS += -DGLIB_COMPILATION=1 -DNVALGRIND=1 -DLIBINTL_LITE
LOCAL_C_INCLUDES := $(MAKEFILE_PATH) $(MAKEFILE_PATH)/include $(GLIB_SOURCES_PATH) \
                    $(MAKEFILE_PATH)/../libiconv/include

LOCAL_STATIC_LIBRARIES := libiconv pcre
ifeq ($(USE_ZLIB),true)
    LOCAL_STATIC_LIBRARIES += zlib
else
    LOCAL_EXPORT_LDLIBS := -lz
endif

include $(BUILD_STATIC_LIBRARY)

$(call import-module,deps/libiconv)
$(call import-module,deps/pcre)