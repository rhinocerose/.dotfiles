cd ~/OpenEats
source env_prod.list
sudo cat ~/backups/openeats.sql | sudo docker exec -i openeats_db_1 /usr/bin/mysql -u root -p"$MYSQL_ROOT_PASSWORD" openeats

docker cp ~/backups/. openeats_api_1:/code/site-media/ 
