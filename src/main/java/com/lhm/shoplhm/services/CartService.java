package com.lhm.shoplhm.services;

import java.util.List;
import java.util.Optional;

import com.lhm.shoplhm.models.Cart;
import com.lhm.shoplhm.repositories.CartRepository;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	private final CartRepository cartRepository;
	
	public CartService(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}
	//return all the carts
	public List<Cart> allCarts(){
		return cartRepository.findAll();
	}
	//creates a cart
	public Cart createCart(Cart p) {
		return cartRepository.save(p);
	}
	//retrieve a Cart
	public Cart findCart(Long id) {
		Optional<Cart> optionalCart = cartRepository.findById(id);
		if(optionalCart.isPresent()) {
			return optionalCart.get();
		} else {
			return null;
		}
	}
	//delete a Cart
	public void deleteCart(Long id) {
		Cart cart = findCart(id);
		cartRepository.delete(cart);
	}
	
	//return all the products
	public List<Cart> searchCarts(Long id){
		System.out.println("In cartService "+id);
		return cartRepository.findByUser_idContaining(id);
	}
	
	//return all the products
	public List<Cart> searchCartsStatus(Long id, Boolean status){
		return cartRepository.findByUserStatusContaining(id, status);
	}
	
	
//	//update a Cart
//	public Cart updateCart(Long id, String name, String description, float price) {
//		Cart cart = findCart(id);
//		cart.setName(name);
//		cart.setDescription(description);
//		cart.setPrice(price);
//		cartRepository.save(cart);
//		return cart;
//	}
	
//	//return all the carts
//	public List<Cart> searchCarts(String search){
//		return cartRepository.findByDescriptionContaining(search);
//	}
}

