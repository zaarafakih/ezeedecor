package net.zf.ezeedecor.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.zf.edbackend.dao.CategoryDAO;
import net.zf.edbackend.dao.ProductDAO;
import net.zf.edbackend.dto.Category;
import net.zf.edbackend.dto.Product;
import net.zf.ezeedecor.util.FileUploadUtility;
import net.zf.ezeedecor.validator.ProductValidator;

@Controller
@RequestMapping(value = "/manage")
public class ManagementController {

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;

	

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Manage Products");
		mv.addObject("userClickManageProduct", true);

		// create new product(default constructor activated)
		Product nProduct = new Product();

		// set Id as 1 since it is admin right
		nProduct.setSupplierId(1);
		nProduct.setActive(true);
		mv.addObject("product", nProduct);

		if (operation != null) {
			if (operation.equals("product")) {
				mv.addObject("message", "Product submitted successfully!");
			}else if(operation.equals("category")){
				mv.addObject("message", "Category Submisted successfully!");
			}
		}
		return mv;
	}

	@RequestMapping(value="/{id}/product",method=RequestMethod.GET)
	public ModelAndView showEditProducts(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Manage Products");
		mv.addObject("userClickManageProduct", true);

		
		Product nProduct = productDAO.get(id);

		mv.addObject("product", nProduct);

		
		return mv;
	}
	
	
	// handle products
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct,BindingResult results,Model model,
			HttpServletRequest request) {
		
		if(mProduct.getId()==0){
		new ProductValidator().validate(mProduct,results);
		}
		else{
			if(!mProduct.getFile().getOriginalFilename().equals("")){
				new ProductValidator().validate(mProduct,results);
			}
		}
		
		//check if there are any errors
		if(results.hasErrors()){
			model.addAttribute("userClickManageProduct", true);
			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Validation failed for Product");
			return "page";
		}
		
		if(mProduct.getId()==0){
			// create a new product record
			productDAO.add(mProduct);
		}
		else{
			productDAO.update(mProduct);
		}
		
		
		if(!mProduct.getFile().getOriginalFilename().equals("")){
			FileUploadUtility.uploadFile(request,mProduct.getFile(),mProduct.getCode());
		}
		return "redirect:/manage/products?operation=product";

	}
	
	@RequestMapping(value="/product/{id}/activation",method=RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id){
		Product mproduct=productDAO.get(id);
		mproduct.setActive(!mproduct.isActive());
		productDAO.update(mproduct);
		boolean isAct=mproduct.isActive() ;
		return (isAct)? 
				"Product"+mproduct.getId()+" : "+mproduct.getName()+" Activated!" :
				"Product"+mproduct.getId()+" : "+mproduct.getName()+" Dectivated!";
	}
	
	@RequestMapping(value="/category",method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category){
		categoryDAO.add(category);
		return "redirect:/manage/products/?operation=category";
	}

	// returning categories for all request mapping
	@ModelAttribute("categories")
	public List<Category> getCategories() {

		return categoryDAO.list();
	}
	
	@ModelAttribute("category")
	public Category getCategory(){
		return new Category();
	}
	
}
