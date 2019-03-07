package net.zf.edbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.zf.edbackend.dao.ProductDAO;
import net.zf.edbackend.dto.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public Product get(int id) {
		return sessionFactory.getCurrentSession().get(Product.class, Integer.valueOf(id));
	}

	@Override
	public List<Product> list() {
		String activeProductFetching="FROM Product";
		Query query=sessionFactory.getCurrentSession().createQuery(activeProductFetching);
		
		
		return query.getResultList();
	}

	@Override
	public boolean add(Product product) {
		try{
			sessionFactory.getCurrentSession().persist(product);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean update(Product product) {
		
		try{
			sessionFactory.getCurrentSession().update(product);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Product product) {
		product.setActive(false);
		try{
			sessionFactory.getCurrentSession().update(product);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Product> listActiveProductsByCategory(int categoryId) {
		String activeProductByCategory="FROM Product WHERE isActive=:active AND categoryId= :categoryId";
		Query query=sessionFactory.getCurrentSession().createQuery(activeProductByCategory);
		query.setParameter("active", true); 
		query.setParameter("categoryId", categoryId);
		
		return query.getResultList();
	}

	@Override
	public List<Product> listLatestActiveProducts(int count) {
	
		String activelatestProductFetching="FROM Product WHERE isActive=:active Order By Id";
		Query query=sessionFactory.getCurrentSession().createQuery(activelatestProductFetching);
		query.setParameter("active", true); 
		query.setFirstResult(0);
		query.setMaxResults(count);
		return query.getResultList();
		
		
	}

	@Override
	public List<Product> listActiveProducts() {
		String activeProductFetching="FROM Product WHERE isActive=:active";
		Query query=sessionFactory.getCurrentSession().createQuery(activeProductFetching);
		query.setParameter("active", true); 
		
		return query.getResultList();
	}

}
