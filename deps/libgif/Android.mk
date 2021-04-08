LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= libgif

LOCAL_SRC_FILES:= \
    dgif_lib.c \
    egif_lib.c \
    gif_err.c \
    gif_font.c \
    gif_hash.c \
    gifalloc.c \
    openbsd-reallocarray.c \
    quantize.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)
