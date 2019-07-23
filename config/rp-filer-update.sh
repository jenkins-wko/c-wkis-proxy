#!/bin/bash
docker exec -it rpmgr /opt/bin/export_allowed_rp.sh
docker cp rpmgr://opt/satosa_rpmgr/export/custom_routing_DecideIfRequesterIsAllowed.yaml /tmp/custom_routing_DecideIfRequesterIsAllowed.yaml
scp /tmp/custom_routing_DecideIfRequesterIsAllowed.yaml root@10.200.97.1:/tmp
ssh 10.200.97.1 -p 22 -l root -t "docker cp /tmp/custom_routing_DecideIfRequesterIsAllowed.yaml satosa://opt/etc/satosa/plugins/microservices/custom_routing_DecideIfRequesterIsAllowed.yaml"
ssh 10.200.97.1 -p 22 -l root -t "cd /opt/docker/d-satosa/ ; docker-compose restart"
