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
