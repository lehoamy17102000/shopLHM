package com.erictimami.gooddeal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.erictimami.gooddeal.models.Checkout;
import com.erictimami.gooddeal.repositories.CheckoutRepository;


@Service
public class CheckoutService {
	//adding the Checkout repository as a dependency
	private final CheckoutRepository checkoutRepository;
	
	public CheckoutService(CheckoutRepository checkoutRepository) {
		this.checkoutRepository = checkoutRepository;
	}
	//return all the Checkouts
	public List<Checkout> allCheckouts(){
		return checkoutRepository.findAll();
	}
	//creates a Checkout
	public Checkout createCheckout(Checkout c) {
		return checkoutRepository.save(c);
	}
	//retrieve a Checkout
	public Checkout findCheckout(Long id) {
		Optional<Checkout> optionalCheckout = checkoutRepository.findById(id);
		if(optionalCheckout.isPresent()) {
			return optionalCheckout.get();
		} else {
			return null;
		}
	}
	//delete a Checkout
	public void deleteCheckout(Long id) {
		Checkout checkout = findCheckout(id);
		checkoutRepository.delete(checkout);
	}
	//update a Checkout
	public Checkout updateCheckout(Long id, String cardHolder, String cardNumber, String securityCode, String cardExpiration, String addressDelivery, String stateDelivery, Integer zipCodeDelivery) {
		Checkout checkout = findCheckout(id);
		checkout.setCardHolder(cardHolder);
		checkout.setCardNumber(cardNumber);
		checkout.setSecurityCode(securityCode);
		checkout.setCardExpiration(cardExpiration);
		checkout.setAddressDelivery(addressDelivery);
		checkout.setStateDelivery(stateDelivery);
		checkout.setZipCodeDelivery(zipCodeDelivery);
		checkoutRepository.save(checkout);
		return checkout;
	}
}
