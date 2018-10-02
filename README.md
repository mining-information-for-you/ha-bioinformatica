# Datasets de sequenciamento genético

Repositório destinado a armazenar os scripts de ETL de datasets de sequenciamento genético utilizados pela MI4U.

## Estrutura do projeto

`[nome_dataset]/notebooks`: Nesse diretório serão armazenados os notebooks utilizados na exploração dos datasets.

`[nome_dataset]/src`: Nesse diretório serão armazenados os scripts de ETL do dataset em questão.

`[nome_dataset]/cassandra`: Nesse diretório serão armazenados os scripts com a estrutura de armazenamento no banco de 
dados Cassandra. Cada script estará nomeado seguindo o padrão 01_nome_script.cql, 02_nome_script.cql ... que indica a
ordem de execução de cada um.

`[nome_dataset]/data`: Nesse diretório serão armazenados os datasets à serem processados.

## Como utilizar

Após a instalação do banco de dados Cassandra, execute os scripts da pasta `[nome_dataset]/cassandra` na ordem indicada.
Para isso utilize o seguinte comando no terminal:

`cqlsh -u nome_usuario -p [nome_dataset]/cassandra -f 01_nome_arquivo.cql`

Isso irá criar toda a estrutura necessária para o processamento do dataset em questão.

Após a criação da estrutura de dados no Cassandra e os datasets serem baixados e inseridos na pasta `[nome_dataset]/data`
os scripts de ETL serão executados. Para isso entre na pasta `[nome_dataset]/src` e execute o comando a seguir:

`$SPARK_HOME/bin/spark-submit --packages com.datastax.spark:spark-cassandra-connector_2.11:2.3.2 
--conf spark.cassandra.connection.host=[endereco_servidor_cassandra] [nome_script_etl].py`

Os argumentos do comando submit apresentados acima são necessários para baixar e disponibilizar o driver que faz
comunicação com o Apache Cassandra, caso eles não sejam informados o script vai dar erro.