cmake_minimum_required(VERSION 3.30)
project(MyProject LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find GoogleTest
find_package(GTest REQUIRED)

# Add subdirectories
add_subdirectory(src)
add_subdirectory(tests)

# Include header files
include_directories(include)

# make clang work with clang
# source: https://discourse.nixos.org/t/get-clangd-to-find-standard-headers-in-nix-shell/11268/10
# run: cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 in build folder
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()
