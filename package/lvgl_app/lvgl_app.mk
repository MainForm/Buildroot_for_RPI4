 ################################################################################
 #
 # lvgl app
 #
 ################################################################################

LVGL_APP_VERSION = 0.0.1
LVGL_APP_SITE = $(BR2_EXTERNAL_LVGL_RPI4_PATH)/package/lvgl_app/lvgl_app
LVGL_APP_SITE_METHOD = local

LVGL_APP_DEPENDENCIES = lvgl
LVGL_APP_INSTALL_TARGET = YES

LVGL_APP_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr

$(eval $(cmake-package))