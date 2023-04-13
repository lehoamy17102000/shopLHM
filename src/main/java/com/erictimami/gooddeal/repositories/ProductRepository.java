package com.erictimami.gooddeal.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


import com.erictimami.gooddeal.models.Product;



@Repository
public interface ProductRepository extends CrudRepository<Product, Long>, PagingAndSortingRepository<Product, Long>{
	List<Product> findAll();
    // this method find a book by their description
	List<Product> findByDescriptionContaining(String search);
  // this method counts how many titles contain a certain string
//  Long countByTitleContaining(String search);
//  // this method deletes a book that starts with a specific title
//  Long deleteByTitleStartingWith(String search);
	@Query(value="SELECT * FROM products WHERE name = ?1", nativeQuery=true)
    Product findProductByName(String name);
}
