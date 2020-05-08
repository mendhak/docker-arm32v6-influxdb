
InfluxDB Docker image for Raspberry Pi Zero.  The Raspberry Pi Zero is ARM32v6, and there are no official images from InfluxDB for that specific architecture. 


### Running it

Use docker-compose:

Create a `docker-compose.yml`:

```
version: '3.7'

services: 
    influxdb:
        image: mendhak/arm32v6-influxdb
        container_name: influxdb
        ports: 
            - 8086:8086
        volumes: 
            - ./influxdbdata:/root/.influxdb/data/
            - ./influxdbbackups:/tmp/backups/

```
Then run it:

```
docker-compose up -d
```

It's listening on :8086 by default. Try a `curl localhost:8086/health` 


Running directly:

```
docker run -d --name=influxdb -p 8086:8086 -v $PWD/influxdbdata:/root/.influxdb/data/ mendhak/arm32v6-influxdb
```

Using influx client in the same container to connect to it:

```
docker exec -it influxdb influx

> CREATE DATABASE test
> SHOW DATABASES
name: databases
name
----
_internal
test

> exit
```


Generating a config file:

```
docker run --rm mendhak/arm32v6-influxdb influxd config 
```


Create a DB:

    docker exec -it influxdb influx -execute "CREATE DATABASE test"

Backup DBs:

    docker exec -it influxdb influxd backup -portable /backups/

Restore DBs:

    docker exec -it influxdb influxd restore -portable /backups/



### Building it

DockerHub does not build ARM images, it must be pushed manually. 

docker build -t mendhak/arm32v6-influxdb:1.8.0-1 .

Change the 1.8.0-1 to whatever version of the tar is being downloaded in the Dockerfile. 

Change the tag to `:latest` and push again. 



