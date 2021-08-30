TARGET:=rcar3_rom_code.bin 

CROSS_COMPILE?=$(HOME)/devel/cross/aarch64-gcc-7.4.1/bin/aarch64-linux-gnu-
OBJS:=rom_api.o rom_vectors.o 

all: $(TARGET)

clean:
	rm $(OBJS) $(TARGET) rcar3_rom_code.elf

$(TARGET): rcar3_rom_code.elf
	$(CROSS_COMPILE)objcopy -O binary $< $@

rcar3_rom_code.elf: $(OBJS)
	$(CROSS_COMPILE)ld -nostartfiles -nodefaultlibs -nostdlib -g -T rcar3_bootrom.ld -o $@ $?

%.o: %.c
	$(CROSS_COMPILE)gcc -c -march=armv8-a -ggdb3 -Og -mtune=cortex-a57.cortex-a53 -o $@ $<

%.o: %.S
	$(CROSS_COMPILE)gcc -c -march=armv8-a -ggdb3 -Og -mtune=cortex-a57.cortex-a53 -o $@ $<
