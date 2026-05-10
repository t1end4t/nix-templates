# AGENTS.md

This repo contains Nix flake templates for starting execution repos.

## Behavior

- Keep template changes minimal and surgical.
- Do not add project-specific docs, structure docs, or generated planning files to templates.
- Template `AGENTS.md` files are init-stage instructions for future Claude Code/Codex sessions inside projects created from these templates.
- If changing a template, update only that template unless the same rule truly applies to all templates.

## Project context bridge

When a new project is initialized from a template, the agent should check whether the project has useful execution context in `docs/`.

If `docs/` is missing or lacks needed context, suggest creating a bridge between:

- `~/second-brain/1-Projects/<project>/` — source of truth for project thinking
- `<project>/docs/` — execution-ready context for the repo

Do not create the bridge automatically unless the user asks.
