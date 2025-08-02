PROJECT_PATH := $(shell pwd)
OUTPUT_PATH := $(PROJECT_PATH)/output
BR2_SRC_PATH := $(PROJECT_PATH)/buildroot

PATH_OLD := $(PATH)
PATH_NEW := /bin:/usr/local/bin:/usr/bin

SDCARD_DEVICE := /dev/sde

.PHONY: vars upload

vars:
	@echo "PROJECT_PATH : $(PROJECT_PATH)"
	@echo "OUTPUT_PATH : $(OUTPUT_PATH)"
	@echo "PATH_NEW : $(PATH_NEW)"

upload:
	sudo dd if=$(OUTPUT_PATH)/images/sdcard.img of=$(SDCARD_DEVICE) bs=4M