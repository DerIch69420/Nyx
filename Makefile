NASM = nasm
LD = ld
ASFLAGS = -f elf64
SRC_DIR = src
OBJ_DIR = obj
OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/constants.o $(OBJ_DIR)/macros.o $(OBJ_DIR)/io.o $(OBJ_DIR)/location/spawn.o $(OBJ_DIR)/location/forest.o


.PHONY: all clean

# Ensure obj and nested directories exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/location:
	mkdir -p $(OBJ_DIR)/location

# Default target
all: $(OBJ_DIR) $(OBJ_DIR)/location nyx

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

