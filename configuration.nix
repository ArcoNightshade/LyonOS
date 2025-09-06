# LyonOS v0.1.1 - WM
# Credits to https://github.com/arconightshade/ AKA Lyon Antoniuk.

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use xanmod kernel.
  boot.kernelPackages = pkgs.linuxPackages_xanmod;

  networking.hostName = "RTS";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  # Locale stuff
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # LyonOS specific stuff
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.displayManager.ly.enable = true;
  services.xserver.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;


  ## Audio + RTKit
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  

  # User stuff, will change during install script [WIP]
  users.users.lyon = {
    isNormalUser = true;
    description = "Lyon";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };


  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  #LyonOS required packages (Stuff WILL break if you remove anything)
  swww
  git
  fuzzel
  waybar
  foot
  nwg-look
  oreo-cursors-plus
  xwayland-satellite
  rust-analyzer
  gcc
  nautilus
  ];


  # List services that you want to enable:
    services = {
    power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };
  };

  powerManagement.cpuFreqGovernor = "power-saver";


  system.stateVersion = "25.05";
}
