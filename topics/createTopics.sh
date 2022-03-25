
while IFS="" read -r p || [ -n "$p" ]
do 

 echo 'Creating Topic %s\n' "$p" 

 kafka-topics --create --bootstrap-server \
localhost:9092 --replication-factor 1 --partitions 1 --topic $p 

 echo "topic created"

done < /home/appuser/topics_to_create.txt 
