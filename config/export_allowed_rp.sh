#!/bin/bash

# wenn satosa und sators_rpmgr auf dem gleichen System installiert sind scp und ssh ersetzen

docker exec -it rpmgr /opt/venv/satosa_rpmgr/bin/python /opt/satosa_rpmgr/satosa_rpmgr/export_allowed_rp.py --entityid http://wkis.qss.wko.at/adfs/services/trust
cd /tmp
docker cp rpmgr:/opt/satosa_rpmgr/export/custom_routing_DecideIfRequesterIsAllowed.yaml .
scp custom_routing_DecideIfRequesterIsAllowed.yaml webwpvqss02:/tmp/custom_routing_DecideIfRequesterIsAllowed.yaml
ssh webwpvqss02  "docker cp /tmp/custom_routing_DecideIfRequesterIsAllowed.yaml satosa:/opt/etc/satosa/plugins/microservices/custom_routing_DecideIfRequesterIsAllowed.yaml"