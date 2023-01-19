#!/bin/bash

KLIPPER_LOGS_PATH=~/klipper_logs

if [ -z "$(ls -A $KLIPPER_LOGS_PATH)" ]; then
    echo "The log folder is alredy empty!"
    exit 1
else
    read -p "This will remove all existing files in $KLIPPER_LOGS_PATH. Are you sure? (y/n)" -n 1;
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -r $KLIPPER_LOGS_PATH/*
    else
        echo "Canceling...";
    fi;
fi
