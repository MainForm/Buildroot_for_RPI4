 ################################################################################
 #
 # lvgl from git
 #
 ################################################################################

LVGL_VERSION = v0.0.3
LVGL_SITE = https://github.com/MainForm/buildroot_lvgl_package
LVGL_SITE_METHOD = git
LVGL_GIT_SUBMODULES = YES

LVGL_INSTALL_STAGING = YES
LVGL_INSTALL_TARGET = NO

$(eval $(cmake-package))