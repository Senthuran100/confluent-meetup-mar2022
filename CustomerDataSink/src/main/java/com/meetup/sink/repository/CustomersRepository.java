package com.meetup.sink.repository;

import com.meetup.sink.entity.Customers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CustomersRepository extends JpaRepository<Customers, Integer> {

    Optional<Customers> findByCustomerId(String customerId);
}
