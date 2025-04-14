NASM = nasm
LD = ld
ASFLAGS = -f elf64
SRC_DIR = src
OBJ_DIR = obj
OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/constants.o $(OBJ_DIR)/io.o

# Ensure that 'obj' directory is created
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Default target
all: $(OBJ_DIR) nyx

# Compile .asm to .o with verbose output
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm | $(OBJ_DIR)
	@echo "Compiling $< ..."
	$(NASM) $(ASFLAGS) $< -o $@

# Link the object files to create the executable
nyx: $(OBJS)
	@echo "Linking object files ..."
	$(LD) $(OBJS) -o nyx

# Clean object files and executable
clean:
	@echo "Cleaning up ..."
	rm -rf $(OBJ_DIR) nyx

