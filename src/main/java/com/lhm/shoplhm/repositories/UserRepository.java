package com.lhm.shoplhm.repositories;

import java.util.List;

import com.lhm.shoplhm.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface UserRepository extends CrudRepository<User, Long>, PagingAndSortingRepository<User, Long>{
    User findByEmail(String email);
    List<User> findByState(String state);
    List<User> findByZipCode(Integer zipCode);
    List<User> findAll();
    List<User> findByStatus(Integer status);
}
