#!/bin/bash

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";
KLIPPER_CONFIG_PATH="~/klipper_config/";
KLIPPER_LED_EFFECT_PATH = "~/klipper-led_effect/";
KLIPPER_Z_CALIBRATION_PATH = "~/klipper_z_calibration/";

function install() {
	echo "Copying files from $SCRIPTDIR/klipper_config/ to $KLIPPER_CONFIG_PATH";
	cp -rTv "$SCRIPTDIR/klipper_config/" $KLIPPER_CONFIG_PATH;
	
	echo 'Copying submodules "klipper_z_calibration" and "klipper-led_effect" from $SCRIPTDIR/klipper_config/ to $HOME';
	cp -rTv "$SCRIPTDIR/klipper_z_calibration/" $KLIPPER_Z_CALIBRATION_PATH;
	cp -rTv "$SCRIPTDIR/klipper-led_effect/" $KLIPPER_LED_EFFECT_PATH;

	echo "Restarting the klipper service...";
	systemctl restart klipper;

	echo "All done!";
}

function update-remote() {
	echo "Copying configs from $KLIPPER_CONFIG_PATH to $SCRIPTDIR/klipper_config/";
	rm -rf "$SCRIPTDIR/klipper_config"
	cp -rV "$KLIPPER_CONFIG_PATH" "$SCRIPTDIR/";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	install;
elif [ "$1" == "--update-remote" -o "$1" == "-r" ]; then
	update-remote;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n)" -n 1;
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		git pull origin main; git checkout main --force;
		install;
	else
		echo "Canceling...";
	fi;
fi;
unset install;
