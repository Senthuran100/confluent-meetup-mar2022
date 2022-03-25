package com.meetup.sink.publisher;

import com.meetup.sink.entity.Customers;
import com.meetup.sink.schema.CustomerIdLookupValue;
import io.confluent.kafka.serializers.AbstractKafkaSchemaSerDeConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.Properties;

@Component
@Slf4j
public class TargetIdPublisher {
    @Value("${customer.target.id.topic}")
    private String customerTargetTopic;

    KafkaProducer<String, CustomerIdLookupValue> kafkaProducer;

    @PostConstruct
    public void init() {
        Properties props = new Properties();
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:29092");
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, io.confluent.kafka.serializers.KafkaAvroSerializer.class);
        props.put(AbstractKafkaSchemaSerDeConfig.SCHEMA_REGISTRY_URL_CONFIG, "http://localhost:8081");
        kafkaProducer = new KafkaProducer<>(props);
    }


    public void publishTargetCustomerEvent(Customers customer) {
        try {
            CustomerIdLookupValue lookupValue = CustomerIdLookupValue.newBuilder().setCUSTOMERID(customer.getCustomerId()).setID(customer.getId()).build();
            ProducerRecord<String, CustomerIdLookupValue> record = new ProducerRecord<>(customerTargetTopic, lookupValue);

            kafkaProducer.send(record);

            log.info(String.format(" Published customer Id  %s and target Id %s \n", customer.getCustomerId(), customer.getId().toString()));
        }
        catch(Exception e) {
            log.error("exception publishing msg", e);
        }

    }



    @PreDestroy
    public void destroy() {
        kafkaProducer.close();
    }


}
