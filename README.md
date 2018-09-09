# fish-nix-shell
fish support for the *nix-shell* environment of the Nix package manager.

## Installation

### Installation in the user environment

Execute:

```
nix-env -if https://github.com/haslersn/fish-nix-shell/archive/master.tar.gz
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

## Features

By default, this package provides the `fish-nix-shell` command which starts a *nix-shell* using *fish*.
In the following, we present
  - how to use it just via `nix-shell` and
  - how to print additional information while inside a *nix-shell* environment.

The described functionality can be enabled by editing to your *~/.config/fish/config.fish* (create it if it doesn't exist) like so

```
# Overwrite the nix-shell command
function nix-shell
  fish-nix-shell $argv
end

# Print additional information inside a nix-shell environment
function fish_right_prompt
  nix-shell-info
end
```

or system-wide by editing your */etc/nixos/configuration.nix* like so:

```
  programs.fish.enable = true;
  programs.fish.promptInit = ''
    # Overwrite the nix-shell command
    function nix-shell
      fish-nix-shell $argv
    end

    # Print additional information inside a nix-shell environment
    function fish_right_prompt
      nix-shell-info
    end
  '';
```
