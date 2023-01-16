#!/bin/bash

KLIPPER_CONFIG_PATH=~/klipper_config
NEW_KLIPPER_CONFIG_PATH=~/voron-2.4-r2-config/klipper_config/

if ! [[ "$PWD" =~ "$KLIPPER_CONFIG_PATH" ]]; then echo "PWD is not $KLIPPER_CONFIG_PATH" && exit 1; fi


cp -rT $KLIPPER_CONFIG_PATH $NEW_KLIPPER_CONFIG_PATH
echo "Copied configs from $KLIPPER_CONFIG_PATH to $NEW_KLIPPER_CONFIG_PATH"
