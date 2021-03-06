LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := libffplayer_jni

LOCAL_SRC_FILES := \
    com_rockcarry_ffplayer_player.cpp \
    ../../src/ffplayer.cpp \
    ../../src/ffrender.cpp \
    ../../src/pktqueue.cpp \
    ../../src/vdev-cmn.cpp \
    ../../src/vdev-android.cpp \
    ../../src/adev-android.cpp

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/../ffmpeg-android/include \
    $(LOCAL_PATH)/../../src

LOCAL_CFLAGS += -DANDROID -DNDEBUG -Os -mfpu=neon-vfpv4 -mfloat-abi=softfp

LOCAL_LDFLAGS += \
    $(LOCAL_PATH)/../ffmpeg-android/lib/libavformat.a \
    $(LOCAL_PATH)/../ffmpeg-android/lib/libavcodec.a \
    $(LOCAL_PATH)/../ffmpeg-android/lib/libavdevice.a \
    $(LOCAL_PATH)/../ffmpeg-android/lib/libavfilter.a \
    $(LOCAL_PATH)/../ffmpeg-android/lib/libswresample.a \
    $(LOCAL_PATH)/../ffmpeg-android/lib/libswscale.a \
    $(LOCAL_PATH)/../ffmpeg-android/lib/libavutil.a

LOCAL_SHARED_LIBRARIES := libcutils libutils libui libgui libandroid_runtime libz

LOCAL_MULTILIB := 32

include $(BUILD_SHARED_LIBRARY)

