#================================================================
#STM32 makefile template

# 生成的文件名<项目名>
PROJECT = stm32_led

# 定义文件格式和文件名
TARGET                  := $(PROJECT)
TARGET_ELF              := $(TARGET).elf
TARGET_BIN              := $(TARGET).bin
TARGET_HEX              := $(TARGET).hex
OBJCPFLAGS_ELF_TO_BIN    = -Obinary
OBJCPFLAGS_ELF_TO_HEX    = -Oihex
OBJCPFLAGS_BIN_TO_HEX    = -Ibinary -Oihex

#设定临时性环境变量
export CC       = arm-none-eabi-gcc
export AS       = arm-none-eabi-as
export LD       = arm-none-eabi-ld
export AR 		= arm-none-eabi-ar
export OBJCP    = arm-none-eabi-objcopy

#读取当前工作目录
TOP=$(shell pwd)
# 定义路径
SCRIPT_DIR  := $(TOP)/scripts
STARTUP_DIR := $(TOP)/startup
#设定包含文件目录
INC_FLAGS= -I $(TOP)/CORE \
           -I $(TOP)/bsp/inc \
           -I $(TOP)/hdr \
           -I $(TOP)/stm32f10x_driver/inc \
           -I $(TOP)/SYSTEM \
           -I $(TOP)/USER

# 设置ld链接脚本文件
LDSCRIPT    := $(SCRIPT_DIR)/stm32_flash.ld

# 定义编译标志
CCFLAGS     += -Wall -mcpu=cortex-m3 -mthumb -g -mfloat-abi=soft -march=armv7-m
ASFLAGS     += -Wall -mcpu=cortex-m3 -mthumb
LDFLAGS     += -T $(LDSCRIPT) #-A armv7-m

# .c文件中的头文件引用查找路径
CCFLAGS     += $(INC_FLAGS) -o0 -std=gnu11

# .s文件的flags
#ASFLAGS        +=

# .c文件编译时定义宏
CCFLAGS  += -D STM32F10X_MD_VL \
			-D USE_STDPERIPH_DRIVER

C_SRC=$(shell find ./ -name '*.c')
C_OBJ=$(C_SRC:%.c=%.o)

# 编译命令的定义
COMPILE     = $(CC) $(CCFLAGS) -c $< -o $@
ASSEMBLE    = $(AS) $(ASFLAGS) -c $< -o $@
LDLIBS      = -mthumb -mcpu=cortex-m3 -Wl,--start-group -lc -lm -Wl,--end-group \
		      -specs=nano.specs -specs=nosys.specs -static -Wl,-cref,-u,Reset_Handler \
		      -Wl,-Map=Project.map -Wl,--gc-sections -Wl,--defsym=malloc_getpagesize_P=0x80
LINK = $(CC) $(C_OBJ) $(LDFLAGS) -o $(TARGET_ELF) $(LDLIBS)
ELF_TO_BIN  = $(OBJCP) $(OBJCPFLAGS_ELF_TO_BIN) $< $@
ELF_TO_BIN  = $(OBJCP) $(OBJCPFLAGS_ELF_TO_HEX) $< $@
BIN_TO_HEX  = $(OBJCP) $(OBJCPFLAGS_BIN_TO_HEX) $< $@

.PHONY: all clean program

all:$(C_OBJ)
	$(LINK)
	$(OBJCP) $(TARGET_ELF)  $(TARGET_BIN) $(OBJCPFLAGS_ELF_TO_BIN)
	$(OBJCP) $(TARGET_ELF)  $(TARGET_HEX) $(OBJCPFLAGS_ELF_TO_HEX)
	@echo "build done"

$(C_OBJ):%.o:%.c
	$(COMPILE)

clean:
	rm -f $(shell find ./ -name '*.o')
	rm -f $(shell find ./ -name '*.d')
	rm -f $(shell find ./ -name '*.map')
	rm -f $(shell find ./ -name '*.elf')
	rm -f $(shell find ./ -name '*.bin')
	rm -f $(shell find ./ -name '*.hex')
	@echo "clean done"

program:
	openocd -f /usr/share/openocd/scripts/interface/jlink.cfg \
		-f /usr/share/openocd/scripts/target/stm32f1x.cfg \
		-c init -c halt -c "flash write_image erase $(TARGET_HEX)" -c reset -c shutdown

