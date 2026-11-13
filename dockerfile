FROM docker.io/searxng/searxng:latest

USER root
RUN mkdir -p /opt/searxng && \
    printf 'use_default_settings: true\nserver:\n  secret_key: "8f4b9c2e7a1d6053e9b84f12c7d6a093e5b18c4f7a2d9061b3e8c5a7d4f2091b"\n  limiter: false\n  port: 8080\n  bind_address: "0.0.0.0"\nsearch:\n  formats:\n    - html\n    - json\n' > /opt/searxng/settings.yml && \
    chown -R 977:977 /opt/searxng

USER 977
ENV SEARXNG_SETTINGS_PATH=/opt/searxng/settings.yml
EXPOSE 8080
