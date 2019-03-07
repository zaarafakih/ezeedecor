package net.zf.edbackend.dao;

import java.util.List;

import net.zf.edbackend.dto.address;
import net.zf.edbackend.dto.cart;
import net.zf.edbackend.dto.user;

public interface UserDAO {

	boolean addUser(user user);
	user getUserByEmail(String emailid);
	
	boolean updateCart(cart cart);
	
	boolean addAddress(address address);
	address getBillingAddress(user user);
	List<address> listShippingAddress(user user);
}
