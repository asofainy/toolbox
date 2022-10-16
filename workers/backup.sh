#!/bin/bash 

app="redmine"
host='172.18.0.30'
username="root"
password="My5QL_p@55"
database="redmine_test"
volume="mysql-data"
path="/data/applications/redmine/backups"
file="dump_`date +'%Y%m%d_%H%M%S'`.sql.gz"

docker run \
--rm \
--name $app-backup-job_`date +'%Y%m%d_%M%s'` \
--hostname job-server.olympus.local \
--network net_1 \
--volume $path:/backup \
-e MYSQL_PWD=$password \
mysql:5.7-debian /bin/bash -c \ "
    echo ===== `date` ===== ; \
    mysqldump -h $host -u  $username --routines --triggers $database | gzip -c > /backup/$file ; \
    echo 'Dump created $file' ; \
    ls -ltrah  /backup/$file ; "

