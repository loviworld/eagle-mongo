package com.eagle.user.dao.impl;

import org.springframework.stereotype.Repository;

import com.eagle.commons.dao.impl.GenericDaoImpl;
import com.eagle.user.dao.PermissionDao;
import com.eagle.user.domain.Permission;

@Repository
public class PermissionDaoImpl extends GenericDaoImpl<Permission> implements PermissionDao {

	public PermissionDaoImpl() {
		super(Permission.class);
	}
}
