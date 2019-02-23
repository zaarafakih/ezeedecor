package net.zf.edbackend.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.zf.edbackend.dao.ProductDAO;
import net.zf.edbackend.dto.Product;

public class ProductTestCase {

	private static AnnotationConfigApplicationContext context;
	private static ProductDAO productDAO;
	private Product product;
	
	
	@BeforeClass
	public static void init(){
		
		context=new AnnotationConfigApplicationContext();
		context.scan("net.zf.edbackend");
		context.refresh();
		productDAO= (ProductDAO) context.getBean("productDAO");
	}
	
	@Test
	  public void testCRUDProduct(){
		//product=new Product();
		/*
		product.setName("Chopping Board");
		product.setBrand("Pepper");
		product.setDescription("This is a wooden chopping board");
		product.setQuantity(18);
		product.setUnitPrice(1200);
		product.setSupplierId(2);
		product.setCategoryId(8);
		product.setActive(true);
		assertEquals("Error adding product",true,productDAO.add(product));
		*/
		//product=productDAO.get(2);
		//List<Product> product1;
		//product1=productDAO.listActiveProductsByCategory(8);
		
		//product1=productDAO.listLatestActiveProducts(2);
		
		//product1=productDAO.listActiveProducts();
		assertEquals("Error getting product","Knife Set",productDAO.get(1).getName());
		
		
	}
	
	
	
}
