 ################################################################################
 #
 # TEST_MODULE
 #
 ################################################################################

TEST_MODULE_VERSION = 0.0.1
TEST_MODULE_SITE = $(BR2_EXTERNAL_LVGL_RPI4_PATH)/package/test_module
TEST_MODULE_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))