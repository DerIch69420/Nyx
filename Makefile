NASM = nasm
LD = ld
ASFLAGS = -f elf64
SRC_DIR = src
OBJ_DIR = obj
OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/constants.o $(OBJ_DIR)/io.o $(OBJ_DIR)/level/1.o

.PHONY: all clean

# Ensure obj and nested directories exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/level:
	mkdir -p $(OBJ_DIR)/level

# Default target
all: $(OBJ_DIR) $(OBJ_DIR)/level nyx

# Compile .asm to .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm
	@echo "Compiling $< ..."
	$(NASM) $(ASFLAGS) $< -o $@

# Link
nyx: $(OBJS)
	@echo "Linking object files ..."
	$(LD) $(OBJS) -o nyx

# Clean
clean:
	@echo "Cleaning up ..."
	rm -rf $(OBJ_DIR) nyx

