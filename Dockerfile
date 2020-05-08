FROM arm32v6/alpine:3.11.6
LABEL maintainer="https://github.com/mendhak/docker-arm32v6-influxdb"

EXPOSE 8086


RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.0_linux_armhf.tar.gz -O influxdb.tar.gz && \
    tar xzvf influxdb.tar.gz && \
    cp influxdb-1.8.0-1/usr/bin/influx /usr/bin/ && \
    cp influxdb-1.8.0-1/usr/bin/influxd /usr/bin/ && \
    rm -rf /influxdb-1.8.0-1 && \
    rm -f /influxdb.tar.gz


CMD ["influxd"]