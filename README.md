# Magento 2 apple mac dev environment setup using [valet+](https://github.com/weprovide/valet-plus) and [docker](https://www.docker.com/products/docker-desktop/)

- valet+ for php and nginx
- rest of the services using docker-compose, because there isn't a way to switch mysql version in valet+

Issues when installing valet+ on macOS Monterey

- [Failing to make](https://github.com/henkrehorst/homebrew-php/issues/158) when installing php7.4
  - solution https://github.com/henkrehorst/homebrew-php/issues/158#issuecomment-1059516450

- ```brew install composer``` will try to update php and may fail, in which case run the same command again

## Steps

- install [valet+](https://github.com/weprovide/valet-plus/wiki/Installation)
- install docker desktop
- stop mysql ```brew services stop mysql@5.7``` installed with valet+ if using docker compose for database
- copy docker-compose.yml in project root
- replace **m24** prefix in network, volume names with project name and everywhere in docker-compose.yml file
- install magento code via composer in **$PROJECT_ROOT/src**
- update params in **install-magento.sh** and copy **install-magento.sh** in src directory
- run **install-magento.sh**

## Linking folders to domains
- run ```valet link {domain-name}``` in $PROJECT_ROOT src directory, e.g. **valet link newfashion**
- run ```valet secure {domain-name}``` to secure the domain
- after above steps you can browse magento2 project on https://domain-name.test, e.g. https://newfashion.test

[Multi store setup](https://github.com/weprovide/valet-plus/issues/77)