# WordPress on Devilbox

Setup to start new projects using [WordPress](https://wordpress.org/) in the [Devilbox](https://devilbox.org/) development environment.

## Configure Docker

Enter the root folder of the repository.

Using Linux/Mac:

```bash
./devilbox-config.sh
```

Using Windows:

```bash
devilbox-config.bat
```

## Start Docker

The `docker-compose` command needs to be run in the `devilbox` folder.

Start necessary services for the project:

```bash
docker-compose up httpd php mysql livereload mailhog
```

## Project

### Install WordPress

```bash
docker-compose exec --user devilbox php bash -l \
    -c "wp core download --path=/shared/httpd/my_project/htdocs --locale=pt_BR"
```

### Install Composer packages

```bash
docker-compose exec --user devilbox php bash -l \
    -c "composer install -d /shared/httpd/my_project/htdocs/wp-content/themes/my_theme"
```

### Install Node packages

```bash
docker-compose exec --user devilbox php bash -l \
    -c "npm install --prefix /shared/httpd/my_project/htdocs/wp-content/themes/my_theme"
```

### Environments

#### Development

```bash
docker-compose exec --user devilbox php bash -l \
    -c "npm run dev --prefix /shared/httpd/my_project/htdocs/wp-content/themes/my_theme"
```

#### Production

```bash
docker-compose exec --user devilbox php bash -l \
    -c "npm run prod --prefix /shared/httpd/my_project/htdocs/wp-content/themes/my_theme"
```

### Enter the PHP container

Enter the `devilbox` folder:

```bash
cd devilbox
```

Using Linux/Mac:

```bash
./shell.sh
```

Using Windows:

```bash
shell.bat
```

Inside the container, you can enter development mode by running `start` or create files for production with `build`.
