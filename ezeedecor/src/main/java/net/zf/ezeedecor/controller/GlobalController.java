package net.zf.ezeedecor.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import net.zf.edbackend.dao.UserDAO;
import net.zf.edbackend.dto.user;
import net.zf.ezeedecor.model.UserModel;

@ControllerAdvice
public class GlobalController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserDAO userDAO;
	
	private UserModel userModel=null;
	
	@ModelAttribute
	public UserModel getUserModel(){
		
		if(session.getAttribute("userModel")==null){
			//add user model
			
			Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
			user userr=userDAO.getUserByEmail(authentication.getName());
			if(userr!=null){
				//create a new UserModel object to pass user details
				userModel=new UserModel();
				userModel.setId(userr.getId());
				userModel.setEmail(userr.getEmail());
				userModel.setRole(userr.getRole());
				userModel.setFullName(userr.getFirstName()+" "+userr.getLastName());
			
				if(userModel.getRole().equals("user")){
					//set cart only if user is buyer
					userModel.setCart(userr.getCart());
				}
			
				//set userModel in sesson
				session.setAttribute("userModel", userModel);
				
				return userModel;
			}
			
		}
		
		return (UserModel) session.getAttribute("userModel");
		
	}
}
