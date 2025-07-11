{
  description = "Ready-made templates for easily creating flake-driven environments";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  # inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2405.*";

  outputs =
    { self, nixpkgs }:
    let
      overlays = [
        (
          final: prev:
          let
            exec = pkg: "${prev.${pkg}}/bin/${pkg}";
          in
          {
            format = prev.writeScriptBin "format" ''
              ${exec "nixpkgs-fmt"} **/*.nix
            '';
            dvt = prev.writeScriptBin "dvt" ''
              if [ -z $1 ]; then
                echo "no template specified"
                exit 1
              fi

              TEMPLATE=$1

              ${exec "nix"} \
                --experimental-features 'nix-command flakes' \
                flake init \
                --template \
                "github:the-nix-way/dev-templates#''${TEMPLATE}"
            '';
            update = prev.writeScriptBin "update" ''
              for dir in `ls -d */`; do # Iterate through all the templates
                (
                  cd $dir
                  ${exec "nix"} flake update # Update flake.lock
                  ${exec "nix"} flake check  # Make sure things work after the update
                )
              done
            '';
          }
        )
      ];
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system: f { pkgs = import nixpkgs { inherit overlays system; }; }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              format
              update
            ];
          };
        }
      );

      packages = forEachSupportedSystem (
        { pkgs }:
        rec {
          default = dvt;
          inherit (pkgs) dvt;
        }
      );
    }

    //

      {
        templates = rec {
          python.path = ./python;
          rust.path = ./rust;
          haskell.path = ./haskell;
          modern-c.path = ./modern-c;

          # Aliases
          py = python;
          rs = rust;
          hs = haskell;
          c = modern-c;
        };
      };
}
