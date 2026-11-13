FROM docker.io/searxng/searxng:latest

RUN mkdir -p /opt/searxng-config
COPY settings.yml /opt/searxng-config/settings.yml
RUN chmod 644 /opt/searxng-config/settings.yml

ENV SEARXNG_SETTINGS_PATH=/opt/searxng-config/settings.yml
EXPOSE 8080
