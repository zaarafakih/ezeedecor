package net.zf.edbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.zf.edbackend.dao.UserDAO;
import net.zf.edbackend.dto.address;
import net.zf.edbackend.dto.cart;
import net.zf.edbackend.dto.user;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean addUser(user user) {
		try{
			sessionFactory.getCurrentSession().persist(user);
			return true;
			
		}catch(Exception ex){
			return false;
		}
		
	}

	@Override
	public boolean updateCart(cart cart) {
		try{
			sessionFactory.getCurrentSession().update(cart);
			return true;
			
		}catch(Exception ex){
			return false;
		}
	}

	@Override
	public boolean addAddress(address address) {
		try{
			sessionFactory.getCurrentSession().persist(address);
			return true;
			
		}catch(Exception ex){
			return false;
		}
	}

	@Override
	public user getUserByEmail(String emailid) {
		String sql="FROM user WHERE email=:emailid";
		try{
			return sessionFactory.getCurrentSession().createQuery(sql, user.class).setParameter("emailid", emailid).getSingleResult();
			
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public address getBillingAddress(user user){
		String sql="FROM address WHERE userr= :user AND billing= :billing";
		try{
			return sessionFactory
					.getCurrentSession()
					.createQuery(sql, address.class)
					.setParameter("user", user)
					.setParameter("billing", true)
					.getSingleResult();
					
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<address> listShippingAddress(user user) {
		String sql="FROM address WHERE userr= :user AND shipping=:shipping";
		try{
			return sessionFactory.getCurrentSession()
					.createQuery(sql, address.class)
					.setParameter("user", user)
					.setParameter("shipping", true)
					.getResultList();
			
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}

}
