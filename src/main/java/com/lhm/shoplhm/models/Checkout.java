package com.lhm.shoplhm.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Table(name="checkouts")
public class Checkout {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Size(min=4, max=100)
	private String cardHolder;
	@Size(min=16, max=16)
	private String cardNumber;
	@Size(min=3, max=3)
	private String securityCode;
	@Size(min=7, max=7)
	private String cardExpiration;
	@Size(min=4, max=100)
	private String addressDelivery;
	@Size(min=2, max=3)
	private String stateDelivery;
	@Min(10000)
	@Max(99999)
	private Integer zipCodeDelivery;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    public Checkout() {
    	
    }
    

	public Checkout(String cardHolder, String cardNumber, String securityCode, String cardExpiration, String addressDelivery, String stateDelivery, Integer zipCodeDelivery, User user) {
		this.cardHolder = cardHolder;
		this.cardNumber = cardNumber;
		this.securityCode = securityCode;
		this.cardExpiration = cardExpiration;
		this.addressDelivery = addressDelivery;
		this.stateDelivery = stateDelivery;
		this.zipCodeDelivery = zipCodeDelivery;
		this.user = user;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCardHolder() {
		return cardHolder;
	}

	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public String getCardExpiration() {
		return cardExpiration;
	}

	public void setCardExpiration(String cardExpiration) {
		this.cardExpiration = cardExpiration;
	}

	public String getAddressDelivery() {
		return addressDelivery;
	}

	public void setAddressDelivery(String addressDelivery) {
		this.addressDelivery = addressDelivery;
	}

	public String getStateDelivery() {
		return stateDelivery;
	}

	public void setStateDelivery(String stateDelivery) {
		this.stateDelivery = stateDelivery;
	}

	public Integer getZipCodeDelivery() {
		return zipCodeDelivery;
	}

	public void setZipCodeDelivery(Integer zipCodeDelivery) {
		this.zipCodeDelivery = zipCodeDelivery;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
    
    
    
    
    
}
