# any-nix-shell
`fish` and `zsh` support for the `nix run` and `nix-shell` environments of the Nix package manager.

Features:

  * When entering a `nix run` or `nix-shell` environment, the shell stays the same.
  * Inside those environments, your prompt prints the loaded packages to the right.
  * Alternatively, print that information by executing: `nix-shell-info`
  * `nix-shell --command` or the like still execute inside `bash`, such that scripts don't break.

# Installation in the user environment

Execute

```
nix-env -i any-nix-shell -f https://github.com/haslersn/nixpkgs/archive/any-nix-shell-1.1.0.tar.gz
```

and activate the plugin for any number of the following shells:

## `fish`

Add the following to your *~/.config/fish/config.fish*. Create it if it doesn't exist.

```
any-nix-shell fish --info-right | source
```

## `zsh`

Add the following to your *~/.zshrc*. Create it if it doesn't exist.

```
any-nix-shell zsh --info-right | source /dev/stdin
```

# System-wide installation on NixOS

As usual on NixOS, a package can be installed system-wide by adding it to */etc/nixos/configuration.nix*:

```
  environment.systemPackages = with pkgs; [
    #
    # Other packages here ...
    #
    (let
      url = "https://github.com/haslersn/nixpkgs/archive/any-nix-shell-1.1.0.tar.gz";
    in (import (fetchTarball url) {}).any-nix-shell)
  ];
```

Then execute: `sudo nixos-rebuild switch`

The plugin's activation can be done system-wide, but doesn't have to. The system-wide activation is also done in */etc/nixos/configuration.nix*:

## `fish`

```
  programs.fish.enable = true;
  programs.fish.promptInit = ''
    any-nix-shell fish --info-right | source
  '';
```

## `zsh`

```
  programs.zsh.enable = true;
  programs.zsh.promptInit = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';
```

# Customization

The `any-nix-shell` command (which is used for activating the plugin in a specific shell) **optionally** takes any of the following flags:

| Flag | Description |
| - | - |
| `--info-right` | While in a `nix run` or `nix-shell` environment, display information about the loaded packages at the right. |
