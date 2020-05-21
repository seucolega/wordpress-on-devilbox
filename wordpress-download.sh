#!/usr/bin/env bash

set -e -o pipefail

source ./.env

configure_wordpress() {
    if [ ! -f "projects/$PROJECT_NAME/htdocs/wp-config-sample.php" ]
    then
        cd $DEVILBOX_FOLDER
        docker-compose exec --user devilbox php bash -l \
            -c "wp core download --path=/shared/httpd/$PROJECT_NAME/htdocs --locale=pt_BR"
    fi
}

configure_wordpress
