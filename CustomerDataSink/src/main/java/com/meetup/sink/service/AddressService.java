package com.meetup.sink.service;

import com.meetup.sink.entity.Addresses;
import com.meetup.sink.schema.AddressTableFinal;

public interface AddressService {

    Addresses handleAddressEvent(String key, AddressTableFinal address);
}
