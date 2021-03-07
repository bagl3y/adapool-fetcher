FROM bitnami/node-exporter:latest
USER root
RUN apt-get update && apt-get install jq -y && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/
WORKDIR /script/
COPY getstats.sh /script
COPY start.sh /script
RUN chmod g+rwX /script

EXPOSE 9100

WORKDIR /opt/bitnami/node-exporter
USER 1001
ENTRYPOINT ["/script/start.sh"]