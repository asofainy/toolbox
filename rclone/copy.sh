#/bin/bash

src=$1
dest=$2

echo "[`date +'%d/%m/%Y-%H:%M:%S'`] Copying from $src to $dest  :"

rclone config --config=/opt/toolbox/config/rclone.conf 
rclone copy --progress $src $dest