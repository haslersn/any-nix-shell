# any-nix-shell

`fish`, `xonsh`, and `zsh` support for the `nix run` and `nix-shell`
environments of the Nix package manager.

Features:

* When entering a `nix run` or `nix-shell` environment, the shell stays the same.
* Inside those environments, your prompt prints the loaded packages to the right.
* Alternatively, print that information by executing: `nix-shell-info`
* `nix-shell --command` or the like still execute inside `bash`, such that scripts don't break.

## Installation

any-nix-shell can be installed from stable nixpkgs.
For instance,

```console
$ nix-env -i any-nix-shell
```

installs `any-nix-shell` into your user environment.

## Enabling

In the following we describe how to enable the `any-nix-shell` plugin
for your user.
This differs slightly among `fish`, `xonsh`, and `zsh`.

### `fish`

Add the following to your *~/.config/fish/config.fish*.
Create it if it doesn't exist.

```fish
any-nix-shell fish --info-right | source
```

### `xonsh`

Add the following to your `xonsh`
[configuration file](https://xon.sh/xonshrc.html).
(Create it if it doesn't exist.)

```xonsh
execx($(any-nix-shell xonsh --info-right))
```

### `zsh`

Add the following to your *~/.zshrc*.
Create it if it doesn't exist.

```zsh
any-nix-shell zsh --info-right | source /dev/stdin
```

## System-wide enabling on NixOS

Alternatively the `any-nix-shell` plugin can be enabled system-wide.
This enables it for every user.
To do so, add the following to your configuration (*/etc/nixos/configuration.nix*).

### `fish`

```nix
{
  programs.fish.enable = true;
  programs.fish.promptInit = ''
    any-nix-shell fish --info-right | source
  '';
}
```

### `xonsh`

```nix
{
  programs.xonsh.enable = true;
  programs.xonsh.config = ''
    execx($(any-nix-shell xonsh --info-right))
  '';
}
```

### `zsh`

```nix
{
  programs.zsh.enable = true;
  programs.zsh.promptInit = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';
}
```

### `zsh` with home-manager

```nix
{
  programs.zsh.enable = true;
  programs.zsh.initExtra = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';
}
```

## Customization

The `any-nix-shell` command (which is used for enabling the plugin in a specific shell) **optionally** takes any of the following flags:

| Flag | Description |
| - | - |
| `--info-right` | While in a `nix shell` or `nix-shell` environment, display information about the loaded packages at the right. |
