#!/usr/bin/env bash

#script for installing magento

host_name="magento-2-4.test"
db_name="magento2"
db_password="randompassword"
admin_username="admin"
admin_password="magento123456"
admin_frontname="smart"
language="en_GB"
currency="GBP"
timezone="Europe/London"
session_save="redis"
deploy_mode="developer"
search_engine="elasticsearch7"

INSTALL_PARAMS=$(cat <<PARAMS
--base-url=https://${host_name}/ \
--db-host=127.0.0.1 --db-name=${db_name} --db-user=root --db-password=${db_password} \
--admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com \
--admin-user=${admin_username} --admin-password=${admin_password} \
--backend-frontname=${admin_frontname} \
--language=${language} --currency=${currency} --timezone=${timezone} \
--search-engine=${search_engine} --elasticsearch-host=127.0.0.1 --elasticsearch-port=9200 --elasticsearch-index-prefix=magento2
--cleanup-database \
--session-save=${session_save} \
--use-rewrites=1
PARAMS
)

printf "Installing magento\n"
./bin/magento setup:install ${INSTALL_PARAMS}

./bin/magento setup:upgrade

printf "Setting deploy mode to:- ${deploy_mode} \n"
./bin/magento deploy:mode:set ${deploy_mode}

printf "Reindeinx\n"
./bin/magento indexer:reindex

./bin/magento cache:flush
