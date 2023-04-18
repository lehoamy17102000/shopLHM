package com.lhm.shoplhm.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import com.lhm.shoplhm.models.User;
import com.lhm.shoplhm.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService {
	@Autowired
    private final UserRepository userRepository;
	// static variable to set the number of users that we want per page
	private static final int PAGE_SIZE = 3;
	public Page<User> usersPerPage(int pageNumber){
		// get all the users page and sort them in ascending order the last name property
		PageRequest pageRequest = new PageRequest(pageNumber, PAGE_SIZE, Sort.Direction.ASC, "lastName");
		Page<User> users = userRepository.findAll(pageRequest);
		return userRepository.findAll(pageRequest);
	}
	
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    // register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    // find user by state
    public List<User> findByState(String state) {
        return userRepository.findByState(state);
    }
 // find user by status
    public List<User> findByStatus(int status) {
        return userRepository.findByStatus(status);
    }
    // find user by zipCode
    public List<User> findByZipCode(int zipCode) {
        return userRepository.findByZipCode(zipCode);
    }
    public User createUser(User user) {
    	return userRepository.save(user);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    // authenticate user
    public boolean authentificateUser(String email, String password) {
        // first find the user by email
        User user = userRepository.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
	//return all the Users
	public List<User> allUsers(){
		return userRepository.findAll();
	}
	//delete a User
	public void deleteUser(Long id) {
		User user = findUserById(id);
		userRepository.delete(user);
	}
//    //creation the user
//    public User createUser(User user) {
//    	return userRepository.save(user);
//    }
    
}
