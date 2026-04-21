{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";
  
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "virtio" ];
  
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.displayManager.defaultSession = "hyprland";

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  i18n.extraLocaleSettings = {
    LC_ALL = "de_DE.UTF-8";
  };
 
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
 
  users.users.vinny = {
    isNormalUser = true;
    description = "Vincent Schall";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim 
    git
    curl
    wget
    htop
    fastfetch    
    kitty
    waybar
    wofi
    nwg-look
    firefox
  ];
 
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };
 
  system.stateVersion = "25.11";

}
