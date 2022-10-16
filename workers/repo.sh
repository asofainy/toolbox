#!/bin/bash 

docker run \
--rm \
-v redmine-repo:/repositories debian:10 /bin/bash -c \ "
    echo ===== `date` ===== ; \
    apt-get update -y && apt-get install git -y ;  \
    rm -rf /repositories/* ;  \
    git clone --bare --progress  https://github.com/a-sofainy/gke /repositories/gke/.git ; \
    git clone --bare --progress  https://github.com/a-sofainy/iredmail /repositories/iredmail/.git ; \
    git clone --bare --progress  https://github.com/a-sofainy/redmine /repositories/redmine/.git "