{ config, pkgs, ... }:

{
	home.username = "vinny";
	home.homeDirectory = "/home/vinny";
	home.stateVersion = "25.11";

	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"exec-once" = [ "waybar" ]; 
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
					"$mod, 1, workspace, 1" 
					"$mod, 2, workspace, 2" 
					"$mod, 3, workspace, 3" 
					"$mod, 4, workspace, 4" 
					"$mod, 5, workspace, 5" 
					"$mod, 6, workspace, 6" 
					"$mod, 7, workspace, 7" 
					"$mod, 8, workspace, 8" 
					"$mod, 9, workspace, 9" 
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


	home.file.".config/waybar/config".source = ./waybar/config.jsonc;
	home.file.".config/waybar/style.css".source = ./waybar/style.css;


	fonts.fontconfig.enable = true;
	home.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
	];

	programs.home-manager.enable = true;
}
