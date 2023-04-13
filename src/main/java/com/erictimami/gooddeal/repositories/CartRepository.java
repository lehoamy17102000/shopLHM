package com.erictimami.gooddeal.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erictimami.gooddeal.models.Cart;


@Repository
public interface CartRepository extends CrudRepository<Cart, Long>{
	List<Cart> findAll();

//	List<Cart> findByUserIdContaining(Long id);
	
  // this method counts how many titles contain a certain string
//  Long countByTitleContaining(String search);
//  // this method deletes a book that starts with a specific title
//  Long deleteByTitleStartingWith(String search);
	
	@Query(value="SELECT * FROM carts WHERE User_id = ?1", nativeQuery=true)
    List<Cart> findByUser_idContaining(Long id);
	
	@Query(value="SELECT * FROM carts WHERE User_id = ?1 and status = ?2", nativeQuery=true)
    List<Cart> findByUserStatusContaining(Long id, Boolean status);
	
}
