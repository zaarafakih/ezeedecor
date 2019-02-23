package net.zf.edbackend.dto;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="product")
public class Product {
	
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private int id;
private String code;

@NotBlank(message="Please enter the Product Name!")
private String name;

@NotBlank(message="Please enter the Product Brand!")
private String brand;

//to tell controller not to create json of this field
@JsonIgnore
@NotBlank(message="Please enter description for Product !")
private String description;

@Column(name="unit_price")
@Min(value=1,message="Price cannot be less than 1!")
private double unitPrice;


private int quantity;
private int purchases;
private int views;

@Transient 
private MultipartFile file;


@Column(name="is_active")
boolean isActive;

public MultipartFile getFile() {
	return file;
}

public void setFile(MultipartFile file) {
	this.file = file;
}

@JsonIgnore
@Column(name="category_id")
private int categoryId;

@JsonIgnore
@Column(name="supplier_id")
private int supplierId;

public Product(){
	this.code="PRD"+UUID.randomUUID().toString().substring(25, 35);
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getCode() {
	return code;
}

public void setCode(String code) {
	this.code = code;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getBrand() {
	return brand;
}

public void setBrand(String brand) {
	this.brand = brand;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public double getUnitPrice() {
	return unitPrice;
}

public void setUnitPrice(double unitPrice) {
	this.unitPrice = unitPrice;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public int getPurchases() {
	return purchases;
}

public void setPurchases(int purchases) {
	this.purchases = purchases;
}

public int getViews() {
	return views;
}

public void setViews(int views) {
	this.views = views;
}

public boolean isActive() {
	return isActive;
}

public void setActive(boolean isActive) {
	this.isActive = isActive;
}

public int getCategoryId() {
	return categoryId;
}

public void setCategoryId(int categoryId) {
	this.categoryId = categoryId;
}

public int getSupplierId() {
	return supplierId;
}

public void setSupplierId(int supplierId) {
	this.supplierId = supplierId;
}

	
	
}
