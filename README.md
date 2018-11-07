# Hospital do Amor - Bioinformática

## Estrutura do projeto

`[nome_dataset]/notebooks`: Nesse diretório serão armazenados os notebooks utilizados na exploração dos datasets.

`[nome_dataset]/src`: Nesse diretório serão armazenados os scripts de ETL do dataset em questão.

`[nome_dataset]/cassandra`: Nesse diretório serão armazenados os scripts com a estrutura de armazenamento no banco de 
dados Cassandra.

`[nome_dataset]/data-spark`: Nesse diretório serão armazenados os datasets à serem processados.

`[nome_dataset]/data-cassandra`: Nesse diretório serão armazenados os dados processados no cassandra.

## Como utilizar

Realize o download do [Miniconda](https://conda.io/miniconda.html), [Docker](https://docs.docker.com/install/) e [Docker Compose](https://docs.docker.com/compose/install/) de acordo com o sistema operacional utilizado; após o download execute os comandos abaixo:

```bash
$ cd [nome_dataset]
$ conda env create -f [nome_dataset].yml
$ docker-compose up
$ source activate [nome_dataset]
```

Após executar os comandos acima o seu ambiente estará pronto para execução dos scripts ETL, para executar os scripts basta seguir o modelo abaixo:

```bash
$ cd src
$ python [nome_script]_etl.py
```