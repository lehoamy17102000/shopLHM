package com.lhm.shoplhm.repositories;

import java.util.List;

import com.lhm.shoplhm.models.Category;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long>{
	List<Category> findAll();
    // this method find a book by their description
//  List<Book> findByDescriptionContaining(String search);
//  // this method counts how many titles contain a certain string
//  Long countByTitleContaining(String search);
//  // this method deletes a book that starts with a specific title
//  Long deleteByTitleStartingWith(String search);
}
