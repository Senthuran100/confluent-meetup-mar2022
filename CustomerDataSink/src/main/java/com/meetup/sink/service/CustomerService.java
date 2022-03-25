package com.meetup.sink.service;

import com.meetup.sink.entity.Customers;
import com.meetup.sink.schema.CustomerFinal;

public interface CustomerService {

    Customers handleCustomerEvent(String key, CustomerFinal customer);
}
