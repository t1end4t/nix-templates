{ pkgs, ... }:
{
  scripts.init-project.exec = ''
    if [ ! -f package.json ]; then
      ${pkgs.nodejs}/bin/npm init -y
    fi

    # Install TypeScript and essential dev dependencies
    ${pkgs.nodejs}/bin/npm install --save-dev typescript @types/node ts-node nodemon

    # Create tsconfig.json if it doesn't exist
    if [ ! -f tsconfig.json ]; then
      ${pkgs.nodejs}/bin/npx tsc --init --target es2020 --module commonjs --outDir ./dist --rootDir ./src --strict --esModuleInterop --skipLibCheck
    fi

    # Create basic project structure
    mkdir -p src
    if [ ! -f src/index.ts ]; then
      echo 'console.log("Hello, TypeScript!");' > src/index.ts
    fi

    # Add scripts to package.json
    ${pkgs.nodejs}/bin/npm pkg set scripts.build="tsc"
    ${pkgs.nodejs}/bin/npm pkg set scripts.start="node dist/index.js"
    ${pkgs.nodejs}/bin/npm pkg set scripts.dev="nodemon --exec ts-node src/index.ts"
    ${pkgs.nodejs}/bin/npm pkg set scripts.clean="rm -rf dist"
  '';

  enterShell = ''
    echo "TypeScript development environment ready!"
    echo "Run 'init-project' to set up a new TypeScript project"
    echo "Available commands:"
    echo "  npm run dev    - Start development server with hot reload"
    echo "  npm run build  - Compile TypeScript to JavaScript"
    echo "  npm run start  - Run compiled JavaScript"
    echo "  npm run clean  - Clean build directory"
  '';
}