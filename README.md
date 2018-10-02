# Datasets de sequenciamento genético

Repositório destinado a armazenar os scripts de ETL de datasets de sequenciamento genético utilizados pela MI4U.

## Estrutura do projeto

`[nome_dataset]/notebooks`: Nesse diretório serão armazenados os notebooks utilizados na exploração dos datasets.

`[nome_dataset]/src`: Nesse diretório serão armazenados os scripts de ETL do dataset em questão.

`[nome_dataset]/cassandra`: Nesse diretório serão armazenados os scripts com a estrutura de armazenamento no banco de 
dados Cassandra. Cada script estará nomeado seguindo o padrão 01_nome_script.cql, 02_nome_script.cql ... que indica a
ordem de execução de cada um.

## Como utilizar

Após a instalação do banco de dados Cassandra, execute os scripts da pasta `[nome_dataset]/cassandra` na ordem indicada.
Para isso utilize o seguinte comando no terminal:

`cqlsh -u nome_usuario -p [nome_dataset]/cassandra -f 01_nome_arquivo.cql`

Isso irá criar toda a estrutura necessária para o processamento do dataset em questão.