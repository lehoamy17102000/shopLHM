package com.erictimami.gooddeal.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erictimami.gooddeal.models.Cart;
import com.erictimami.gooddeal.models.Product;
import com.erictimami.gooddeal.models.User;
import com.erictimami.gooddeal.services.CartService;
import com.erictimami.gooddeal.services.ProductService;
import com.erictimami.gooddeal.services.UserService;
import com.erictimami.gooddeal.validators.UserValidator;

@Controller
public class UserController {
	private final UserService userService;
	private final UserValidator userValidator;
	private final ProductService productService;
	private final CartService cartService;
	public static int kindSearch;
	public static int statusGlobal;
	public static String emailGlobal;
	public static String stateGlobal;
	public static int zipCodeGlobal;
	public static String searchGlobal;
	public static Double sumPrice = 0.00;

	public UserController(UserService userService, ProductService productService, UserValidator userValidator, CartService cartService) {
		this.userService = userService;
		this.productService = productService;
		this.cartService = cartService;
		this.userValidator = userValidator;	
		
	}
    @RequestMapping("/login")
    public String login(@ModelAttribute("user") User user) {
        return "/regLog/regLog.jsp";
    }
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@RequestParam("status") Integer status, @Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        // if result has errors, return the registration page (don't worry about validations just now)
    	userValidator.validate(user, result);
    	if(result.hasErrors()) {
    		System.out.println("Registration Error Validation");
    		return "/regLog/regLog.jsp";
    	} else if(userService.findByEmail(user.getEmail()) == null) {
    		User u = userService.registerUser(user);
    		//u.setStatus(Integer.parseInt(status));
    		System.out.println(status);
    		u.setStatus(status);
    		userService.createUser(u);
    		session.setAttribute("logged", true);
    		session.setAttribute("id", u.getId());
    		session.setAttribute("firstName",u.getFirstName());
    		return "redirect:/home"; //TO CHANGEEEEEEEEEEEEEEEEEE to main route
    	}
        // else, save the user in the database, save the user id in session, and redirect them to the /home route
		return "redirect:/login";
    }
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        // if the user is authenticated, save their user id in session
    	if(userService.authentificateUser(email, password) == true) {
    		User user = userService.findByEmail(email);
    		session.setAttribute("logged", true);
    		session.setAttribute("id", user.getId());
    		session.setAttribute("firstName",user.getFirstName());
    		return "redirect:/home"; //TO CHANGEEEEEEEEEEEEEEEEEE to main route
    	} else {
    		System.out.println("Login Error Validation");
    		return "redirect:/errorLogin";
    	}
        // else, add error messages and return the login page
    }
    @RequestMapping("/home")
    public String home(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        // get user from session, save them in the model and return the home page
    	if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
    	User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
    	model.addAttribute("user", user);	
    	if(searchGlobal != null) {
			List<Product> products = productService.searchProducts(searchGlobal);
			if(products.size() == 0) {
				model.addAttribute("noResult", "No result found");
				List<Product> productsAll = productService.allProducts();
				model.addAttribute("products", productsAll);
				System.out.println("No result pass something: "+products.size());
			}else {
				model.addAttribute("products", products);
				System.out.println("result pass something: "+products.size());
			}
			searchGlobal = null;
		} else {
			List<Product> products = productService.allProducts();
			model.addAttribute("products", products);
			System.out.println("result All: "+products.size());
		}
    	int test = 0;
		model.addAttribute("test", test);
    	
		List<Product> productsOne = new ArrayList<Product>();
		List<Product> newProdList = new ArrayList<Product>();
		System.out.println(Long.parseLong(session.getAttribute("id").toString()));
		List<Cart> cartsUser = cartService.searchCarts((Long) session.getAttribute("id"));
		sumPrice = 0.00;
		for(Cart cart : cartsUser) {
			if(cart.getStatus() == false) {
				newProdList.add(cart.getProduct());
				sumPrice += cart.getProduct().getPrice();
				if(productsOne.contains(cart.getProduct()) != true) {
					productsOne.add(cart.getProduct());
//					System.out.println(cart.getProduct().getName());	
				}
			}
		} 
		
		
		List<Integer> quantities = new ArrayList<Integer>();
		int count;
		for(int i = 0; i < productsOne.size(); i++) {
			count = 0;
			for(int j = 0; j < newProdList.size(); j++) {
				if(productsOne.get(i) == newProdList.get(j)){
					count++;
				}
			}
			quantities.add(count);
		}
		model.addAttribute("quantities", quantities);
		model.addAttribute("productsOne", productsOne);
    	return "/home/home.jsp";
    }
    
    @RequestMapping("/home/{pageNumber}")
	public String getProductsPerPage(Model model, @PathVariable("pageNumber") int pageNumber, HttpSession session) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		// we have to subtract 1 because the Pages iterable is 0 indexed. This is for our links to be able to show from 1...pageMax, instead of 0...pageMax class="keyword operator from-rainbow">- 1.
	    Page<Product> products = productService.productsPerPage(pageNumber - 1);
	    System.out.println("size of product "+products.getSize());
	    // total number of pages that we have
	    int totalPages = products.getTotalPages();
	    System.out.println(totalPages);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("products", products);
	    int test = 1;
		model.addAttribute("test", test);
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		model.addAttribute("user", user);
		
		List<Product> productsOne = new ArrayList<Product>();
		List<Product> newProdList = new ArrayList<Product>();
		System.out.println(Long.parseLong(session.getAttribute("id").toString()));
		List<Cart> cartsUser = cartService.searchCarts((Long) session.getAttribute("id"));
		sumPrice = 0.00;
		for(Cart cart : cartsUser) {
			if(cart.getStatus() == false) {
				newProdList.add(cart.getProduct());
				sumPrice += cart.getProduct().getPrice();
				if(productsOne.contains(cart.getProduct()) != true) {
					productsOne.add(cart.getProduct());
//					System.out.println(cart.getProduct().getName());	
				}
			}
		} 
		
		
		List<Integer> quantities = new ArrayList<Integer>();
		int count;
		for(int i = 0; i < productsOne.size(); i++) {
			count = 0;
			for(int j = 0; j < newProdList.size(); j++) {
				if(productsOne.get(i) == newProdList.get(j)){
					count++;
				}
			}
			quantities.add(count);
		}
		model.addAttribute("quantities", quantities);
		return "/home/home.jsp";
	}
    
	@RequestMapping(value="/home/process/search", method=RequestMethod.POST)
	public String processSearch(HttpSession session, Model model, @Valid @ModelAttribute("product") Product product, @RequestParam("search") String search, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Error during the update of the product");
			return "redirect:/home"; // we have to add the id
		}
		System.out.println("this is my search" +search );
		searchGlobal = search;
		System.out.println("searchGlobal: "+searchGlobal);
		return "redirect:/home";
	}
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
    	session.setAttribute("logged", false);
    	session.invalidate();
        // redirect to login page
    	return "redirect:/login";
    }
    
//	@RequestMapping("/errorRegistration")//this is not the same error with this below. this is the root name, this below is the variable name for flash in the index.jsp page
//	public String flashMessagesR(RedirectAttributes redirectAttributes) {
//		redirectAttributes.addFlashAttribute("errorReg", "All the inputs are required.<br>You must enter valid inputs");
//		return "redirect:/login";
//	}
	@RequestMapping("/errorLogin")//this is not the same error with this below. this is the root name, this below is the variable name for flash in the index.jsp page
	public String flashMessagesL(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("errorLog", "All the inputs are required.<br>You must enter valid inputs");
		return "redirect:/login";
	}
	
	@RequestMapping("/admin/users")
	public String allProducts(Model model) {
		if(kindSearch == 0) {
			List<User> users = userService.allUsers();
			model.addAttribute("users", users);
		}
		if(kindSearch == 1) {
			User user= userService.findByEmail(emailGlobal);
			List<User> users = new ArrayList<User>();
			users.add(user);
			model.addAttribute("users", users);
			kindSearch = 0;
		}
		if(kindSearch == 2) {
			List<User> users = userService.findByZipCode(zipCodeGlobal);
			model.addAttribute("users", users);
			kindSearch = 0;
		}
		if(kindSearch == 3) {
			List<User> users = userService.findByState(stateGlobal);
			model.addAttribute("users", users);
			kindSearch = 0;
		}
		if(kindSearch == 4) {
			List<User> users = userService.findByStatus(statusGlobal);
			model.addAttribute("users", users);
			kindSearch = 0;
		}
		int test = 0;
		model.addAttribute("test", test);
		return "/admin/allUsers.jsp";
	}
	
	@RequestMapping("/admin/users/pages/{pageNumber}")
	public String getUsersPerPage(Model model, @PathVariable("pageNumber") int pageNumber) {
	    // we have to subtract 1 because the Pages iterable is 0 indexed. This is for our links to be able to show from 1...pageMax, instead of 0...pageMax class="keyword operator from-rainbow">- 1.
	    Page<User> users = userService.usersPerPage(pageNumber - 1);
	    // total number of pages that we have
	    int totalPages = users.getTotalPages();
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("users", users);
	    int test = 1;
		model.addAttribute("test", test);
	    return "/admin/allUsers.jsp";
	}
	
	@RequestMapping("/admin/users/email/{email}")
	public String UserByEmail(@PathVariable("email") String email) {
		emailGlobal = email;
		kindSearch = 1;
		return "redirect:/admin/users";
	}
	
	@RequestMapping("/admin/users/zipCode/{zipCode}")
	public String allUsersByZipCode(@PathVariable("zipCode") int zipCode) {
		zipCodeGlobal = zipCode;
		kindSearch = 2;
		return "redirect:/admin/users";
	}
	
	@RequestMapping("/admin/users/state/{state}")
	public String allUsersByState(@PathVariable("state") String state) {
		System.out.println("test "+state );
		stateGlobal = state;
		kindSearch = 3;
		return "redirect:/admin/users";
	}
	@RequestMapping("/admin/users/status/{status}")
	public String allUsersByStatus(@PathVariable("status") Integer status) {
		statusGlobal = status;
		kindSearch = 4;
		return "redirect:/admin/users";
	}
	
	@RequestMapping("/admin/deleteUser/{id}")
	public String deleteUser(@PathVariable("id") Long id) {
		userService.deleteUser(id);
		return "redirect:/admin/users";
	}
    
}