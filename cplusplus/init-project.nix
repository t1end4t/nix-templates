{ pkgs, ... }:
{
  scripts.init-project.exec = ''
    mkdir build && cd build
    ${pkgs.cmake}/bin/cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -G Ninja
  '';

  scripts.compile-project.exec = ''
    cd build && ninja
    ./"$1"
  '';
}
