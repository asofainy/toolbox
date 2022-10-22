#!/bin/bash

apt-get update && apt-get install curl unzip -y

curl https://rclone.org/install.sh | bash