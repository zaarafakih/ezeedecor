package net.zf.ezeedecor.model;

import java.io.Serializable;

import net.zf.edbackend.dto.address;
import net.zf.edbackend.dto.user;

public class RegisterModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private user userr;
	private address billing;
	
	public user getUserr() {
		return userr;
	}
	public void setUserr(user userr) {
		this.userr = userr;
	}
	public address getBilling() {
		return billing;
	}
	public void setBilling(address billing) {
		this.billing = billing;
	}
	
}
