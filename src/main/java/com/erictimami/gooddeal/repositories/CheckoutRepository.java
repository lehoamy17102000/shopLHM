package com.erictimami.gooddeal.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erictimami.gooddeal.models.Checkout;


@Repository
public interface CheckoutRepository extends CrudRepository<Checkout, Long> {
	List<Checkout> findAll();
}


