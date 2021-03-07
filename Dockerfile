FROM bitnami/node-exporter:latest
USER root
RUN apt-get update && apt-get install jq -y && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/
USER 1001
WORKDIR /script/
COPY --chown=1001:1001 getstats.sh /script
COPY --chown=1001:1001 start.sh /script
RUN chmod g+rwX /script

EXPOSE 9100

WORKDIR /opt/bitnami/node-exporter
ENTRYPOINT ["/script/start.sh"]