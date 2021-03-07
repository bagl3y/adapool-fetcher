#!/bin/bash

/script/getstats.sh &
/opt/bitnami/node-exporter/bin/node_exporter --web.listen-address="0.0.0.0:9100" --collector.textfile.directory=/script --collector.textfile