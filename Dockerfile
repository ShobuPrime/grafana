FROM grafana/grafana:latest

# Attempting to fix file permissions from container to shared volume
# When using mkdir command, I need to specify -p to create parents as necessary. Otherwise, this line will fail
#RUN mkdir -p /shared/grafana_data
#RUN mkdir -p /shared/grafana_backup

ENV USER_ID=1000
ENV GROUP_ID=1000

#RUN usermod -u ${USER_ID} ${ZAMMAD_USER}
#RUN groupmod -g ${GROUP_ID} ${ZAMMAD_USER}

RUN chown -R ${USER_ID}:${GROUP_ID} /var/lib/grafana

#RUN usermod -u ${USER_ID} grafana
#RUN usermod -g ${GROUP_ID} grafana

USER grafana

ENTRYPOINT [ "/grafana_run.sh" ]
