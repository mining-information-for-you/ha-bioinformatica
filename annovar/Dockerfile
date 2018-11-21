FROM cassandra:3.11.3
MAINTAINER Léo Biscassi <leo.biscassi@kimeratecnologia.com.br>

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda create -n annovar python=3.6 pyspark==2.3.1 \
    && echo "source activate annovar" > ~/.bashrc \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean

COPY cassandra /cassandra_scripts/
COPY src/ /annovar_scripts/
VOLUME /data-spark/