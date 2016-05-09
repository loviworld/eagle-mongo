package com.eagle.user.domain;

import org.springframework.data.mongodb.core.mapping.Document;
import com.eagle.commons.domain.EntityBase;

@Document(collection="Permission")
public class Permission extends EntityBase{

    private String code;

    private Short status;

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
}
