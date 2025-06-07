NASM = nasm
LD = ld
ASFLAGS = -f elf64

SRC_DIR = src
OBJ_DIR = obj

# Automatically find all .asm files in src directory and subdirectories
SRC_FILES := $(shell find $(SRC_DIR) -name '*.asm')
# Convert .asm paths to .o paths under obj directory
OBJ_FILES := $(patsubst $(SRC_DIR)/%.asm,$(OBJ_DIR)/%.o,$(SRC_FILES))

.PHONY: all clean

# Default target
all: nyx

# Target to link final executable
nyx: $(OBJ_FILES)
	@echo "Linking object files ..."
	$(LD) $^ -o $@

# Compile .asm to .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm
	@echo "Compiling $< ..."
	@mkdir -p $(dir $@)
	$(NASM) $(ASFLAGS) $< -o $@

# Clean
clean:
	@echo "Cleaning up ..."
	rm -rf $(OBJ_DIR) nyx

