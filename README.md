# Demo Repository for Singapore Kafka Meetup March 29th 2022 - Incremental Migration using CDC and KSQL

This demo repository is to show case CDC pipeline using Debezium CDC connector with Kafka, KSQL and Kafka Stream components. The source database is Postgres and target database is MYSQL for the demo

## Prerequisites
- Docker
- Docker Compose
- Open JDK 11
- Maven 
- Any DB Editor for Postgres & MYSQL (e.g. Dbeaver)

## Contents

- Docker compose setup (docker-compose.yaml) to bring up containers for Kafka broker, Zookeeper, Schema Registry, KSQL DB Server, KSQLDB CLI using the confluent images.  MYSQL DB and Postgres DB container images are debezium images
- Debezium connectors for Postgres and MYSQL as well as Confluent JDBC Connect with JDBC jars for different databases. These are present under confluent-hub-components directory. These are available for install usng confluent-hub-client. Refer https://docs.confluent.io/home/connect/self-managed/install.html 
-source_sql and target_sql directories contains SQL scripts initialized in the postgres source DB and MYSQL target DB respectively. These scripts contains the sample tables on both sides for the demo and initialized as part of container creation. This is on top of some sample database/tables available in the images used
- custom-config.conf file present under postgres directory which is used during the postgres container initialization to pass some custom configuration for the debezium postgres connector to work
- topics directory which contains script to create topics as well as a file with the list of topics to create
- postgres-source-connector.txt which has the connector configuration to source data from Postgres DB. This can be executed in KSQL to create an embedded source connector. Source connector is used to replicate the Products table.
- mysql-target-connector.txt which has the connector configuration to sink data to MySQL DB. This can be executed in KSQL to create an embedded sink connector
- ksql_scripts.txt which has the different KSQL scripts used in the demo to create some streams and tables. These scripts are used to replicate the Customers and Addresses table 
- CustomerDataSink is a Springboot project with Spring Cloud Stream used as a Sink Java app. This is used to persist Customer Entities and publish the new primary key from the target DB which can be used by child entities which helps to synchronize creation of a parent entity well before a child entity can be created in target
- setupPipeline.sh is a script which is used to creates and brings up the containers , create topic, deploy connectors and KSQL scripts, build and run the Java sink app. 
- teardownPipeline.sh is a script which stops the java app and deletes the containers

## Demo execution
- Execute the setupPipeline.sh script
```
./setupPipeline.sh
```
- Wait for the containers to be up. Check status 
```
docker ps
```
- Check the tables and data available in Postgres and MySQL from a DB editor

- Connect to the KSQL CLI and check the topics, connectors, streams and tables are created. 
```
docker exec -it ksqldb-cli ksql http://ksqldb-server:8088
--within the KSQL CLI shell execute below commands
show topics;
show connectors;
show streams;
show tables;
```

- Check data in Customers, Addressses and Products table in MySQL. Initial data available in Postgres should have been replicated in MySQL
- Execute the insert/update scripts available in demo_updates_sql/update_scripts.sql in the Postgres DB and follow the same changes reflect in MySQL database
- Stop the pipeline and containers using teardownPipeline.sh script

```
./teardownPipeline.sh
```


