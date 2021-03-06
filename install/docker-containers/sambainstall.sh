#!/env/bash
sudo docker run -it -p 139:139 -p 445:445 \
            -v /path/to/directory:/mount \
            -d dperson/samba -p \
            -u "example1;badpass" \
            -u "example2;badpass" \
            -s "public;/share" \
            -s "users;/srv;no;no;no;example1,example2" \
            -s "example1 private share;/example1;no;no;no;example1" \
            -s "example2 private share;/example2;no;no;no;example2"
