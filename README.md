# Hospital do Amor - Bioinformática

## Estrutura do projeto

`[nome_dataset]/notebooks`: Nesse diretório serão armazenados os notebooks utilizados na exploração dos datasets.

`[nome_dataset]/src`: Nesse diretório serão armazenados os scripts de ETL do dataset em questão.

`[nome_dataset]/cassandra`: Nesse diretório serão armazenados os scripts com a estrutura de armazenamento no banco de 
dados Cassandra.

`[nome_dataset]/data-spark`: Nesse diretório serão armazenados os datasets à serem processados.

`[nome_dataset]/data-cassandra`: Nesse diretório serão armazenados os dados processados no cassandra.

## Como utilizar

Realize o download do [Docker](https://docs.docker.com/install/); após o download execute os comandos abaixo:

```bash
$ docker un --name cassandra -p 9042:9042 -v /path/to/data-cassandra:/var/lib/cassandra --rm -d mi4u/annovar:0.0.1-rc
$ docker run -it --link cassandra:cassandra --rm mi4u/annovar:0.0.1-rc cqlsh cassandra -f /cassandra_scripts/ha_bioinformatica.cql
$ screen
$ docker run -it --name annovar --link cassandra:cassandra --rm mi4u/annovar:0.0.1-rc /bin/bash
$ spark-submit --packages datastax:spark-cassandra-connector:2.3.1-s_2.11 --conf spark.cassandra.connection.host=[CassandraIP] /annovar_scripts/[nome_script].py 
```

Onde `[CassandraIP]` deve ser substituido pelo endereço IP do container rodando o cassandra, podemos identificar essa informação com o seguinte comando:

```bash
$ docker inspect cassandra | grep -m1 \"IPAddress\":
```

e o `[nome_script].py` deve ser o nome de uns dos scripts localizados dentro da pasta `annovar_scripts` no container.

O passo referente ao *screen* é importante para não perdermos as atividades que estão sendo executadas no container caso precisemos nos desconectador do servidor.
Para dar `detach` na sessão *screen* é só apertar CTRL + A e CTRL + D de uma vez. Para conectar novamente na sessão, veja as sessões abertas com `screen -ls` e após isso
conecte com `screen -r [numero_sessao]`.