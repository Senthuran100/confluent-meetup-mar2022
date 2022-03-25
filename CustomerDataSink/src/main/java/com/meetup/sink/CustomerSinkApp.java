package com.meetup.sink;

import com.meetup.sink.schema.AddressTableFinal;
import com.meetup.sink.schema.CustomerFinal;
import com.meetup.sink.service.AddressService;
import com.meetup.sink.service.CustomerService;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.streams.kstream.KStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.function.Consumer;

@SpringBootApplication
@EnableScheduling
@Slf4j

public class CustomerSinkApp {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private AddressService addressService;

    public static void main(String[] args) {
        SpringApplication.run(CustomerSinkApp.class, args);
    }

    @Bean
    public Consumer<KStream<String, CustomerFinal>> customerTableSink() {
        return input -> {
            input.peek(((key, value) -> {
                log.info("key for final message is {} and value {} ", key, value.toString());
                customerService.handleCustomerEvent(key, value);
            }));

        };
    }

    @Bean
    public Consumer<KStream<String, AddressTableFinal>> addressTableSink() {
        return input -> {
            input.peek(((key, value) -> {
                log.info("key for address final message is {} and value {} ", key, value.toString());
                addressService.handleAddressEvent(key, value);
            }));

        };
    }
}
