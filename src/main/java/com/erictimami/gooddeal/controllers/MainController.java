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
import com.erictimami.gooddeal.models.Checkout;
import com.erictimami.gooddeal.models.Product;
import com.erictimami.gooddeal.models.Review;
import com.erictimami.gooddeal.models.User;
import com.erictimami.gooddeal.services.CartService;
import com.erictimami.gooddeal.services.CheckoutService;
import com.erictimami.gooddeal.services.ProductService;
import com.erictimami.gooddeal.services.ReviewService;
import com.erictimami.gooddeal.services.UserService;

@Controller
public class MainController {
	private final ProductService productService;
	private final CartService cartService;
	private final UserService userService;
	private final ReviewService reviewService;
	private final CheckoutService checkoutService;
//	private final CategoryService categoryService;
	public static String searchGlobal;
	//public static List<Product> newProdList = new ArrayList<Product>();
	
	public static int sum = 0;
	public static float avg = 0;
	public static int avgInt = 0;
	public static Double sumPrice = 0.0;
	public static int testForm = 0;
	public static Long id_checkout;
	
	public MainController (ProductService productService, CartService cartService, UserService userService, ReviewService reviewService, CheckoutService checkoutService) {
		this.productService = productService;
		this.cartService = cartService;
		this.userService = userService;
		this.reviewService = reviewService;
		this.checkoutService = checkoutService;
//		this.categoryService = categoryService;
	}
	@RequestMapping("/")
	public String index(Model model, RedirectAttributes redirectAttributes) {
		if(searchGlobal != null) {
			List<Product> products = productService.searchProducts(searchGlobal);
			if(products.size() == 0) {
				redirectAttributes.addFlashAttribute("noResult", "No result found");
				List<Product> productsAll = productService.allProducts();
				model.addAttribute("products", productsAll);
			}else {
				model.addAttribute("products", products);
			}
			searchGlobal = null;
		} else {
			List<Product> products = productService.allProducts();
			model.addAttribute("products", products);
			
		}
		int test = 0;
		model.addAttribute("test", test);
		testForm = 0;
		return "/regLog/index.jsp";
	}
	@RequestMapping("/{pageNumber}")
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
		testForm = 0;
	    return "/regLog/index.jsp";
	}
	
	@RequestMapping("/product/{id}")
	public String findOne(HttpSession session, Model model, @PathVariable("id") Long id) {
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		List<Review> reviews = product.getReviews();
		sum = 0;
		for(Review review : reviews) {
			sum += review.getStar();
		}
		System.out.println("sum "+sum);
		if(reviews.size() != 0) {
			avg = sum/reviews.size();
			avgInt = (int) avg;
			System.out.println("avgInt "+avgInt);
		}else {
			avg = 5;
			avgInt = 5;
		}
		model.addAttribute("avg", avg);
		model.addAttribute("avgInt", avgInt);
		
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
		testForm = 0;
		return "/home/oneProduct.jsp";
	}
	@RequestMapping(value="/cart/add/process/{prod_id}", method=RequestMethod.POST)
	public String addToCart(HttpSession session, @PathVariable("prod_id") Long prod_id, @RequestParam("quantity") Integer quantity) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		Product product= productService.findProduct(prod_id);
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		sumPrice = 0.0;
		for(int i = 0; i<quantity; i++) {
			Cart cart = new Cart();
			cart.setUser(user);
			cart.setStatus(false);
			cart.setProduct(product);
			cart = cartService.createCart(cart);
		}
		
//		for(Product prod : newProdList) {
//			sumPrice += prod.getPrice();
//			System.out.println(prod.getName()+" $"+sumPrice);
//		}

		return "redirect:/home";
	}
	
	@RequestMapping(value="/product/review/process/{id}", method=RequestMethod.POST)
	public String createReview(HttpSession session, @PathVariable("id") Long id, @RequestParam("comment") String comment, @RequestParam("star") Integer star) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		Product product= productService.findProduct(id);
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		Review review = new Review();
		review.setComment(comment);
		review.setProduct(product);
		review.setStar(star);
		review.setUser(user);
		reviewService.createReview(review);
		return "redirect:/product/"+id;
	}
	@RequestMapping(value="/index/process/search", method=RequestMethod.POST)
	public String processSearch(HttpSession session, Model model, @Valid @ModelAttribute("product") Product product, @RequestParam("search") String search, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Error during the update of the product");
			return "redirect:/admin"; // we have to add the id
		}
		System.out.println("this is my search" +search );
		searchGlobal = search;
		testForm = 0;
		return "redirect:/";
	}
	@RequestMapping("/cart")
	public String displayCart(HttpSession session, Model model) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		List<Product> productsOne = new ArrayList<Product>();
		List<Product> newProdList = new ArrayList<Product>();
		List<Cart> cartsUser = cartService.searchCarts(Long.parseLong(session.getAttribute("id").toString()));
		List<Cart> cartsUserStatus = cartService.searchCartsStatus(Long.parseLong(session.getAttribute("id").toString()), false);
		sumPrice = 0.00;
		
		//the first way to do it.
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
		//The second way to do it. 
		Double sumTest = 0.00;
		for(Cart cart : cartsUserStatus) {
				newProdList.add(cart.getProduct());
				sumTest += cart.getProduct().getPrice();
				if(productsOne.contains(cart.getProduct()) != true) {
					productsOne.add(cart.getProduct());	
				}
		} 
		System.out.println("sumTest "+sumTest+" sumPriice "+sumPrice);
		
		int test = 0;
		model.addAttribute("quantities", quantities);
		model.addAttribute("productsOne", productsOne);
		if(user.getCheckout() == null) {
			testForm = 0;
		}
//		testForm = 0;
		model.addAttribute("testForm", testForm);
		model.addAttribute("test", test);
		model.addAttribute("sumPrice", sumPrice);
		model.addAttribute("user", user);
		return "/home/cart1.jsp";
	}
	
	@RequestMapping("/cart/checkout")
	public String checkout(HttpSession session, Model model) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		List<Product> productsOne = new ArrayList<Product>();
		List<Product> newProdList = new ArrayList<Product>();
		List<Cart> cartsUserStatus = cartService.searchCartsStatus(Long.parseLong(session.getAttribute("id").toString()), false);
		sumPrice = 0.00;
		
		for(Cart cart : cartsUserStatus) {
			newProdList.add(cart.getProduct());
			cart.setStatus(true);
			cartService.createCart(cart);
			
			if(productsOne.contains(cart.getProduct()) != true) {
				productsOne.add(cart.getProduct());	
			}
		}
		
		List<Integer> quantities = new ArrayList<Integer>();
		int count;
		for(int i = 0; i < productsOne.size(); i++) {
			count = 0;
			for(int j = 0; j < cartsUserStatus.size(); j++) {
				if(productsOne.get(i) == cartsUserStatus.get(j).getProduct()){
					count++;
				}
			}
			quantities.add(count);
			Product product = productService.findProductByName(productsOne.get(i).getName());
			product.setQuantity(product.getQuantity()-count);
			productService.createProduct(product);
		}
		

		Checkout checkout = checkoutService.findCheckout(user.getCheckout().getId());
		model.addAttribute("checkout", checkout);
		
		int test = 0;
		model.addAttribute("quantities", quantities);
		model.addAttribute("productsOne", productsOne);
		model.addAttribute("test", test);
		model.addAttribute("sumPrice", sumPrice);
		model.addAttribute("user", user);
		testForm = 3;
		model.addAttribute("testForm", testForm);
		System.out.println("Before address checkout: "+user.getCheckout().getId());
		checkoutService.deleteCheckout(user.getCheckout().getId());
		if(user.getCheckout() == null ) {
			System.out.println("After address checkout: "+user.getCheckout().getId());
		}
		System.out.println("After id checkout pass.");
		return "/home/cart1.jsp";
	}
	
	
	
	@RequestMapping(value="/cart/infoPayment/process", method=RequestMethod.POST)
	public String checkoutProcess(HttpSession session, @RequestParam(value="check", required = false) String check, @RequestParam("cardHolder") String cardHolder, 
			@RequestParam("cardNumber") String cardNumber, @RequestParam("securityCode") String securityCode, @RequestParam("cardExpiration") String cardExpiration,
			@RequestParam("addressDelivery") String addressDelivery, @RequestParam("stateDelivery") String stateDelivery, @RequestParam("zipCodeDelivery") Integer zipCodeDelivery) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		System.out.println("checkbox: "+check);
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		Checkout checkout;
		if(user.getCheckout() == null) {
			checkout = new Checkout();
		}else {
			Long id_check = user.getCheckout().getId();
			checkout = checkoutService.findCheckout(id_check);
		}
		if(check != null) {
			checkout.setAddressDelivery(user.getAddress());
			checkout.setStateDelivery(user.getState());
			checkout.setZipCodeDelivery(user.getZipCode());
			
		}else {
			checkout.setAddressDelivery(addressDelivery);
			checkout.setStateDelivery(stateDelivery);
			checkout.setZipCodeDelivery(zipCodeDelivery);
		}
		checkout.setUser(user);
		checkout.setCardExpiration(cardExpiration);
		checkout.setCardHolder(cardHolder);
		checkout.setCardNumber(cardNumber);
		checkout.setSecurityCode(securityCode);
		Checkout checkResult = checkoutService.createCheckout(checkout);
		id_checkout = checkResult.getId();
		
		testForm = 2;
		return "redirect:/cart";
	}
	
	
	
	@RequestMapping("/cart/infoPayment/update")
	public String getUpdateInfo(Model model, HttpSession session) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		testForm = 1;

	    return "redirect:/cart";
	}
	
	@RequestMapping(value="/cart/infoPayment/update/process", method=RequestMethod.POST)
	public String UpdateInfo(Model model, HttpSession session, @RequestParam(value="check", required = false) String check, @RequestParam("cardHolder") String cardHolder, 
			@RequestParam("cardNumber") String cardNumber, @RequestParam("securityCode") String securityCode, @RequestParam("cardExpiration") String cardExpiration,
			@RequestParam("addressDelivery") String addressDelivery, @RequestParam("stateDelivery") String stateDelivery, @RequestParam("zipCodeDelivery") Integer zipCodeDelivery) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		testForm = 2;
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		Long id_check = user.getCheckout().getId();
		Checkout checkout = checkoutService.findCheckout(id_check);
		
		if(check != null) {
			checkout.setAddressDelivery(user.getAddress());
			checkout.setStateDelivery(user.getState());
			checkout.setZipCodeDelivery(user.getZipCode());	
		}else {
			checkout.setAddressDelivery(addressDelivery);
			checkout.setStateDelivery(stateDelivery);
			checkout.setZipCodeDelivery(zipCodeDelivery);
		}
		checkout.setCardExpiration(cardExpiration);
		checkout.setCardHolder(cardHolder);
		checkout.setCardNumber(cardNumber);
		checkout.setSecurityCode(securityCode);
		checkoutService.createCheckout(checkout);
	    return "redirect:/cart";
	}
}
