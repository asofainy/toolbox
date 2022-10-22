#!/bin/bash

. env.sh

src=$1
dest=$2
param="--config=$conf --progress"

echo "[`date +'%d/%m/%Y-%H:%M:%S'`] Copying from $src to $dest  :"

rclone copy $param $src $dest