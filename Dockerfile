FROM ubuntu
MAINTAINER helgeho@invelop.de

ENV TERM xterm
EXPOSE 8080
VOLUME /deps
VOLUME /data
VOLUME /notes

RUN apt-get update
RUN apt-get install -y apt-transport-https

RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y vim

# Scala and SBT
RUN apt-get install -y scala
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install -y sbt

# ArchiveSpark
RUN git clone https://github.com/helgeho/ArchiveSpark.git
WORKDIR ArchiveSpark
RUN sbt assemblyPackageDependency
RUN sbt assembly
WORKDIR /

# Spark
RUN wget http://www-us.apache.org/dist/spark/spark-2.0.1/spark-2.0.1-bin-hadoop2.7.tgz
RUN tar xfz spark-2.0.1-bin-hadoop2.7.tgz
RUN rm spark-2.0.1-bin-hadoop2.7.tgz

# Zeppelin
RUN wget http://www-us.apache.org/dist/zeppelin/zeppelin-0.6.2/zeppelin-0.6.2-bin-netinst.tgz
RUN tar xfz zeppelin-0.6.2-bin-netinst.tgz
RUN rm zeppelin-0.6.2-bin-netinst.tgz
WORKDIR zeppelin-0.6.2-bin-netinst

COPY zeppelin-env.sh conf/zeppelin-env.sh.temp
RUN tr "\r" " " < conf/zeppelin-env.sh.temp > conf/zeppelin-env.sh

CMD bin/zeppelin-daemon.sh start && bash