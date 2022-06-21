FROM  mateusclira/spark-operator-aws:latest
LABEL MAINTAINER Mateus Lira
LABEL EMAIL mateusc.lira@gmail.com

#using root
USER root:root

# create directory for applications
RUN mkdir -p /app

#copy jar files
COPY ./jars/ /opt/spark/jars

#set main work directory
WORKDIR /app

#user
USER root