LOCAL_PATH := $(call my-dir)/..

######### [libgdiplus] ##########
include $(CLEAR_VARS)
LOCAL_MODULE := libgdiplus

LOCAL_CFLAGS     += -DHAVE_CONFIG_H
LOCAL_C_INCLUDES += $(LOCAL_PATH)/deps/cairo \
                    $(LOCAL_PATH)/deps/cairo/android \
                    $(LOCAL_PATH)/deps/cairo/cairo \
                    $(LOCAL_PATH)/deps/fontconfig \
                    $(LOCAL_PATH)/deps/freetype/include \
                    $(LOCAL_PATH)/deps/glib/distsrc \
					$(LOCAL_PATH)/deps/glib/distsrc/glib \
                    $(LOCAL_PATH)/deps/glib/include \
                    $(LOCAL_PATH)/deps/libjpeg \
                    $(LOCAL_PATH)/deps/libpng \
                    $(LOCAL_PATH)/src \

LOCAL_SRC_FILES := \
                   src/adjustablearrowcap.c \
                   src/bitmap.c \
                   src/bmpcodec.c \
                   src/brush.c \
                   src/carbon-private.c \
                   src/customlinecap.c \
                   src/dstream.c \
                   src/emfcodec.c \
                   src/emfplus.c \
                   src/font.c \
                   src/gdi32.c \
                   src/general.c \
                   src/gifcodec.c \
                   src/graphics-cairo.c \
                   src/graphics-metafile.c \
                   src/graphics-path.c \
                   src/graphics-pathiterator.c \
                   src/graphics.c \
                   src/hatchbrush.c \
                   src/icocodec.c \
                   src/image.c \
                   src/imageattributes.c \
                   src/jpegcodec.c \
                   src/lineargradientbrush.c \
                   src/matrix.c \
                   src/metafile.c \
                   src/pathgradientbrush.c \
                   src/pen.c \
                   src/pngcodec.c \
                   src/print.c \
                   src/region-bitmap.c \
                   src/region-path-tree.c \
                   src/region.c \
                   src/solidbrush.c \
                   src/stringformat.c \
                   src/text-cairo.c \
                   src/text-metafile.c \
                   src/text-pango.c \
                   src/text.c \
                   src/texturebrush.c \
                   src/tiffcodec.c \
                   src/wmfcodec.c

LOCAL_LDLIBS     += -llog -landroid -lz

LOCAL_STATIC_LIBRARIES += glib 
LOCAL_STATIC_LIBRARIES += libcairo
LOCAL_STATIC_LIBRARIES += libjpeg

include $(BUILD_SHARED_LIBRARY)
$(call import-add-path,$(LOCAL_PATH))
$(call import-module,deps/cairo)
$(call import-module,deps/glib)
$(call import-module,deps/libjpeg)