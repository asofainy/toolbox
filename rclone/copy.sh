#/bin/bash

conf_dir="$HOME/.config/rclone"

mkdir -p $conf_dir
mkdir $dest

cat > $HOME/rclone.conf <<EOF
[google_drive]
type = drive
scope = drive
token = {"access_token":"ya29.a0Aa4xrXPQ_FS8cjxjFOT2b9K-ywr6OETAIShrYsf8ORxLMyxEMWvGK9S-TQ-6B-sLxvJBHEeZf6cj9VL6bCdDyl0AJGG0Wh9QelOtvfbMeLH0KN2vS2zXM30vEzIohXSAiOqV3bo7_7zrZOMFqDFgb8-tf1s2aCgYKATASARMSFQEjDvL9KbjPmGdMOBmslGpw0G6QZQ0163","token_type":"Bearer","refresh_token":"1//03Hn5wjPIAPdACgYIARAAGAMSNwF-L9Ir0nq_j9ZVYKTsKUa-uf2cc-3tA4ufeHPQDJ3uwmJm7jYePZeL4xeg3i2ZtiEw8r1n8nE","expiry":"2022-10-08T10:40:58.9162907+01:00"}
team_drive =
EOF


echo "[`date +'%d/%m/%Y-%H:%M:%S'`] Syncing from $src to $dest  :"

rclone copy --progress $src $dest
sudo chown -R $user:$user $dest