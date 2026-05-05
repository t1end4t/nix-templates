{
  inputs = {
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs =
    {
      self,
      nixpkgs,
      devenv,
      systems,
      ...
    }@inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = forEachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              {
                packages = [
                  # Node.js LTS
                  pkgs.nodejs_22

                  # TypeScript tooling
                  pkgs.typescript

                  # Linting & formatting
                  pkgs.eslint
                  pkgs.nodePackages.prettier

                  # Testing
                  pkgs.nodePackages.vitest

                  # Build tool
                  pkgs.nodePackages.vite

                  # Utilities
                  pkgs.jq
                  pkgs.curl
                  pkgs.wget
                ];

                # Node.js configuration
                env.NODE_ENV = "development";

                # Auto-initialize project on first entry
                enterShell = ''
                  # Initialize npm if package.json doesn't exist
                  if [ ! -f package.json ]; then
                    echo "📦 Initializing npm project..."
                    npm init -y
                  fi

                  # Install dependencies if node_modules doesn't exist
                  if [ ! -d node_modules ]; then
                    echo "📦 Installing dependencies..."
                    npm install
                  fi

                  echo "✅ TypeScript web app environment ready!"
                  echo ""
                  echo "Useful commands:"
                  echo "  npm run dev       - Start dev server (frontend + backend)"
                  echo "  npm run server    - Start Express backend only"
                  echo "  npm run client    - Start Vite frontend only"
                  echo "  npm run test      - Run Vitest tests"
                  echo "  npm run lint      - Run ESLint"
                  echo "  npm run format    - Run Prettier"
                '';

                # Environment variables
                env.PORT = "3000";
                env.NODE_ENV = "development";
              }
            ];
          };
        }
      );
    };
}
