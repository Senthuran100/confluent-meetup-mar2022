package com.meetup.sink.repository;

import com.meetup.sink.entity.Addresses;
import com.meetup.sink.enums.AddressType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AddressRepository extends JpaRepository<Addresses, Integer> {

    Optional<Addresses> findByCustomerIdAndType(Integer customerId, AddressType type);
}
