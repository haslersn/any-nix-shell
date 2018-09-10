# fish-nix-shell
fish support for the *nix-shell* environment of the Nix package manager.

## Installation

### Installation in the user environment

Execute

```
nix-env -if https://github.com/haslersn/fish-nix-shell/archive/master.tar.gz
```

and add the following to your *~/.config/fish/config.fish*. Create it if it doesn't exist.

```
fish-nix-shell --info-right | source
```

### System-wide installation

Add the package to your */etc/nixos/configuration.nix*:

```
  environment.systemPackages = with pkgs; [
    #
    # Other packages here ...
    #
    (import (fetchGit "https://github.com/haslersn/fish-nix-shell"))
  ];
```

and then execute: `sudo nixos-rebuild switch`

If you want to configure it system-wide, also add:

```
  programs.fish.enable = true;
  programs.fish.promptInit = ''
    fish-nix-shell --info-right | source
  '';
```

## Flags

The `fish-nix-shell` command **optionally** takes the following flags:

| Flag | Meaning |
| - | - |
| `--info-right` | While in a *fish-nix-shell*, display information about the loaded packages at the right.
