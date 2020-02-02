#!/usr/bin/bash

cp config/bashrc.sh devilbox/bash
cp config/env-project devilbox/.env
cp config/docker-compose.override.yml devilbox/
cp config/bashrc.sh devilbox/bash
cp config/mailhog.ini devilbox/cfg/php-ini-7.3 
cp config/xdebug.ini devilbox/cfg/php-ini-7.3

