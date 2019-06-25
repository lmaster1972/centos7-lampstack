# CentOS 7 Apache, PHP 7.2 Docker image setup

Basic Docker setup to enable a quick start for a LAMP Stack based on CentOS 7 with MariaDB

## TODOs

- [x] Basic setup
- [x] Expose services
- [x] MySQL proper volume mount
 
## How to run

docker-compose up -d

## Services exposed

| Service | Port | Notes |
| --- | --- | --- |
| Apache | 80 | --- |
| MySQL | 3306 | --- |

  * Apache to port 80
  * MariaDB to port 3306

## Hosts within your environment

You'll need to configure your application to use any services you enabled:

| Service | Port | Notes |
| --- | --- | --- |
| www | 80 | --- |
| db | 3306 | --- |

## Docker compose cheatsheet

  * Start containers in background: `docker-compose up -d`
  * Start containers on foreground: `docker-compose up`. You will see a stream of logs for every container running.
  * Stop containers: `docker-compose stop`
  * Kill containers: `docker-compose kill`
  * View container logs: `docker-compose logs`
  * Execute command inside of container: `docker-compose exec SERVICE_NAME COMMAND` where `COMMAND` is whatever you want to run. Examples:
    * Shell into the PHP container, `docker-compose exec www bash`
    * Run symfony console, `docker-compose exec www bin/console`
    * Open a mysql shell, `docker-compose exec db mysql -uroot -pCHOSEN_ROOT_PASSWORD`

## Recommendations

  * Run composer outside of the php container, as doing so would install all your dependencies owned by `root` within your vendor folder.
  * Run commands (ie bash's console) straight inside of your container. You can easily open a shell as described above and do your thing from there.
  * Subfolders called 'www', 'mysql' and 'mysql-dump' are need in order to let container work properly.

## Credits
[PHPDocker](https://phpdocker.io/generator)
[Xdebug with Docker and PHPStorm](https://medium.com/@pablofmorales/xdebug-with-docker-and-phpstorm-786da0d0fad2)

## License
[GPL v3](/LICENSE)
