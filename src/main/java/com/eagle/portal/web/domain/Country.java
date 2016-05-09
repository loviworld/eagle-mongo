package com.eagle.portal.web.domain;

import org.springframework.data.mongodb.core.mapping.Document;

import com.eagle.commons.domain.EntityBase;

@Document(collection="Country")
public class Country extends EntityBase{

	private String name;
	
	private String abbreviation;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

}
