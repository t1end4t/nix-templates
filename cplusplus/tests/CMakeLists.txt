# Enable testing
enable_testing()

# Create the test executable
add_executable(test_bead_sort test_bead_sort.cpp)

# Link the test executable with the source library (e.g., project_lib) and GoogleTest
# IMPORTANT: Replace 'project_lib' with the actual name of the library 
# that provides the bead_sort implementation.
# target_link_libraries(test_bead_sort PRIVATE project_lib GTest::GTest GTest::Main)
target_link_libraries(test_bead_sort PRIVATE sorts_lib GTest::GTest GTest::Main)

# Add a test
add_test(NAME BeadSortTests COMMAND test_bead_sort)
