PROJECT_PATH := $(shell pwd)
OUTPUT_PATH := $(PROJECT_PATH)/output
BR2_SRC_PATH := $(PROJECT_PATH)/buildroot

PATH_OLD := $(PATH)
PATH_NEW := /bin:/usr/local/bin:/usr/bin

SDCARD_DEVICE := /dev/sdd

define BUILDROOT_MAKE
		make -C $(BR2_SRC_PATH) \
			O=$(OUTPUT_PATH)  \
			BR2_EXTERNAL=$(PROJECT_PATH)
endef

.PHONY: all clean vars menuconfig sdk upload

all:
	export PATH=$(PATH_NEW)
	$(BUILDROOT_MAKE)

menuconfig:
	$(BUILDROOT_MAKE) menuconfig

%_defconfig:
	$(BUILDROOT_MAKE) $*_defconfig

sdk:
	$(BUILDROOT_MAKE) sdk

clean:
	$(BUILDROOT_MAKE) clean
	@rm -rf $(OUTPUT_PATH)

vars:
	@echo "PROJECT_PATH : $(PROJECT_PATH)"
	@echo "OUTPUT_PATH : $(OUTPUT_PATH)"
	@echo "PATH_NEW : $(PATH_NEW)"

upload:
	sudo dd if=$(OUTPUT_PATH)/images/sdcard.img of=$(SDCARD_DEVICE) bs=4M