package net.zf.ezeedecor.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.zf.edbackend.dao.CategoryDAO;
import net.zf.edbackend.dao.ProductDAO;
import net.zf.edbackend.dto.Category;
import net.zf.edbackend.dto.Product;
import net.zf.ezeedecor.exception.ProductNotFoundException;
@Controller
public class PageController {

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		// add list of categories
		mv.addObject("categories", categoryDAO.list());
		List<Category> categories=categoryDAO.list();
		for(Category category : categories){
			List<Product> product=productDAO.listActiveProductsByCategory(category.getId());
			mv.addObject("product",product);
		}
		mv.addObject("products", productDAO.listActiveProducts());
		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = "/shop")
	public ModelAndView shop() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Shop");
		mv.addObject("userClickShop", true);
		return mv;
	}

	@RequestMapping(value = "/design")
	public ModelAndView design() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Design");
		mv.addObject("userClickDesign", true);
		return mv;
	}

	@RequestMapping(value = "/makeover")
	public ModelAndView makeover() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Makeover");
		mv.addObject("userClickMakeover", true);
		return mv;
	}

	@RequestMapping(value = "/samples")
	public ModelAndView samples() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Samples");
		mv.addObject("userClickSamples", true);
		return mv;
	}

	// Methods to fetch products by category and also all products

	@RequestMapping(value = "show/all/products")
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All Products");
		mv.addObject("userClickAllProducts", true);
		// add list of categories
		mv.addObject("categories", categoryDAO.list());
		return mv;
	}

	@RequestMapping(value = "show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");

		// categoryDAO to fetch a single category
		Category category = null;
		category = categoryDAO.get(id);
		mv.addObject("title", category.getName());
		
		//passing list of categories
				mv.addObject("categories", categoryDAO.list());
				
		//passing single category
				mv.addObject("category", category);
		mv.addObject("userClickCategoryProducts", true);
		return mv;
	}
	
	
	@RequestMapping(value="show/{id}/product")
	public ModelAndView viewProductPage(@PathVariable("id") int id) throws ProductNotFoundException {
		ModelAndView mv=new ModelAndView("page");

		
		Product product= productDAO.get(id);
		
		if(product ==null) throw new ProductNotFoundException();
		mv.addObject("title", product.getName());
		
		//updating view count
		product.setViews(product.getViews()+1);
		productDAO.update(product);
		
		mv.addObject("product",product);
		mv.addObject("userClickViewProduct","true");
		return mv;
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Register me");
		return mv;
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name="error",required=false) String error ,
			@RequestParam(name="logout",required=false) String logout){
		ModelAndView mv = new ModelAndView("login");
		if(error!=null){
			mv.addObject("message","Invalid username or Password!");
		}
		
		if(logout!=null){
			mv.addObject("logout","User logged out successfully!");
		}
		mv.addObject("title", "Login");
		return mv;
	}
	
	@RequestMapping(value = "/perform-logout")
	public String logout(HttpServletRequest req, HttpServletResponse res){
		Authentication auth= SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null){
			new SecurityContextLogoutHandler().logout(req,res,auth);
			
		}
		
		return "redirect:/login?logout";
	}
	
	
	
	//access denoed page
	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", " 403-Access Denied");
		mv.addObject("errorTitle", " Aha! Caught You!");
		mv.addObject("errorDescription", "You are not authorized to view this page! ");
		return mv;
	}

	/*
	 * @RequestMapping(value="/test") public ModelAndView
	 * test(@RequestParam(value="greetings",required=false)String greetings){
	 * if(greetings==null){ greetings="hello"; } ModelAndView mv= new
	 * ModelAndView("page"); mv.addObject("greetings",greetings ); return mv; }
	 * 
	 * @RequestMapping(value="/test/{greetings}") public ModelAndView
	 * test(@PathVariable("greetings")String greetings) { if(greetings==null){
	 * greetings="hello"; } ModelAndView mv= new ModelAndView("page");
	 * mv.addObject("greetings",greetings ); return mv; }
	 */

}
