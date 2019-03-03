package net.zf.ezeedecor.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zf.edbackend.dao.CartlineDAO;
import net.zf.edbackend.dao.ProductDAO;
import net.zf.edbackend.dao.UserDAO;
import net.zf.edbackend.dto.CartLine;
import net.zf.edbackend.dto.Product;
import net.zf.edbackend.dto.cart;
import net.zf.ezeedecor.model.UserModel;

@Service("cartService")
public class CartService {

	@Autowired
	private CartlineDAO cartlineDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession session;
	
	//return cart of the user logged in
	private cart getCart(){
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}
	
	
	//returns entire cart line
	public List<CartLine> getCartLines(){
		cart cartt=this.getCart();
		return cartlineDAO.listAvailable(cartt.getId());
	}


	public String manageCartLine(int cartLineId, int count) {
		
		//fetch the cartLine
		CartLine cartline=cartlineDAO.get(cartLineId);
		
		if(cartline==null){
			return "result=error";
		}else{
			Product product=cartline.getProduct();
			double oldTotal=cartline.getTotal();
			
			if(product.getQuantity() < count){
				return "result=unavailable";
			}
			
			
			cartline.setProductCount(count);
			cartline.setBuyingPrice(product.getUnitPrice());
			cartline.setTotal(product.getUnitPrice()*count);
			
			cartlineDAO.update(cartline);
			
			cart cartt= this.getCart();
			cartt.setGrandTotal(cartt.getGrandTotal() - oldTotal + cartline.getTotal());
			
			userDAO.updateCart(cartt);
			
			return "result=updated";
		}
		
		
	}


	public String deleteCartLine(int cartLineId) {
		CartLine cartline=cartlineDAO.get(cartLineId);
		if(cartline==null){
			return "result=error";
		}else{
			
			//update cart
			cart cartt=this.getCart();
			cartt.setGrandTotal(cartt.getGrandTotal()-cartline.getTotal());
			cartt.setCartLines(cartt.getCartLines()-1);
			userDAO.updateCart(cartt);
			
			//remove cartline
			cartlineDAO.delete(cartline);
			
			return "result=deleted";
		}
		
		
		
	}


	public String addCartLine(int productId) {
		String response=null;
		
		//get cart of user by session
		cart cartt=this.getCart();
		
		//check if that product is already added
		CartLine cartline= cartlineDAO.getByCartAndProduct(cartt.getId(), productId);
		
		
		if(cartline==null){
			//add a new cartline
			cartline=new CartLine();
			
			//fetch product
			Product product=productDAO.get(productId);
		
			cartline.setCartId(cartt.getId());
			
			cartline.setProduct(product);
			
			cartline.setBuyingPrice(product.getUnitPrice());
			
			cartline.setProductCount(1);
			
			cartline.setTotal(product.getUnitPrice());
			
			cartline.setAvailable(true);
			
			cartlineDAO.add(cartline);
			
			cartt.setCartLines(cartt.getCartLines()+1);
			
			cartt.setGrandTotal(cartt.getGrandTotal()+cartline.getTotal());
			
			userDAO.updateCart(cartt);
			
			response="result=added";
		}else{
			
			//check if product has reached maximum count
			
			if(cartline.getProductCount() < 3){
				//update
				response=this.manageCartLine(cartline.getId(),cartline.getProductCount()+1);
				
			}else{
				response="result=maximum";
			}
		}
		
		return response;
	}
	
	
	
}
