#!/bin/bash

basedir=$(dirname "$0")
. $basedir/env.sh

apt-get update && apt-get install curl unzip -y

curl https://rclone.org/install.sh | bash