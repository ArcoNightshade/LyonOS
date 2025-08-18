{ config, pkgs, lib, cfgDir, ... }:

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
  krita cmus obsidian tidal-dl tidal-hifi

  # Gaming
  steam lutris prismlauncher wine appimage-run

  # Utils
  fastfetch hyfetch atuin brightnessctl flatpak zip unzip btop senpai
  ];
}
