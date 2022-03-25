package com.meetup.sink.service.impl;

import com.meetup.sink.publisher.TargetIdPublisher;
import com.meetup.sink.entity.Customers;
import com.meetup.sink.mapper.CustomerMapper;
import com.meetup.sink.repository.CustomersRepository;
import com.meetup.sink.schema.CustomerFinal;
import com.meetup.sink.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerMapper customerMapper;

    @Autowired
    CustomersRepository customersRepository;
    @Autowired
    private TargetIdPublisher targetIdPublisher;

    @Override
    public Customers handleCustomerEvent(String key, CustomerFinal customerEvent) {
        Customers customer = customerMapper.customerStreamToCustomerEnttiy(key, customerEvent);


        Optional<Customers> existingCustomer = customersRepository.findByCustomerId(key);
        if(existingCustomer.isEmpty()) {
            //new customer
            customer = customersRepository.save(customer);
            //publish the new generated PK along with the customerId for lookup table logic
            targetIdPublisher.publishTargetCustomerEvent(customer);
        }
        else {
            //perform an update
            customer.setId(existingCustomer.get().getId());
            customer = customersRepository.save(customer);
        }

        return customer;
    }
}
