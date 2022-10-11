#!/usr/bin/python3 -u

import subprocess
import urllib.request
import urllib.error
import http.client
import time
import logging
import os

log_file=os.path.splitext(os.path.basename(__file__))[0]+".log"

old_file_handler= logging.FileHandler(log_file)
old_file_handler.setFormatter(logging.Formatter('[%(asctime)s][%(levelname)s] %(message)s'))

old_cons_handler= logging.StreamHandler()
old_cons_handler.setFormatter(logging.Formatter('[%(asctime)s][%(levelname)s] %(message)s'))

logging.basicConfig(
    level=logging.DEBUG,
    format="[%(asctime)s][%(levelname)s] %(message)s",
    handlers=[
        old_file_handler,
        old_cons_handler
    ]
)

new_file_handler= logging.FileHandler(log_file)
new_file_handler.setFormatter(logging.Formatter('%(message)s'))

new_cons_handler= logging.StreamHandler()
new_cons_handler.setFormatter(logging.Formatter('%(message)s'))


logging.info("Indexing the database content")


url = os.environ.get('ELASTICSEARCH_URL')

status = 0

logging.info('Trying to reach ' + url)

new_file_handler.terminator=""
new_cons_handler.terminator=""

log = logging.getLogger()

for hdlr in log.handlers[:]:  # remove all old handlers
    log.removeHandler(hdlr)

log.addHandler(new_file_handler)
log.addHandler(new_cons_handler)

while(status != 200):

    try:
        response = urllib.request.urlopen(url)
        status = 200

    except (urllib.error.URLError, http.client.RemoteDisconnected):      

        logging.info('.')
        time.sleep(1)

subprocess.call(['curl', url])

new_file_handler.terminator="\n"
new_cons_handler.terminator="\n"

for hdlr in log.handlers[:]:  # remove all old handlers
    log.removeHandler(hdlr)

log.addHandler(old_file_handler)
log.addHandler(old_cons_handler)

logging.info('Launching PHP Scripts')

subprocess.call(['php', '/var/www/html/extensions/CirrusSearch/maintenance/UpdateSearchIndexConfig.php'])
subprocess.call(['php', '/var/www/html/extensions/CirrusSearch/maintenance/ForceSearchIndex.php'])

logging.info("==== [ End of configuration ] ====")

