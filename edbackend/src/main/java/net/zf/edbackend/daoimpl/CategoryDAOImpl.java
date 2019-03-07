package net.zf.edbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.zf.edbackend.dao.CategoryDAO;
import net.zf.edbackend.dto.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	

	@Override
	public List<Category> list() {
		String getActiveCategoryList="FROM Category WHERE active= :active";
		Query query=sessionFactory.getCurrentSession().createQuery(getActiveCategoryList,Category.class);
		query.setParameter("active", true);
		return query.getResultList();
	}

	@Override
	public Category get(int id) {
		
		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
	}
	
	
	@Override
	public boolean add(Category category) {
		// TODO Auto-generated method stub
		try{
			//add category to database table
			sessionFactory.getCurrentSession().persist(category);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean update(Category category) {
		
		try{
			//add category to database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean delete(Category category) {
		category.setActive(false);
		try{
			//add category to database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}


}