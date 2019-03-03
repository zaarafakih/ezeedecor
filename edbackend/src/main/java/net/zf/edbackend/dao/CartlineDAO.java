package net.zf.edbackend.dao;

import java.util.List;

import net.zf.edbackend.dto.CartLine;

public interface CartlineDAO {
public CartLine get(int id);
public boolean add(CartLine cartLine);
public boolean update(CartLine cartLine);
public boolean delete(CartLine cartLine);
public List<CartLine> list(int cartId);

//business methods
public List<CartLine> listAvailable(int cartId);
public CartLine getByCartAndProduct(int cartId,int productId);

}
