#!/bin/env bash

# Simple script to enable or disable the xdebug extension

case $1 in
  on)
        sudo sudo phpenmod xdebug
        sudo service apache2 restart
        echo "Xdebug is ON"
  ;;
  off)
        sudo sudo phpdismod xdebug
        sudo service apache2 restart
        echo "Xdebug is OFF"
  ;;
  *)
    if [ -f /etc/php/7.0/mods-available/xdebug.ini ]; then
      . ~/scripts/xdebug.bash off
    else
      .  ~/scripts/xdebug.bash on
    fi
  ;;
esac