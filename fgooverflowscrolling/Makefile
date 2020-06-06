include $(THEOS)/makefiles/common.mk
ARCHS= arm64 arm64e

BUNDLE_NAME = fgoOverflowScrolling

fgoOverflowScrolling_FILES = FgoOSPrefRootListController.m BDInfoListController.m
fgoOverflowScrolling_INSTALL_PATH = /Library/PreferenceBundles
fgoOverflowScrolling_FRAMEWORKS = UIKit
fgoOverflowScrolling_PRIVATE_FRAMEWORKS = Preferences
fgoOverflowScrolling_CFLAGS = -fobjc-arc -Wno-error=unused-variable -Wno-error=unused-function

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/fgoOverflowScrolling.plist$(ECHO_END)
