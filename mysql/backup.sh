#!/bin/bash

MYSQL_PWD=$MYSQL_PWD 
host=$1
username=$2
database=$3
backup_folder=$4
file="dump_${database}_`date +'%Y%m%d_%H%M%S'`.sql.gz"

mkdir -pv $backup_folder

mysqldump -h $host -u $username --routines --triggers $database | gzip -c > $backup_folder/$file 

echo "Dump file $file created :"

ls -ltrah $backup_folder