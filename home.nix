# Matching home.nix packaged with LyonOS

{ config, pkgs, lib, ... }:

{
  home.username = "lyon";
  home.homeDirectory = "/home/lyon";
  home.stateVersion = "25.05";

  # Enable Home Manager programs
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
  # Terminals and shells
  foot fish

  # Dev tools
  git rustup lazygit vscodium-fhs neovim gh gh-contribs atuin haskell.compiler.native-bignum.ghcHEAD haskellPackages.ghcup

  # Browsers and communication
  firefox tor-browser vesktop

  # Media and creative tools
  cmus tidal-hifi aseprite

  # Gaming
  appimage-run

  # Utils
  fastfetch hyfetch brightnessctl flatpak zip unzip btop senpai lsd
  ];
}
