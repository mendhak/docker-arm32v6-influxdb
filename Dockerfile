FROM arm32v6/alpine:3.11.6

EXPOSE 8086

# From downloads: https://portal.influxdata.com/downloads/
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.0_linux_armhf.tar.gz -O influxdb.tar.gz && \
    tar xzvf influxdb.tar.gz && \
    mv influxdb-1.8.0-1 influxdb && \
    rm -f influxdb.tar.gz

CMD ["/influxdb/usr/bin/influxd"]