# any-nix-shell
fish and zsh support for the *nix run* and *nix-shell* environments of the Nix package manager.

## Installation in the user environment

Execute:

```
nix-env -i any-nix-shell -f https://github.com/haslersn/nixpkgs/archive/any-nix-shell-1.0.0.tar.gz
```

### fish: activation

Add the following to your *~/.config/fish/config.fish*. Create it if it doesn't exist.

```
any-nix-shell fish --info-right | source
```

### zsh: activation

Add the following to your *~/.zshrc*. Create it if it doesn't exist.

```
any-nix-shell zsh --info-right | source /dev/stdin
```

## System-wide installation

Add the package to your */etc/nixos/configuration.nix*:

```
  environment.systemPackages = with pkgs; [
    #
    # Other packages here ...
    #
    (let
      url = "https://github.com/haslersn/nixpkgs/archive/any-nix-shell-1.0.0.tar.gz";
    in (import (fetchTarball url) {}).any-nix-shell)
  ];
```

and then execute: `sudo nixos-rebuild switch`

The activation can either be done system-wide or in the user environment.
For activation in the user environment, see above.

### fish: system-wide activation

```
  programs.fish.enable = true;
  programs.fish.promptInit = ''
    any-nix-shell fish --info-right | source
  '';
```

### zsh: system-wide activation

```
  programs.zsh.enable = true;
  programs.zsh.promptInit = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';
```

## Flags

The `any-nix-shell` command **optionally** takes any of the following flags:

| Flag | Meaning |
| - | - |
| `--info-right` | While in a *nix-shell*, display information about the loaded packages at the right. |
