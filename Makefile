obj-m := bma400_core.o bma400_i2c.o bma400_spi.o

#KERNEL_SRC := /home/jaggu/workspace/upstream_iio_tree/raspberry_pi/rasberrypi_linux
KERNEL_SRC := /home/jaggu/workspace/upstream_iio_tree/raspberry_pi/kernel_rpi

SRC := $(shell pwd)
all:
	$(MAKE) ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c *.mod
	rm -f Module.makers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers

