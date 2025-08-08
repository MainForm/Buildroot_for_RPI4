 ################################################################################
 #
 # lvgl from git
 #
 ################################################################################

LVGL_VERSION = v0.0.7
LVGL_SITE = https://github.com/MainForm/buildroot_lvgl_package
LVGL_SITE_METHOD = git
LVGL_GIT_SUBMODULES = YES

LVGL_INSTALL_STAGING = YES
LVGL_INSTALL_TARGET = NO

# output files is static library
LVGL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

ifeq ($(BR2_PACKAGE_LVGL_USE_DRM),y)
LVGL_CONF_OPTS += -DLVGL_GRAPHIC_DRM=ON
else
LVGL_CONF_OPTS += -DLVGL_GRAPHIC_DRM=OFF
endif

ifeq ($(BR2_PACKAGE_LVGL_USE_LIBINPUT),y)
LVGL_CONF_OPTS += -DLVGL_INPUT_LIBINPUT=ON
else
LVGL_CONF_OPTS += -DLVGL_INPUT_LIBINPUT=OFF
endif

$(eval $(cmake-package))