package net.zf.edbackend.test;


import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.zf.edbackend.dao.CategoryDAO;
import net.zf.edbackend.dto.Category;

public class CategoryTestcase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.zf.edbackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");

	}

	
	 @Test
	public void testAddCategory() {
		category = new Category();
		
		category.setName("Bathroom Products");
		category.setDescription("This category consists of garden supplies");
		category.setImageUrl("garden.png");
		assertEquals("Successfully added category inside table",true, categoryDAO.add(category));
		
	}
	
		/*@Test
	public void testGetCategory(){
		category = categoryDAO.get(1);
		assertEquals("Successfully retrieved category from table","trial-category",category.getName());
	}*/
	
	/*@Test
	public void testUpdateCategory(){
		category = categoryDAO.get(1);
		category.setName("abc-pqr");
		assertEquals("Successfully updated category from table",true,categoryDAO.update(category));
	}*/
	/*
	@Test
	public void testDeleteCategory(){
		category = categoryDAO.get(3);
		assertEquals("Successfully deleted category from table",true,categoryDAO.delete(category));
	}
	*/
	
/*	@Test
	public void testActiveCategory(){
		
		assertEquals("Successfully fetched category from table",2,categoryDAO.list().size());
	} */
	
	
	/*@Test
	public void testAllCases(){
category = new Category();
		
		category.setName("samp4");
		category.setDescription("This category consists of samp4 supplies");
		category.setImageUrl("pqr4.png");
		assertEquals("Successfully added category inside table",true, categoryDAO.add(category));
		
		category = categoryDAO.get(1);
		assertEquals("Successfully retrieved category from table","abc-pqr",category.getName());
		
		
		category = categoryDAO.get(2);
		category.setName("abc-pqr1");
		assertEquals("Successfully updated category from table",true,categoryDAO.update(category));
		
		category = categoryDAO.get(2);
		assertEquals("Successfully deleted category from table",true,categoryDAO.delete(category));
		
		assertEquals("Successfully fetched category from table",4,categoryDAO.list().size());
	}
	*/
}
