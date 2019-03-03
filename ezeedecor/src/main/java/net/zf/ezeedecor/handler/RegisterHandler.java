package net.zf.ezeedecor.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import net.zf.edbackend.dao.UserDAO;
import net.zf.edbackend.dto.address;
import net.zf.edbackend.dto.cart;
import net.zf.edbackend.dto.user;
import net.zf.ezeedecor.model.RegisterModel;

@Component
public class RegisterHandler {

	@Autowired
	private UserDAO userDAO;
	
	/*@Autowired
	private BCryptPasswordEncoder passwordEncoder;*/
	
	public RegisterModel init(){
		return new RegisterModel();
		
	}
	
	
	public void addUser(RegisterModel registerModel,user userr){
		registerModel.setUserr(userr);
	}
	
	public void addBilling(RegisterModel registerModel,address billing){
		registerModel.setBilling(billing);
	}
	
	public String validateUser(user userr,MessageContext error){
		String transitionValue="success";
	
		if((userDAO.getUserByEmail(userr.getEmail())) != null){
			error.addMessage(new MessageBuilder()
					.error()
					.source("email")
					.defaultText("Email id is already used!")
					.build());
			transitionValue="failure";
		}
		return transitionValue;
	}
	
	public String saveAll(RegisterModel model){
		//String transitionValue="success";
		
		//fetch user
		
		user userr=model.getUserr();
		if(userr.getRole().equals("user")){
			net.zf.edbackend.dto.cart cart=new cart();
			cart.setUserr(userr);
			userr.setCart(cart);
		}
		
		
		//encode password
		//userr.setPassword(passwordEncoder.encode(userr.getPassword()));
		
		//save user
		userDAO.addUser(userr);
		
		//get address
		address billing=model.getBilling();
		billing.setUserr(userr);
		billing.setBilling(true);
		
		
		//save address
		userDAO.addAddress(billing);
		
		return "success";
	}
}
