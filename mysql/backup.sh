#!/bin/bash

MYSQL_PWD=$MYSQL_PWD 
host=$1
username=$2
database=$3
file="dump_$database_`date +'%Y%m%d_%H%M%S'`.sql.gz"
backup_folder="/backup"

mkdir -pv /backup/$app 
mysqldump -h $host -u $username --routines --triggers $database | gzip -c > $backup_folder/$file 
echo "Dump file $file created :"
ls -ltrah $backup_folder