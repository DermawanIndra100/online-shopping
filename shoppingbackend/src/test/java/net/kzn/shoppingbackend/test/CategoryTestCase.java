package net.kzn.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.kzn.shoppingbackend.dao.CategoryDAO;
import net.kzn.shoppingbackend.dto.Category;

public class CategoryTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;
	
	@BeforeClass
	public static void init(){
		context = new AnnotationConfigApplicationContext();
		context.scan("net.kzn.shoppingbackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}
	
	//this for static input hibernate
//	@Test
//	public void testAddCategory(){
//		category = new Category();
//		category.setName("Laptop");
//		category.setDescription("This is some description for laptop");
//		category.setImageURL("CAT_100.png"); 
//		
//		assertEquals("Success Fully added a category inside the table!",true, categoryDAO.add(category));
//	}
	
//	ngetes dapetin query / get
//	@Test
//	public void testGetCategory(){
//		
//		category = categoryDAO.get(1);
//		assertEquals("Successfully fatched a single category from the table!","Television", category.getName());
//	}
	
	// for updating single category
//	@Test
//	public void testUpdateCategory(){
//		
//		category = categoryDAO.get(1);
//		category.setName("TV");
//		assertEquals("Successfully fatched a single category in the table!",true, categoryDAO.update(category));
//	}
	
//	@Test
//	public void testDeleteCategory(){
//		
//		category = categoryDAO.get(4);
//		assertEquals("Successfully deleted a single category in the table!",true, categoryDAO.delete(category));
//	}
	
	
	
	//for get list of category
//	@Test
//	public void testListCategory(){
//		assertEquals("Successfully fetch the list of categories in the table!",2, categoryDAO.list().size());
//	}
	
	@Test
	public void testCRUDCategory() {
		
		// adding new category
		category = new Category();
		category.setName("Xiomi");
		category.setDescription("This is some description for Xiomi");
		category.setImageURL("CAT_5.png"); 
		
		assertEquals("Success Fully added a category inside the table!",true, categoryDAO.add(category));
		
		category = new Category();
		category.setName("Samsung");
		category.setDescription("This is some description for samsung");
		category.setImageURL("CAT_6.png"); 
		
		assertEquals("Success Fully added a category inside the table!",true, categoryDAO.add(category));
		
		//fatch and update the category
		category = categoryDAO.get(2);
		category.setName("Samsung_Test");
		assertEquals("Successfully fatched a single category in the table!",true, categoryDAO.update(category));
		
		//delete the category
		assertEquals("Successfully deleted a single category in the table!",true, categoryDAO.delete(category));
		// menghasilkan false pada is active
		
		//fetching list of categories
		assertEquals("Successfully fetch the list of categories in the table!",1, categoryDAO.list().size());
	}
	
}
