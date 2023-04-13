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

import com.erictimami.gooddeal.models.Category;
import com.erictimami.gooddeal.models.Product;
import com.erictimami.gooddeal.models.User;
import com.erictimami.gooddeal.services.CategoryService;
import com.erictimami.gooddeal.services.ProductService;
import com.erictimami.gooddeal.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final ProductService productService;
	private final CategoryService categoryService;
	private final UserService userService;
	public static String searchGlobal;
	public static List<Product> newProdList;
	public static int testConfirm =0;
	
	public AdminController (ProductService productService, CategoryService categoryService, UserService userService) {
		this.productService = productService;
		this.categoryService = categoryService;
		this.userService = userService;
	}
	@RequestMapping("/products")
	public String allProducts(Model model, HttpSession session) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		List<Category> categories = categoryService.allCategories();
		model.addAttribute("categories", categories);
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
		
		return "/admin/allProducts.jsp";
	}
	@RequestMapping("/products/pages/{pageNumber}")
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
		
		List<Category> categories = categoryService.allCategories();
		model.addAttribute("categories", categories);
	    return "/admin/allProducts.jsp";
	}
	@RequestMapping("/createProduct")
	public String create(HttpSession session, Model model, @ModelAttribute("product") Product product, @ModelAttribute("category") Category category) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		List<Category> categories = categoryService.allCategories();
		model.addAttribute("categories", categories);
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		model.addAttribute("user", user);
		return "/admin/create.jsp";
	}
	@RequestMapping(value="/categories/new/process", method=RequestMethod.POST)
	public String processCat(RedirectAttributes redirectAttributes, HttpSession session, @Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		if(result.hasErrors()) {
			System.out.println("Error creation a category");
			return "redirect:/admin/createProduct";
		}
		List<Product> newProdList = new ArrayList<Product>();
		category.setProducts(newProdList);
		categoryService.createCategory(category);
		redirectAttributes.addFlashAttribute("successMessage", "!!! Creation complete !!!");
		return "redirect:/admin/createProduct";
	}
	@RequestMapping(value="/products/new/process", method=RequestMethod.POST)
	public String processProd(RedirectAttributes redirectAttributes, HttpSession session, @Valid @ModelAttribute("product") Product product, @RequestParam("cat_id") Long cat_id, BindingResult result) {
		System.out.println("Product + Id: "+product.getName()+" + "+cat_id);
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		if(result.hasErrors()) {
			System.out.println("Error duting the post of the new product");
			return "redirect:/admin/createProduct";
		}
		System.out.println(cat_id);
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		product.setUser(user);
		Product p = productService.createProduct(product);
		Category category = categoryService.findCategory(cat_id);
		System.out.println("Size "+category.getProducts().size());
		newProdList = category.getProducts();
		newProdList.add(p);
		category.setProducts(newProdList);
		categoryService.createCategory(category);
		redirectAttributes.addFlashAttribute("successMessage", "!!! Creation complete !!!");
		return "redirect:/admin/createProduct";
	}
	
	
	@RequestMapping("/deleteProduct/{id}")
	public String deleteProd(HttpSession session, @PathVariable("id") Long id) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		productService.deleteProduct(id);
		return "redirect:/admin";
	}
	@RequestMapping("/deleteCategory/{id}")
	public String deleteCat(HttpSession session, @PathVariable("id") Long id) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		categoryService.deleteCategory(id);
		return "redirect:/admin";
	}
	@RequestMapping("/updateProduct/{id}")
	public String updateProd(HttpSession session, Model model, @Valid @ModelAttribute("product") Product product, @Valid @ModelAttribute("category") Category category, @PathVariable("id") Long id) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		Product prod = productService.findProduct(id);
		model.addAttribute("product", prod);
		Category cat = new Category();
		model.addAttribute("category", cat);
		System.out.println("pass update 2");
		return "/admin/update.jsp";
	}
	@RequestMapping(value="/products/update/process", method=RequestMethod.PUT)
	public String processProd(HttpSession session, @Valid @ModelAttribute("product") Product product, BindingResult result) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		if(result.hasErrors()) {
			System.out.println("Error during the update of the product");
			return "redirect:/admin/updateProduct/"; // we have to add the id
		}
		product.setCategories(productService.findProduct(product.getId()).getCategories());
		productService.createProduct(product);
		return "redirect:/admin/products/pages/1";
	}
	@RequestMapping("/updateCategory/{id}")
	public String updateCat(HttpSession session, Model model, @Valid @ModelAttribute("product") Product product, @Valid @ModelAttribute("category") Category category, @PathVariable("id") Long id) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		Category cat = categoryService.findCategory(id);
		model.addAttribute("category", cat);
		Product prod = new Product();
		model.addAttribute("product", prod);
		System.out.println("pass update 2");
		return "/admin/update.jsp";
	}
	@RequestMapping(value="/categories/update/process", method=RequestMethod.PUT)
	public String processProd(HttpSession session, @Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		if(result.hasErrors()) {
			System.out.println("Error during the update of the product");
			return "redirect:/admin/updateCategory"; // we have to add the id
		}
		category.setProducts(categoryService.findCategory(category.getId()).getProducts());
		categoryService.createCategory(category);
		return "redirect:/admin/products/pages/1";
	}
	@RequestMapping(value="/process/search", method=RequestMethod.POST)
	public String processSearch(HttpSession session, Model model, @Valid @ModelAttribute("product") Product product, @RequestParam("search") String search, BindingResult result) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		if(result.hasErrors()) {
			System.out.println("Error during the update of the product");
			return "redirect:/admin"; // we have to add the id
		}
		System.out.println("this is my search" +search );
		searchGlobal = search;
		if(searchGlobal != null) {
			return "redirect:/admin/products";
		}
		return "redirect:/admin/products/pages/1";
	}
	
	@RequestMapping("/categories/add")
	public String forAddToCategory(HttpSession session, Model model) {
		if(session.getAttribute("logged") == null) {
    		return "redirect:/login";
    	}else if((session.getAttribute("logged").toString()).equals("false") == true) {
    		return "redirect:/login";
    	}
		List<Category> categories = categoryService.allCategories();
		model.addAttribute("categories", categories);
		List<Product> products = productService.allProducts();
		model.addAttribute("products", products);
		User user = userService.findUserById(Long.parseLong(session.getAttribute("id").toString()));
		model.addAttribute("user", user);
//		if (testConfirm == 1) {
//			
//		}
//		if (testConfirm == 2) {
//			
//		}
		return "/admin/addProductCategory.jsp";
	}
	
	@RequestMapping(value="/categories/add/process", method=RequestMethod.POST)
	public String addToCategory(RedirectAttributes redirectAttributes, HttpSession session, @Valid @ModelAttribute("id_prod") Long id_prod, @Valid @ModelAttribute("id_cat") Long id_cat) {
		Category category = categoryService.findCategory(id_cat);
		List<Product> products = category.getProducts();
		Product product = productService.findProduct(id_prod);
		if(products.contains(product)) {
//			testConfirm = 1;
			redirectAttributes.addFlashAttribute("confirm", "The product was already into that category");
			return "redirect:/admin/categories/add";
		}
		products.add(product);
		category.setProducts(products);
		categoryService.createCategory(category);
//		testConfirm = 2;
		redirectAttributes.addFlashAttribute("confirm", "The product has been added into that category");
		return "redirect:/admin/categories/add";
	}

}
