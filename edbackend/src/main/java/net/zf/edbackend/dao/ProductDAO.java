package net.zf.edbackend.dao;

import java.util.List;

import net.zf.edbackend.dto.Product;

public interface ProductDAO {

	Product get(int id);
	List<Product> list();
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);
	
	//Business Methods
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product> listLatestActiveProducts(int count);
	List<Product> listActiveProducts();
	
}
