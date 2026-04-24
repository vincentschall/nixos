{ config, pkgs, ... }:

{
  home.username = "vinny";
  home.homeDirectory = "/home/vinny";
  home.stateVersion = "25.11";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "exec-once" = [ "waybar" ]; # Startet Waybar automatisch [cite: 11]
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, kitty"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, R, exec, wofi --show drun"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
      ];
      cursor.no_hardware_cursors = true;
      env = [
        "WLR_NO_HARDWARE_CURSORS,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
      ];
      monitor = [ "Virtual-1, preferred, auto, 0.8" ];
      input.kb_layout = "de";
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "battery" "cpu" "memory" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "clock" = {
          format = "{:%H:%M}";
          tooltip-format = "{:%A, %d %B %Y}";
        };

        "network" = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "󰈀  Connected";
          format-disconnected = "  Offline";
        };

        "battery" = {
          format = "{capacity}%";
          format-charging = " {capacity}%";
          format-full = "  {capacity}%";
        };

        "cpu" = {
          format = "  {usage}%";
        };

        "memory" = {
          format = "  {used}MB";
        };

        "tray" = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: Sans;
        font-size: 13px;
      }
      window#waybar {
        background: rgba(43, 48, 59, 0.5);
        color: #ffffff;
      }
      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: white;
        border-bottom: 3px solid transparent;
      }
      #workspaces button.active {
        border-bottom: 3px solid #ffffff;
      }
    '';
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.home-manager.enable = true;
}
