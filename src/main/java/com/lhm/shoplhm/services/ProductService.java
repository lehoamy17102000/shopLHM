package com.lhm.shoplhm.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import com.lhm.shoplhm.models.Product;
import com.lhm.shoplhm.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class ProductService {
	@Autowired
	private final ProductRepository productRepository;
	// static variable to set the number of users that we want per page
	private static final int PAGE_SIZE = 3;
	public Page<Product> productsPerPage(int pageNumber){
		// get all the users page and sort them in ascending order the last name property
		PageRequest pageRequest = new PageRequest(pageNumber, PAGE_SIZE, Sort.Direction.ASC, "name");
		Page<Product> products = productRepository.findAll(pageRequest);
		return productRepository.findAll(pageRequest);
	}
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	//return all the products
	public List<Product> allProducts(){
		return productRepository.findAll();
	}
	//creates a product
	public Product createProduct(Product p) {
		return productRepository.save(p);
	}
	//retrieve a Product
	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepository.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		} else {
			return null;
		}
	}
	//retrieve a Product
	public Product findProductByName(String name) {
		return productRepository.findProductByName(name);
	}
	//delete a Product
	public void deleteProduct(Long id) {
		Product product = findProduct(id);
		productRepository.delete(product);
	}
	//update a Product
	public Product updateProduct(Long id, String name, String description, Double price, int quantity) {
		Product product = findProduct(id);
		product.setName(name);
		product.setDescription(description);
		product.setPrice(price);
		product.setQuantity(quantity);
		productRepository.save(product);
		return product;
	}
	//return all the products
	public List<Product> searchProducts(String search){
		return productRepository.findByDescriptionContaining(search);
	}
}
