#!/bin/bash

OFFSET_RESET_CONFIG="earliest"

function deploy_ksql_file {
  STATUS_OK="200"
  echo "Deploying file $1" 
  grep -v '^--' $1 | \
  tr '\n' ' ' | \
  sed 's/;/;\'$'\n''/g' | \
  sed 's/"/\\\\"/g' | \
  while read stmt; do
     echo '------'
     echo "$stmt"

     if [ ${#stmt} -gt 0 ] ; then
        http_code=$(deploy_ksql_script "$stmt")
        sleep 1
     fi
  done

}

function deploy_ksql_script {

  stmt=$1
  echo "deploying $stmt"

  curl -s -o LastResponse.log -w "%{http_code}" --location --request POST http://localhost:8088/ksql \
  --header 'Accept: application/vnd.ksql.v1+json' \
  --header 'Content-Type: application/vnd.ksql.v1.json' \
  -k -d '{"ksql":"'"$stmt"'", "streamsProperties": { "ksql.streams.auto.offset.reset": "'"$OFFSET_RESET_CONFIG"'" }}' > lastHTTPCode.log 
  cat LastResponse.log     
  http_code=`cat lastHTTPCode.log`
  echo $http_code
}


#create the containers

docker-compose up -d

#sleep for 30 seconds to wait for containers to be up
sleep 30 

#create topics

docker exec -it broker sh /home/appuser/createTopics.sh 

#deploy source_connector
deploy_ksql_file ./postgres-source-connector.txt
echo "sleeping for 5 seconds"
sleep 5 

#deploy target_connector
deploy_ksql_file ./mysql-sink-connector.txt
echo "sleeping for 5 seconds"
sleep 5 

#deploy KSQL scripts
deploy_ksql_file ./ksql_scripts.txt

#delete the default schema for target id registered by ksql to avoid conflict from java app
echo "delete incompatible schema"
curl -X "DELETE" http://localhost:8081/subjects/customers.sink.target.id-value/versions/1

#build and run java sink application
echo "build and run java sink app"
mvn -f CustomerDataSink/pom.xml clean install

nohup java -jar CustomerDataSink/target/customer-data-sink-1.0-SNAPSHOT.jar  > data-sink.log 2>&1 &

