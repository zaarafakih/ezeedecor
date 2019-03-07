package net.zf.edbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.zf.edbackend.dao.UserDAO;
import net.zf.edbackend.dto.address;
import net.zf.edbackend.dto.cart;
import net.zf.edbackend.dto.user;

public class UserTestCase {
	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private user user;
	private address address;
	private cart cart;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.zf.edbackend");
		context.refresh();
		userDAO = (UserDAO) context.getBean("userDAO");

	}

	/*@Test
	public void getListAdd(){
		user = userDAO.getUserByEmail("mkhot@gmail.com");
		
		//int coun=userDAO.listShippingAddress(user).size();
		//assertEquals("Sizez do not match shipping",null,userDAO.listShippingAddress(user).size());

		//assertEquals("Sizez do not match shipping",1,coun);
		
		assertEquals("Do not match","Dombivli",userDAO.getBillingAddress(user).getCity());
	}
	*/
	
	/*@Test
	public void testAddress(){
		user =userDAO.getUserByEmail("shrey@gmail.com");
		
		address=new address();
		address.setAddressLine1("Shrey Palace");
		address.setAddressLine2("Appoorva Nagar");
		address.setCity("Thane");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("421700");
		address.setShipping(true);
		address.setUserr(user);
		assertEquals("Failed to add address",true, userDAO.addAddress(address));
	}*/
	
	/*
	@Test
	public void addAddresstest(){
		user =userDAO.getUserByEmail("mkhot@gmail.com");
		address=new address();
		address.setAddressLine1("311, Sarvoday Complex");
		address.setAddressLine2("Kopar");
		address.setCity("Dombivli");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("421400");
		address.setBilling(true);
		address.setUserr(user);
		
		assertEquals("Failed to add address",true, userDAO.addAddress(address));
		
		address=new address();
		address.setAddressLine1("300,Tulip Colony");
		address.setAddressLine2("Ghatkopar");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("478900");
		address.setShipping(true);
		address.setUserr(user);
		assertEquals("Failed to add address",true, userDAO.addAddress(address));
	}*/
	
	/*@Test
	public void updateCart(){
		user =userDAO.getUserByEmail("mkhot@gmail.com");
		cart =user.getCart();
		cart.setCartLines(2);
		cart.setGrandTotal(2000);
		assertEquals("Failed to update cart",true, userDAO.updateCart(cart));
		
	}*/
	
	
	
	
	@Test
	public void testaddUser(){
		user=new user();
		user.setFirstName("test3");
		user.setLastName("test3surname");
		user.setEmail("test3@gmail.com");
		user.setPassword("test3123");
		//user.setConfirmPassword(user.getPassword());
		user.setContactNumber("8976546783");
		user.setRole("user");
		if(user.getRole().equals("user")){
			cart=new cart();
			cart.setUserr(user);
			user.setCart(cart);
		}
		address=new address();
		address.setUserr(user);
		address.setAddressLine1("Test 3's home");
		address.setBilling(true);
		address.setCity("kalyan");
		address.setCountry("India");
		address.setPostalCode("421301");
		address.setState("Maharashtra");
		
		assertEquals("Failed to add user",true,userDAO.addUser(user));
		
	}
	

	/*@Test
	public void testAdd(){
		user=new user();
		user.setFirstName("Shruti");
		user.setLastName("Thakur");
		user.setEmail("shrey@gmail.com");
		user.setContactNumber("9709123450");
		user.setRole("user");
		user.setPassword("shreyC123");
		
		
		address=new address();
		address.setAddressLine1("300,Tulip Colony,");
		address.setAddressLine2("M.J.. Road,Mulund");
		address.setCity("Mumbai");
		address.setPostalCode("400231");
		address.setCountry("India");
		
		
		address.setBilling(true);
		address.setUserId(user.getId());
		
		assertEquals("Failed to add billing adderess!",true,userDAO.addAddress(address));
		
		if(user.getRole().equals("user"))
		{
			cart=new cart();
			cart.setUserr(user);
			user.setCart(cart);
			assertEquals("Failed to add user!",true,userDAO.addUser(user));
			
			address=new address();
			address.setAddressLine1("403,Rose Colony,");
			address.setAddressLine2("N.J. Road,Ghatkopar");
			address.setCity("Mumbai");
			address.setPostalCode("400121");
			address.setCountry("India");
			
			address.setShipping(true);
			address.setUserId(user.getId());
			
			assertEquals("Failed to add shipping adderess!",true,userDAO.addAddress(address));
		}
	
	}
	*/
	
}
