package com.eagle.user.domain;

import java.util.ArrayList;
import java.util.List;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import com.eagle.commons.domain.EntityBase;

@Document(collection="Role")
public class Role extends EntityBase{

    public static final String ROLE_ROOT = "role.root";
    public static final String ROLE_SELLER = "role.seller";
    public static final String ROLE_BUYER = "role.buyer";
    public static final String ROLE_SELLER_EMPLOYEE = "role.seller.employee";

    private String code;

    private Short status;

    @DBRef
    private List<Permission> permissions = new ArrayList<>();

    public String getCode() {
        return this.code;
    }

    public void setCode(String name) {
        this.code = name;
    }

    public Short getStatus() {
        return this.status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
}
