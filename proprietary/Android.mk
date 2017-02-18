LOCAL_PATH:=$(call my-dir)

myApkList:=$(foreach fpath,$(shell ls $(LOCAL_PATH)/*.apk),$(notdir $(fpath)))
$(foreach apkFile,$(myApkList), \
  $(eval include $(CLEAR_VARS)) \
  $(eval LOCAL_MODULE := $(basename $(apkFile))) \
  $(eval LOCAL_SRC_FILES := $(apkFile)) \
  $(eval LOCAL_MODULE_PATH := $(TARGET_OUT_APPS)) \
  $(eval LOCAL_MODULE_CLASS := APPS) \
  $(eval LOCAL_MODULE_OWNER := $(notdir $(shell cd $(LOCAL_PATH)/../.. && pwd))) \
  $(eval LOCAL_MODULE_TAGS := optional) \
  $(eval LOCAL_CERTIFICATE := platform) \
  $(eval LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)) \
  $(eval include $(BUILD_PREBUILT)) \
)
