#!/usr/bin/env bash

set -e -o pipefail

source ./.env

download_devilbox() {
    if [[ -d $DEVILBOX_FOLDER && ! -f "$DEVILBOX_FOLDER/docker-compose.yml" ]]
    then
        rmdir $DEVILBOX_FOLDER
    fi
    
    if [ ! -d $DEVILBOX_FOLDER ]
    then
        git clone https://github.com/cytopia/devilbox
    fi
}

configure_docker() {
    if [ ! -S /var/run/docker.sock ]
    then
        msg="it's like Docker Service is off. Do you want to start the service? (y/N) "
        read -p "$msg" response
		if [ "${string,}" = 'Y' ]
		then
            pkexec systemctl start docker
        fi
    fi
}

configure_devilbox() {
    if [ ! -f "$DEVILBOX_FOLDER/$DEVILBOX_COMPOSE_FILE" ] \
       && [ -f $CONFIG_SCRIPT ] \
       && [ -d $CONFIG_FOLDER ]
    then
        sh $CONFIG_SCRIPT
    fi

    if [ ! -d $PROJECTS_FOLDER ]
    then
        mkdir -p "projects/$PROJECT_NAME/htdocs/wp-content/themes/$WP_THEME_NAME/dist"
    fi
}

main() {
    download_devilbox

    if [ -d $DEVILBOX_FOLDER ]
    then
        configure_docker

        configure_devilbox

        cd $DEVILBOX_FOLDER
        docker-compose up $DOCKER_SERVICES
    fi
}

main
