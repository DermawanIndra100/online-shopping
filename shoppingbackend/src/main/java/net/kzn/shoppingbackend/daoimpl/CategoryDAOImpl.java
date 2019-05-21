package net.kzn.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.CategoryDAO;
import net.kzn.shoppingbackend.dto.Category;

@Repository("categoryDAO")
@Transactional //deleted for static input hibernate
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	//this for insert
//	private static List<Category> categories = new ArrayList<>();
//	
//	static{
//		
//		Category category = new Category();
//		
//		//adding first category
//		category.setId(1);
//		category.setName("Television");
//		category.setDescription("This is some description for television");
//		category.setImageURL("CAT_1.png");
//		
//		categories.add(category);
//		
//		//second category
//		category = new Category();
//		category.setId(2);
//		category.setName("Mobile");
//		category.setDescription("This is some description for mobile");
//		category.setImageURL("CAT_2.png");
//		
//		categories.add(category);
//		
//		//third category
//		category = new Category();
//		category.setId(3);
//		category.setName("Laptop");
//		category.setDescription("This is some description for Laptop");
//		category.setImageURL("CAT_3.png");
//		
//		categories.add(category);
//		
//	}
	
	
	@Override
	public List<Category> list() {
		
		String selectActiveCategory = "FROM Category WHERE active = :active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		query.setParameter("active",true);
		return query.getResultList();
		
//		return categories; // static input hibernate
//		return null; //ngetes dapetin query / get
	}

	//for geting single category ngetes dapetin query / get
	@Override
	public Category get(int id) {
		//this for static input hibernate
		// enchanced for loop
//		for(Category category : categories){
//			if(category.getId() == id) return category;
//		}
		
		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id)); //this for ngetes dapetin query / get
	}

	@Override
	//@Transactional //static input hibernate
	public boolean add(Category category) {
		try{
			sessionFactory.getCurrentSession().persist(category);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	// for updating single category
	@Override
	public boolean update(Category category) {
		try{
			sessionFactory.getCurrentSession().update(category);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		//membuat getMethod
//		// TODO Auto-generated method stub 
//		return false; 
	}

	@Override
	public boolean delete(Category category) {
		
		category.setActive(false);
		
		try{
			sessionFactory.getCurrentSession().update(category);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	
	

}
