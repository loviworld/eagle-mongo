package com.eagle.user.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import com.eagle.commons.domain.EntityBase;

@Document(collection="User")
public class User extends EntityBase{

	public static final String user_type_admin = "admin";
	public static final String user_type_seller = "seller";
	public static final String user_type_buyer = "buyer";
	
    private String email;

    private String password;
   
    private Date lastLoggedOn;

    private Date registeredOn;

    private Short attempts;

    private Short status;

    @DBRef
    private List<Role> roles = new ArrayList<>();

    @DBRef
    private List<Permission> permissions = new ArrayList<>();
    
    /**
     * seller | buyer
     */
    private String userType;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLastLoggedOn() {
        return lastLoggedOn;
    }

    public void setLastLoggedOn(Date lastLoggedOn) {
        this.lastLoggedOn = lastLoggedOn;
    }

    public Date getRegisteredOn() {
        return registeredOn;
    }

    public void setRegisteredOn(Date registeredOn) {
        this.registeredOn = registeredOn;
    }

    public Short getAttempts() {
        return attempts;
    }

    public void setAttempts(Short attempts) {
        this.attempts = attempts;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
   
}
