#!/bin/sh

# This lowk needs a nix flake to work so I'll do that later lol
choice=$(fuzzel --dmenu -p dynamic --prompt "LyonOS power options: " << EOF | sed 's/^ *//'
Shutdown
Reboot
Reboot to firmware
Cancel
EOF
)

case "$choice" in
	"Shutdown")
		systemctl poweroff
		;;
	"Reboot")
		systemctl reboot
		;;
	"Reboot to firmware")
		systemctl reboot --firmware-setup
		;;
esac

