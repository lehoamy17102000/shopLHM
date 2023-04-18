package com.lhm.shoplhm.repositories;

import java.util.List;

import com.lhm.shoplhm.models.Review;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>{
	List<Review> findAll();
	List<Review> findByProduct_id(Long product_id);
}
