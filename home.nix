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
  git rustup lazygit vscodium-fhs neovim cairo

  # Browsers and communication
  firefox tor-browser vesktop

  # Media and creative tools
  cmus tidal-hifi aseprite

  # Gaming
  appimage-run

  # Utils
  fastfetch hyfetch brightnessctl flatpak zip unzip btop senpai
  ];
}
