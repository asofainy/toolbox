#!/bin/bash

path="/var/opt/data/flat/mirwas/files/cft/archives"
dirs="$path/SFR/in $path/SFR/out $path/BYT/in $path/BYT/out $path/FRM/in $path/FRM/out $path/FRE/in $path/FRE/out"

mtime_a=0
mtime=$((($(date "+%s") - $(date -d "`date +%Y`-01-01 00:00:00" "+%s")) / 86400))
limit=$1
current=1

while [ $current -le $limit ]
do
        date_a=$(date -d -"$mtime_a days" +"%d-%m-%Y %T")
        date_b=$(date -d -"$mtime days" +"%d-%m-%Y %T")

        echo "========================================================="
        echo "du $date_a au $date_b"
        echo "========================================================="

        for dir in $dirs
        do
                echo -ne "$dir:\t"

                size=$[$(find $dir -mtime +${mtime_a} -mtime -$(($mtime)) -printf %s+)0]
                div=1024/1024/1024

                echo "$(awk "BEGIN {print $size/$div}") G"
                #echo "scale=4 ; $[($(find $dir -mtime +${mtime_a} -mtime -$(($mtime)) -printf %s+)0) / 1024]" | bc
        done

        mtime_a=$mtime
        mtime=$((( ($(date "+%s") - $(date -d "`date +%Y`-01-01 00:00:00" "+%s")) +  $(date -d "`date +%Y`-01-01 00:00:00" "+%s") - $(date -d "$(echo $(echo `date +%Y` - $current | bc)-01-01 00:00:00)" "+%s")) / 86400 ))

        current=$(($current + 1))

done