package com.meetup.sink.config;

import com.meetup.sink.schema.AddressTableFinal;
import com.meetup.sink.schema.CustomerFinal;
import com.meetup.sink.schema.CustomerIdLookupValue;
import io.confluent.kafka.streams.serdes.avro.SpecificAvroSerde;
import org.apache.kafka.common.serialization.Serde;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomersSerdeConfig {

    @Bean
    public Serde<CustomerFinal> avroCustomersSchema() {
        final SpecificAvroSerde<CustomerFinal> avroInSerde = new SpecificAvroSerde<>();
        return avroInSerde;
    }

    @Bean
    public Serde<CustomerIdLookupValue> avroCustomerIdLookupValueSchema() {
        final SpecificAvroSerde<CustomerIdLookupValue> avroInSerde = new SpecificAvroSerde<>();
        return avroInSerde;
    }

    @Bean
    public Serde<AddressTableFinal> avroAddressTableFinalSchema() {
        final SpecificAvroSerde<AddressTableFinal> avroInSerde = new SpecificAvroSerde<>();
        return avroInSerde;
    }


}
