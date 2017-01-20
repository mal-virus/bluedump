FROM malthirus/minifi:arm
ENV MINIFI_VERSION=0.1.0

COPY config.yml $MINIFI_HOME/conf/config.yml
