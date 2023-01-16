#!/bin/bash

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";
KLIPPER_CONFIG_PATH=~/klipper_config/;


function install() {
	echo "Setting up things...";

	# Link .bashrc
	ln -svf "$SCRIPTDIR/.bashrc" ~;

	# Copy klipper_configs
	cp -rT "$SCRIPTDIR/klipper_config/" $KLIPPER_CONFIG_PATH;
	#TODO: Add error handling

	#Reload ~/.bashrc and restart klipper

	source ~/.bashrc;
	echo "Waiting for sudo to restart the klipper service";
	sudo systemctl restart klipper;

	echo "All done!";
}

function update-remote() {
	cp -rT $KLIPPER_CONFIG_PATH "$SCRIPTDIR/klipper_config/ ";
	echo "Copied configs from $KLIPPER_CONFIG_PATH to $SCRIPTDIR/klipper_config/";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	install;
elif [ "$1" == "--update-remote" -o "$1" == "-r" ]; then
	update-remote;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n)" -n 1;
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		install;
	else
		echo "Canceling...";
	fi;
fi;
unset install;
