# Add sorting algorithm implementations to a library.
# Sources are relative to the current directory (cpp/src/sorts).
add_library(sorts_lib STATIC
    bead_sort.cpp
    # Add other sort_implementation.cpp files here if any exist in this directory
)

# Specify public include directories for the sorts_lib library.
# This makes headers in cpp/include accessible to this library
# and to any other target that links against sorts_lib.
# The path ../../include is relative to CMAKE_CURRENT_SOURCE_DIR (cpp/src/sorts),
# correctly pointing to cpp/include.
target_include_directories(sorts_lib PUBLIC
    ../../include
)

# make clang work with clang
# source: https://discourse.nixos.org/t/get-clangd-to-find-standard-headers-in-nix-shell/11268/10
# run: cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 in build folder
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()
