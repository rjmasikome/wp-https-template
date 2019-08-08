#!/usr/bin/env bash
if [ -f wp-config.php ]; then
    docker-compose up -d
    exit 1;
fi 
if [ -z $1 ]; then
    echo "First Argument is empty, please put your website base url as first argument"
    exit 1; 
else
    printf "Setting URL: $1 \nYou can set it again manually on wp-config.php file\n"
    echo "..."
    echo "..."
    sed "s|HOST_URL_INPUT|$1|g" wp-config-template.php > wp-config.php
    SALT=$(curl  https://api.wordpress.org/secret-key/1.1/salt/ | tr '\n' '_' | tr -d '[:space:]')
    sed -i s$'\001''REPLACE_SALT'$'\001'$SALT$'\001''g' wp-config.php
    NEWLINE=");\n"
    sed -i s$'\001'');_'$'\001'$NEWLINE$'\001''g' wp-config.php
    DOTSTAR=".*"
    sed -i s$'\001''REPLACE_SALT'$'\001'$DOTSTAR$'\001''g' wp-config.php
    chown 472:472 wp-config.php
fi
if [ ! -d "dbdata" ]; then
    mkdir dbdata
    chown 472:472 dbdata
fi
if [ ! -d "work" ]; then
    mkdir work
    chown 472:472 work
fi
docker-compose up -d