package com.lhm.shoplhm.repositories;

import java.util.List;

import com.lhm.shoplhm.models.Checkout;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CheckoutRepository extends CrudRepository<Checkout, Long> {
	List<Checkout> findAll();
}


