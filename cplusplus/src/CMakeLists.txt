# in cpp/src/sorts and make targets defined there (like sorts_lib) available.
add_subdirectory(sorts)

# Create the main executable from main.cpp.
# Sources are relative to the current directory (cpp/src).
add_executable(main_app main.cpp)

# Link the main_app executable against the sorts_lib.
# This makes the sorting functions available to main.cpp.
target_link_libraries(main_app PRIVATE sorts_lib)

# Specify public include directories for the main_app executable.
# This allows main.cpp to include headers from cpp/include.
# The path ../include is relative to CMAKE_CURRENT_SOURCE_DIR (cpp/src),
# correctly pointing to cpp/include.
target_include_directories(main_app PUBLIC
    ../include
)

# make clang work with clang
# source: https://discourse.nixos.org/t/get-clangd-to-find-standard-headers-in-nix-shell/11268/10
# run: cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 in build folder
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()
