FROM mule-ee

MAINTAINER andrea.como@gmail.com

ARG cluster_conf

COPY ./resources/$cluster_conf ${MULE_HOME}/.mule/mule-cluster.properties

# Hazelcast ports
EXPOSE 5701 54327
