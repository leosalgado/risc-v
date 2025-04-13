TARGET = hello
SRC = hello.s
OBJ = build/$(TARGET).o
OUT = build/$(TARGET)

AS = riscv64-elf-as
CC = riscv64-elf-gcc

ASFLAGS = 
LDFLAGS = -nostdlib -static

all: $(OUT)

build/$(TARGET).o: $(SRC) | build
	$(AS) $(ASFLAGS) -o $@ $<

build/$(TARGET): build/$(TARGET).o
	$(CC) $(LDFLAGS) -o $@ $<

build:
	mkdir -p build

run: $(OUT)
	qemu-riscv64 ./$(OUT)

clean:
	rm -rf build

