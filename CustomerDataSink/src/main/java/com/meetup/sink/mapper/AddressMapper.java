package com.meetup.sink.mapper;

import com.meetup.sink.entity.Addresses;
import com.meetup.sink.enums.AddressType;
import com.meetup.sink.schema.AddressTableFinal;
import org.springframework.stereotype.Component;


@Component
public class AddressMapper {

    public Addresses addressStreamToAddressEntity(String key, AddressTableFinal addressFinal) {
        Addresses address = new Addresses();
        //set target customer id which is technical id / pk on customer table as customer id in child entity
        address.setCustomerId(addressFinal.getTARGETCUSTOMERID().intValue());
        address.setAddressLine1(addressFinal.getADDRESSLINE1().toString());
        address.setStreet(addressFinal.getADDRESSLINE2().toString());
        address.setCity(addressFinal.getCITY().toString());
        address.setState(addressFinal.getSTATE().toString());
        address.setZip(addressFinal.getZIP().toString());
        //Address Type set to LIVING address
        address.setType(AddressType.LIVING);
        return address;
    }
}
