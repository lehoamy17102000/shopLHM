package com.erictimami.gooddeal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.erictimami.gooddeal.models.Category;
import com.erictimami.gooddeal.repositories.CategoryRepository;


@Service
public class CategoryService {
	private final CategoryRepository categoryRepository;
	
	public CategoryService(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}
	
	//return allthe Category
	public List<Category> allCategories(){
		return categoryRepository.findAll();
	}
	//creates a Category
	public Category createCategory(Category c) {
		return categoryRepository.save(c);
	}
	//retrieve a Category
	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepository.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}
	//delete a Category
	public void deleteCategory(Long id) {
		Category category = findCategory(id);
		categoryRepository.delete(category);
	}
	//update a Category
	public Category updateCategory(Long id, String name) {
		Category category = findCategory(id);
		category.setName(name);
		categoryRepository.save(category);
		return category;
	}
}
