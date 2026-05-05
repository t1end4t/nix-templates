# TypeScript Web App Template

A full-stack TypeScript web application template powered by Nix + devenv.

## Tech Stack

| Layer       | Technology  |
| ----------- | ----------- |
| Backend     | Express.js  |
| Frontend    | React + Vite |
| Language    | TypeScript  |
| Testing     | Vitest      |
| Linting     | ESLint      |
| Formatting  | Prettier    |
| Dev Environment | Nix + devenv |

## Quick Start

```bash
# Initialize the project
nix flake init --template github:the-nix-way/dev-templates#typescript

# Enter the development environment
cd your-project-name
devenv shell

# Install dependencies (auto-run on first entry)
# Then start the dev server
npm run dev
```

## Available Scripts

| Command          | Description                        |
| ---------------- | ---------------------------------- |
| `npm run dev`    | Start both frontend & backend      |
| `npm run server` | Start Express backend only         |
| `npm run client` | Start Vite frontend only           |
| `npm run build`  | Build for production               |
| `npm run test`   | Run tests in watch mode            |
| `npm run test:run` | Run tests once                   |
| `npm run lint`   | Check for linting issues           |
| `npm run lint:fix` | Auto-fix linting issues          |
| `npm run format` | Format code with Prettier          |

## Project Structure

```
├── flake.nix          # Nix development environment
├── package.json       # Dependencies & scripts
├── tsconfig.json      # TypeScript configuration
├── vite.config.ts     # Vite configuration
├── vitest.config.ts   # Vitest configuration
├── eslint.config.js   # ESLint configuration
├── .prettierrc        # Prettier configuration
├── src/
│   ├── server/        # Express backend
│   │   ├── index.ts
│   │   └── index.test.ts
│   └── client/        # React frontend
│       ├── main.tsx
│       ├── App.tsx
│       └── index.html
└── public/            # Static assets
```

## API Endpoints

- `GET /api/health` - Health check
- `GET /api/info` - Application info
- `GET /api/greet?name=...` - Greeting endpoint

## Development

The devenv environment provides:
- Node.js 22
- TypeScript
- ESLint + Prettier
- Vitest
- Vite
- All necessary dev dependencies

Just run `devenv shell` and start coding!
