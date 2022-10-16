#!/bin/bash 

subject="[Mail worker] $1"
file="$2"
s=3

docker run \
--rm \
--name redmine-job_mail_`date +'%Y%m%d_%M%s'` \
--hostname mail-worker.olympus.local \
--network net_1 \
--volume /tmp:/tmp \
--volume redmine-repo:/repositories debian:10 /bin/bash -c "
    echo ===== `date` ===== ; \
    apt-get update -y && apt-get install mailutils postfix rsyslog -y > /dev/null ; \ 
    service rsyslog start ; \
    sed -i 's/relayhost =/relayhost = 34.175.16.164:587/g' /etc/postfix/main.cf ; \
    hostname --fqdn > /etc/mailname ; \
    postconf -e smtp_tls_security_level=encrypt  ; \
    service postfix restart ; \
    sleep $s ; \
    mail -s \"$subject\" postmaster@olympus.local < $file ; \
    sleep $s ; \
    echo ''; tail /var/log/mail.log
"
#s=5 , echo -n end in \$s s ; while [ \$s -gt 0 ]; do sleep 1 ; s=$(($s-1)) ; echo -n ' .' ; done ; 
