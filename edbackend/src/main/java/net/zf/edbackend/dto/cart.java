package net.zf.edbackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	/*
	 * remove this
	 * @Column(name="user_id")
	private int userId;*/
	
	@OneToOne
	@JoinColumn(name="user_id")
	private user userr;

	public user getUserr() {
		return userr;
	}

	public void setUserr(user userr) {
		this.userr = userr;
	}

	@Column(name="grand_total")
	private double grandTotal;
	
	@Column(name="cart_lines")
	private int cartLines;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

	public int getCartLines() {
		return cartLines;
	}

	public void setCartLines(int cartLines) {
		this.cartLines = cartLines;
	}
}
