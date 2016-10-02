# Mule ESB EE Trial Dockerfile
Docker Image packaging for **[MuleESB](http://www.mulesoft.org) Enterprise 30-days trial**.

This image is only for *evaluation purpose* unless you are owner of a valid license key.  

Based on work of [vromero/mule](https://github.com/vromero/mule-docker/tree/master) Docker image for CE version.

### Usage

For a simple application using 8081 port as HTTP

```
docker run -d --name muleEsbEE381 -p 8081:8081 -v ~/myAppsDir:/opt/mule/apps -v ~/myLogsDir:/opt/mule/logs andreacomo/mule-ee
```

*Trial period will start after first run*.

#### Noteworthy mount points

| Mount point       | Description                                                     |
|------------------ |-----------------------------------------------------------------|
|/opt/mule/apps     | Mule Application deployment directory                           |
|/opt/mule/domains  | Mule Domains deployment directory                               |
|/opt/mule/conf     | Configuration directory                                         |
|/opt/mule/logs     | Logs directory                                                  |


#### Exposed ports

| Port | Description                                                     |
|----- |-----------------------------------------------------------------|
| 8081 | Default HTTP port                                               |


## Cluster evaluation

In order to evaluate MuleESB cluster capabilities, you can create a cluster with 2 nodes thanks to [**Docker Compose**](https://docs.docker.com/compose/)

 * clone repository from [GitHub](https://github.com/andreacomo/mule-ee-docker)
 * change dir to `cluster`
 * run
  ```
  docker-compose up
  ```
  to launch the cluster and see logs in console, or
 * run
   ```
   docker-compose up -d
   ```
   to launch the cluster in detached mode.
  
Docker Compose will: 
 
 * launch 2 container with MuseESB EE (trial) communicating each other via multicast in a isolated network
 * for `mule-node1` service:
    * bind `mule-node1:8081` to `localhost:8081`
    * mount `/opt/mule/apps` volume to `~/mule-cluster/node1/apps`
    * mount `/opt/mule/logs` volume to `~/mule-cluster/node1/logs`
 * for `mule-node2` service:
    * bind `mule-node2:8081` to `localhost:9081`
    * mount `/opt/mule/apps` volume to `~/mule-cluster/node2/apps`
    * mount `/opt/mule/logs` volume to `~/mule-cluster/node2/logs`
    
Edit `docker-compose.yml` to fit your preferred configuration
