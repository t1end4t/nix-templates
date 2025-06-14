# Makefile
CC = gcc
CFLAGS = -Wall -g -Iinclude
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
TEST_SRC_DIR = tests

# Source files for main executable
SRCS = $(SRC_DIR)/sorts/bead_sort.c $(SRC_DIR)/main.c
OBJS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRCS))
EXEC = $(BUILD_DIR)/bead_sort

# Source files for test executable
TEST_SRCS = $(TEST_SRC_DIR)/test_bead_sort.c
TEST_OBJS = $(patsubst $(TEST_SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(TEST_SRCS))
TEST_EXEC = $(BUILD_DIR)/test_bead_sort

# Default target
all: $(EXEC)
	./$(EXEC) # Run the executable after building it

# Create build directories if they don't exist
$(shell mkdir -p $(BUILD_DIR)/sorts $(BUILD_DIR)/test)

# Link object files to create main executable
$(EXEC): $(OBJS)
	$(CC) $(OBJS) -o $@

# Compile source files to object files for main executable
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link object files to create test executable
# The test executable needs the bead_sort.o object file
$(TEST_EXEC): $(TEST_OBJS) $(BUILD_DIR)/sorts/bead_sort.o
	$(CC) $(TEST_OBJS) $(BUILD_DIR)/sorts/bead_sort.o -o $@

# Compile source files to object files for test executable
$(BUILD_DIR)/%.o: $(TEST_SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Test target: builds and runs the test executable
test: $(TEST_EXEC)
	./$(TEST_EXEC)

# Clean up
clean:
	rm -rf $(BUILD_DIR)/*

# Phony targets
.PHONY: all clean test
