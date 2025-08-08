 ################################################################################
 #
 # lvgl from git
 #
 ################################################################################

LVGL_VERSION = v0.0.4
LVGL_SITE = https://github.com/MainForm/buildroot_lvgl_package
LVGL_SITE_METHOD = git
LVGL_GIT_SUBMODULES = YES

LVGL_INSTALL_STAGING = YES
LVGL_INSTALL_TARGET = NO

ifeq ($(BR2_PACKAGE_LVGL_USE_DRM),y)
LVGL_CONF_OPTS += -DLV_USE_LINUX_DRM=1
else
LVGL_CONF_OPTS += -DLV_USE_LINUX_DRM=0
endif

$(eval $(cmake-package))