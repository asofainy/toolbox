#!/bin/bash

apt-get update && apt-get install curl uzip -y

curl https://rclone.org/install.sh | bash