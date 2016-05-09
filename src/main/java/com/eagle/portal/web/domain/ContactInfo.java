package com.eagle.portal.web.domain;

import java.util.HashSet;
import java.util.Set;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import com.eagle.commons.domain.EntityBase;

@Document(collection="ContactInfo")
public class ContactInfo extends EntityBase{

	private String address1;
	
	private String address2;
	
	private String city;
	
	private String postalCode;
	
	private String stateProvince;
	
	@DBRef
	private Country country;
	
	private String mobile;
	
	private String phone;
	
	private String fax;
	
	private String hotline;
	
	private String email;
	
	private String websiteUrl;

	@DBRef
	private Set<Seller> sellers = new HashSet<Seller>();

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getStateProvince() {
		return stateProvince;
	}

	public void setStateProvince(String stateProvince) {
		this.stateProvince = stateProvince;
	}
	
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getHotline() {
		return hotline;
	}

	public void setHotline(String hotline) {
		this.hotline = hotline;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public Set<Seller> getSellers() {
		return sellers;
	}

	public void setSellers(Set<Seller> sellers) {
		this.sellers = sellers;
	}
	
}
