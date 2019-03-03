package net.zf.edbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.zf.edbackend.dao.CartlineDAO;
import net.zf.edbackend.dto.CartLine;

@Repository("cartlineDAO")
@Transactional
public class CartlineDAOImpl implements CartlineDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public CartLine get(int id) {
		try{
			return sessionFactory.getCurrentSession().get(CartLine.class, Integer.valueOf(id));
			
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		
	}

	@Override
	public boolean add(CartLine cartLine) {
		try{
			sessionFactory.getCurrentSession().persist(cartLine);
			return true;
			
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean update(CartLine cartLine) {
		try{
			sessionFactory.getCurrentSession().update(cartLine);
			return true;
			
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(CartLine cartLine) {
		
		try{
			//cartLine.setAvailable(false);
			sessionFactory.getCurrentSession().delete(cartLine);
			return true;
			
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		
	}

	@Override
	public List<CartLine> list(int cartId) {
		try{
			return sessionFactory.getCurrentSession()
					.createQuery("FROM CartLine WHERE cartId=:cartId" , CartLine.class)
					.setParameter("cartId", cartId)
					.getResultList();
			
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CartLine> listAvailable(int cartId) {
		try{
			return sessionFactory.getCurrentSession()
					.createQuery("FROM CartLine WHERE cartId=:cartId AND isAvailable=:available" , CartLine.class)
					.setParameter("cartId", cartId)
					.setParameter("available", true)
					.getResultList();
			
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public CartLine getByCartAndProduct(int cartId, int productId) {
		try{
			return sessionFactory.getCurrentSession()
					.createQuery("FROM CartLine WHERE cartId=:cartId AND product.id=:productId" , CartLine.class)
					.setParameter("cartId", cartId)
					.setParameter("productId", productId)
					.getSingleResult();
			
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}

}
