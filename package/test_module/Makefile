obj-m += test_module.o

all:
	$(MAKE) -C $(LINUX_DIR) M=$(PWD) modules

install:
	mkdir -p $(@D)/lib/modules/$(shell uname -r)/extra
	cp test_module.ko $(@D)/lib/modules/$(shell uname -r)/extra

clean:
	$(MAKE) -C $(LINUX_DIR) M=$(PWD) clean