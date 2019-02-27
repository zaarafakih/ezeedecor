package net.zf.edbackend.dto;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="user_detail")
public class user implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="first_name")
	@NotBlank(message="Please enter your First Name!")
	@Pattern(regexp="(^([a-z]|[A-Z])+$)",message="Enter a valid name")
	private String firstName;
	
	@Column(name="last_name")
	@NotBlank(message="Please enter your Last Name!")
	@Pattern(regexp="(^([a-z]|[A-Z])+$)",message="Enter a valid name")
	private String lastName;
	
	@Column(name="role")
	private String role;
	
	private boolean enabled=true;
	
	
	@Length(min=6,max=12,message="The length of the password is too short or too long. Enter between 8-12 chars only")
	@Pattern(regexp="(^([a-z0-9]|[A-Z0-9]|[a-z0-9_@./#&+-]|[A-Z0-9_@./#&+-]|[a-zA-Z0-9_@./#&+-])+$)",message="enter combination of alphabets , digits & special characters")
	private String password;
	
	
	@Transient
	private String confirmPassword;
	
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	@Email
	private String email;
	
	//^([0-9]{10})+$ --> test only 10 digits
	
	@Column(name="contact_number") 
	@Pattern(regexp="((^[987])+(([0-9]{9})+$))",message="Enter a valid phone number!")
	private String contactNumber;
	
	@OneToOne(mappedBy="userr",cascade=CascadeType.ALL)
	private cart cart;
	
	public int getId() {
		return id;
	}

	public cart getCart() {
		return cart;
	}

	public void setCart(cart cart) {
		this.cart = cart;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	
}
