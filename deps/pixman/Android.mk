LOCAL_PATH := $(call my-dir)

LIBPIXMAN_SRC = \
	       src/pixman.c                       \
	       src/pixman-access.c                \
	       src/pixman-access-accessors.c      \
	       src/pixman-arm.c                   \
	       src/pixman-bits-image.c            \
	       src/pixman-combine32.c             \
	       src/pixman-combine-float.c         \
	       src/pixman-conical-gradient.c      \
	       src/pixman-edge.c                  \
	       src/pixman-edge-accessors.c        \
	       src/pixman-fast-path.c             \
	       src/pixman-general.c               \
	       src/pixman-glyph.c                 \
	       src/pixman-gradient-walker.c       \
	       src/pixman-image.c                 \
	       src/pixman-implementation.c        \
	       src/pixman-linear-gradient.c       \
	       src/pixman-matrix.c                \
	       src/pixman-mips.c                  \
	       src/pixman-noop.c                  \
	       src/pixman-ppc.c                   \
	       src/pixman-radial-gradient.c       \
	       src/pixman-region16.c              \
	       src/pixman-region32.c              \
	       src/pixman-solid-fill.c            \
	       src/pixman-timer.c                 \
	       src/pixman-trap.c                  \
	       src/pixman-utils.c                 \
	       src/pixman-x86.c                   \

LIBPIXMAN_CFLAGS := -D_USE_MATH_DEFINES -DPIXMAN_NO_TLS

ifeq ($(strip $(TARGET_ARCH)),arm)
    ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
        LIBPIXMAN_CFLAGS += -DUSE_ARM_NEON
        LIBPIXMAN_SRC += \
            src/pixman-arm-neon.c \
            src/pixman-arm-neon-asm.S \
            src/pixman-arm-neon-asm-bilinear.S
    else
        LIBPIXMAN_CFLAGS += -DUSE_ARM_SIMD
        LIBPIXMAN_SRC += \
            src/pixman-arm-simd.c \
            src/pixman-arm-simd-asm.S \
            src/pixman-arm-simd-asm-scaled.S
    endif
endif

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := pixman
LOCAL_CFLAGS    := $(LIBPIXMAN_CFLAGS) -Wno-missing-field-initializers
LOCAL_SRC_FILES := $(LIBPIXMAN_SRC)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/android $(LOCAL_PATH)/src
LOCAL_STATIC_LIBRARIES := cpufeatures

include $(BUILD_STATIC_LIBRARY)

$(call import-module,android/cpufeatures)
