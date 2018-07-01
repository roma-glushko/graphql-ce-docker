# Magento 2 GraphQl Docker Environment

Here is a docker environment for contributing into Magento 2 GraphQl project.

## Preconditions

In order to use this environment the following stack of technologies should be installed:
- Docker for Mac: https://docs.docker.com/docker-for-mac/install/
- PhpStorm IDE

## Installation

### Configuring XDebug

It's needed to change your IP in `docker/docker-compose.yml` file:

``
XDEBUG_REMOTE_HOST=192.168.0.104
``

192.168.0.104 - should be replaced by your IP given by command:

``
ipconfig getifaddr en0
``

### Installing Magento 2 GraphQl repository

Navigate to `src` directory and clone magento/graphql-ce project:

```
cd src
git init
git remote add origin https://github.com/magento/graphql-ce
git fetch && git pull origin 2.3-develop
```

### Configuring hosts file

Need to add a new record to hosts file:

``
127.0.0.1	graphql-os.test
``

### Building docker environment

Navigate to `docker` directory and use docker-compose to build environment:

```
cd docker
docker-compose up -d
```

It can take some time to download all required images and prepare the final environment.

### Install dependencies

Once environment is built, it's possible to connect to `magento_os_graphql_server` server and run composer install:

```
docker exec -it magento_os_graphql_server bash
composer install
```

### Install Magento 2

Now it should be possible to connect to `magento_os_graphql_server` via browser and install Magento 2.
URL will be the following:

`http://graphql-os.test/`

During installation, it will be required to configure DB connection information. It should be the following:
- DB user: `root`
- DB password: `root`
- DB Name: `db`

Basically, we are done on this stage with installing environment.

## Magento 2 GraphQl specific actions

### Install ChromeiQl plugin (optional)

Hopefully, it's very easy to work with GraphQl queries directly from Chrome browser via this extension:

https://chrome.google.com/webstore/detail/chromeiql/fkkiamalmpiidkljmicmjfbieiclmeij

However, this is not required and requests can be sent from any similar client.

### Install ZenHub integration for Github (optional)

The project tasks can be easily managed by ZebHub plugin:

https://chrome.google.com/webstore/detail/zenhub-for-github/ogcgkffhplmphkaahpmffcafajaocjbd

This is optional step and tasks can be viewed in Github, too.

### Enable Developer Mode

In order to enable ability fetching information about possible Query fields, it's needed to switch Magento to
developer mode:

```
docker exec -it magento_os_graphql_server bash
./bin/magento deploy:mode:show developer
```

docker-compose up -d --force-recreate --build
