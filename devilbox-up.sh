#!/usr/bin/bash

DEVILBOX_FOLDER='devilbox'
DEVILBOX_COMPOSE_FILE='docker-compose.override.yml'
CONFIG_FOLDER='config'
CONFIG_SCRIPT='devilbox-config.sh'
DOCKER_SERVICES='httpd php mysql livereload mailhog'
PROJECTS_FOLDER='projects'
PROJECT_NAME='my_project'
WP_THEME_NAME='my_theme'

download_devilbox() {
    git clone https://github.com/cytopia/devilbox
}

configure_docker() {
    if [ ! -S /var/run/docker.sock ]
    then
        msg="it's like Docker Service is off. Do you want to start the service? (y/N) "
        read -p "$msg" response
		if [ "${string,}" = 'Y' ]
		then
            systemctl start docker
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
    if [ ! -d $DEVILBOX_FOLDER ]
    then
        download_devilbox
    fi

    if [ -d $DEVILBOX_FOLDER ]
    then
        configure_docker

        configure_devilbox

        cd $DEVILBOX_FOLDER
        docker-compose up $DOCKER_SERVICES
    fi
}

main
