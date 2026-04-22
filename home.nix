{ config, pkgs, ... }:

{
  home.username = "vinny";
  home.homeDirectory = "/home/vinny";
  home.stateVersion = "25.11";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
	"$mod, Q, exec, kitty"
	"$mod, C, killactive,"
	"$mod, M, exit,"
	"$mod, R, exec, wofi --show drun"
      ];
      cursor = {
	no_hardware_cursors = true;
      };
      env = [
	"WLR_NO_HARDWARE_CURSORS,1"
	"WLR_RENDERER_ALLOW_SOFTWARE,1"
      ];
      monitor = [
	"Virtual-1, 2560x1600@59.99, 0x0, 1.25"
      ];
      input = {
	kb_layout = "de";
      };
    };
  };
  programs.home-manager.enable = true;
}
