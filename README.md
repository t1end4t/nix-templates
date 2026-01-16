# nix-templates

To initialize (where ${ENV} is listed in the table below):

```shell
nix flake init --template github:t1end4t/nix-templates#${ENV}
```

# NOTE:

1. To build package to use

```nu
cd current_repo/
nix build
```

2. To use it over-wide in NixOS or update it

```nu
cd current_repo/
nix profile install .#
nix profile upgrade .#
```

3. To remove profile

```nu
nix profile remove <name>
```

4. To remove result/ folder after built

```nu
nix profile remove <name>
```

# Resources:

1. [[https://github.com/the-nix-way/dev-templates]]
