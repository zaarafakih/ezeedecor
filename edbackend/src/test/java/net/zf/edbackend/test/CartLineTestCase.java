package net.zf.edbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.zf.edbackend.dao.CartlineDAO;
import net.zf.edbackend.dao.ProductDAO;
import net.zf.edbackend.dao.UserDAO;
import net.zf.edbackend.dto.CartLine;
import net.zf.edbackend.dto.Product;
import net.zf.edbackend.dto.cart;
import net.zf.edbackend.dto.user;

public class CartLineTestCase {

	
	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private static ProductDAO productDAO;
	private static CartlineDAO cartlineDAO;
	private user userr;
	private cart cartt;
	private Product product;
	private CartLine cartline;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.zf.edbackend");
		context.refresh();
		userDAO = (UserDAO) context.getBean("userDAO");
		productDAO =(ProductDAO) context.getBean("productDAO");
		cartlineDAO =(CartlineDAO) context.getBean("cartlineDAO");

	}
	
	
	
	@Test
	public void testCartLine(){
		//get user
		userr=userDAO.getUserByEmail("nabafakih@gmail.com");
		
		//get cart
		cartt= userr.getCart();
		cartline=cartlineDAO.get(1);
		cartt.setGrandTotal(cartt.getGrandTotal()+cartline.getTotal());
		cartt.setCartLines(cartt.getCartLines()+1);
		/*
		//get product
		product= productDAO.get(1);
		
		
		//create CartLine
		cartline=new CartLine();
		cartline.setAvailable(true);
		cartline.setProduct(product);
		cartline.setBuyingPrice(product.getUnitPrice());
		cartline.setProductCount(cartline.getProductCount()+1);
		cartline.setTotal(cartline.getBuyingPrice()* cartline.getProductCount());
		cartline.setCartId(cartt.getId());
		*/
		assertEquals("Failed to update  cart",true,userDAO.updateCart(cartt));
		
		
	}
}
