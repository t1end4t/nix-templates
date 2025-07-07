{ pkgs, ... }:
{
  scripts.init-project.exec = ''
    ${pkgs.uv}/bin/uv init
    ${pkgs.uv}/bin/uv sync
    ${pkgs.uv}/bin/uv add --dev -r dev-requirements.txt
  '';

  enterShell = ''
    source .devenv/state/venv/bin/activate
  '';
}
