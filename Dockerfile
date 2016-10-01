FROM java:openjdk-8-jdk

MAINTAINER andrea.como@gmail.com

ARG cluster_conf

COPY ./resources/mule-ee-distribution-standalone-3.8.1.tar.gz /opt

RUN cd /opt && tar xvzf mule-ee-distribution-standalone-3.8.1.tar.gz && rm mule-ee-distribution-standalone-3.8.1.tar.gz && ln -s /opt/mule-enterprise-standalone-3.8.1 /opt/mule

# Define environment variables.
ENV MULE_HOME /opt/mule

COPY ./resources/$cluster_conf ${MULE_HOME}/.mule/mule-cluster.properties

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port + Hazelcast ports
EXPOSE 8081 5701 54327
