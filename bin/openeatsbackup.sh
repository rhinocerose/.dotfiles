#!/bin/bash

docker cp openeats_api_1:/code/site-media/ ~/Backups/openeats/
docker exec openeats_db_1 sh -c 'exec mysqldump openeats -uroot -p"$MYSQL_ROOT_PASSWORD"' > ~/Backups/openeats/openeats.sql

