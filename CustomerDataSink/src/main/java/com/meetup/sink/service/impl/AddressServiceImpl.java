package com.meetup.sink.service.impl;

import com.meetup.sink.entity.Addresses;
import com.meetup.sink.entity.Customers;
import com.meetup.sink.mapper.AddressMapper;
import com.meetup.sink.mapper.CustomerMapper;
import com.meetup.sink.publisher.TargetIdPublisher;
import com.meetup.sink.repository.AddressRepository;
import com.meetup.sink.repository.CustomersRepository;
import com.meetup.sink.schema.AddressTableFinal;
import com.meetup.sink.schema.CustomerFinal;
import com.meetup.sink.service.AddressService;
import com.meetup.sink.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {

    @Autowired
    AddressMapper addressMapper;

    @Autowired
    AddressRepository addressRepository;


    @Override
    public Addresses handleAddressEvent(String key, AddressTableFinal addressEvent) {
        Addresses address = addressMapper.addressStreamToAddressEntity(key, addressEvent);


        Optional<Addresses> existingAddress = addressRepository.findByCustomerIdAndType(address.getCustomerId(), address.getType());
        if(existingAddress.isEmpty()) {
            //new address
            address = addressRepository.save(address);

        }
        else {
            //perform an update
            address.setId(existingAddress.get().getId());
            address = addressRepository.save(address);
        }

        return address;
    }
}
