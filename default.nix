with import <nixpkgs> {}; stdenv.mkDerivation rec {
  name = "any-nix-shell";
  src = fetchGit "https://github.com/haslersn/any-nix-shell";
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out
    cp LICENSE $out
    cp -r bin $out
    wrapProgram $out/bin/any-nix-shell
    wrapProgram $out/bin/any-nix-shell-wrapper
    wrapProgram $out/bin/nix-shell-info
  '';
  meta.description = "fish and zsh support for the nix-shell environment of the Nix package manager.";
  meta.license = "MIT";
  meta.homepage = https://github.com/haslersn/any-nix-shell;
}