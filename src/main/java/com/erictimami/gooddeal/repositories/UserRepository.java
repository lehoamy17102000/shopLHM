package com.erictimami.gooddeal.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.erictimami.gooddeal.models.User;


@Repository
public interface UserRepository extends CrudRepository<User, Long>, PagingAndSortingRepository<User, Long>{
    User findByEmail(String email);
    List<User> findByState(String state);
    List<User> findByZipCode(Integer zipCode);
    List<User> findAll();
    List<User> findByStatus(Integer status);
}