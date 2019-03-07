package net.zf.edbackend.dto;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="address")
public class address implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	 
	@ManyToOne
	@JoinColumn(name="user_id")
	private user userr;
	
	public user getUserr() {
		return userr;
	}

	public void setUserr(user userr) {
		this.userr = userr;
	}
	
	@Column(name="postal_code")
	@NotBlank(message="Please enter your Postal code!")
	@Pattern(regexp="([0-9]{6})",message="Enter a valid postal code")
	private String postalCode;
	
	private boolean shipping;
	
	private boolean billing;
	
	

	@Column(name="address_line_1")
	@NotBlank(message="Please enter your address!")
	private String addressLine1;
	
	@Column(name="address_line_2")
	private String addressLine2;
	
	@NotBlank(message="Please enter your City!")
	@Pattern(regexp="(^([a-z]|[A-Z])+$)",message="Enter a valid city name")
	private String city;
	
	@NotBlank(message="Please enter your state!")
	@Pattern(regexp="(^([a-z]|[A-Z])+$)",message="Enter a valid state name")
	private String state;
	
	@NotBlank(message="Please enter your country!")
	@Pattern(regexp="(^([a-z]|[A-Z])+$)",message="Enter a valid country name")
	private String country;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public boolean isShipping() {
		return shipping;
	}

	public void setShipping(boolean shipping) {
		this.shipping = shipping;
	}

	public boolean isBilling() {
		return billing;
	}

	public void setBilling(boolean billing) {
		this.billing = billing;
	}

	
	
	
}
