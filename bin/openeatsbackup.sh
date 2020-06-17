#!/bin/sh
dir=$HOME/openeats-backups
sudo docker cp openeats_api_1:/code/site-media/ "$dir"
filename=$dir/openeats.sql
if [ ! -f $filename ]
then
    rm -rf $filename && touch $filename
fi
source $HOME/OpenEats/env_prod.list
sudo docker exec openeats_db_1 sh -c 'exec mysqldump openeats -uroot -p"$MYSQL_ROOT_PASSWORD"' > "$filename"
#(cd $dir)
#sudo git commit 