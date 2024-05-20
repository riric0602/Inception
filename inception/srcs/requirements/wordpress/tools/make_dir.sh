#!/bin/sh
if [ ! -d "/home/${USER}/data" ]; then
        mkdir /home/${USER}/data
        mkdir /home/${USER}/data/mariadb
        mkdir /home/${USER}/data/wordpress
fi
