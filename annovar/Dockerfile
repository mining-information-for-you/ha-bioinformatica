FROM ubuntu:16.04
MAINTAINER Léo Biscassi <leo.biscassi@kimeratecnologia.com.br>

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa \
    && echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list \
    && apt-get -qq update \
    && apt-get -qq -y install openjdk-8-jdk \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && curl https://www.apache.org/dist/cassandra/KEYS | apt-key add - \
    && apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && apt-get -qq update && apt-get -qq -y install cassandra \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda create -n annovar python=3.6 pyspark==2.3.1 \
    && chown -R cassandra /var/lib/cassandra/ \
    && chown -R cassandra /var/log/cassandra/ \
    && echo "source activate annovar" > ~/.bashrc \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean