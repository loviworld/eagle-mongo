package com.eagle.user.dao.impl;

import org.springframework.stereotype.Repository;
import com.eagle.commons.dao.impl.GenericDaoImpl;
import com.eagle.user.dao.RoleDao;
import com.eagle.user.domain.Role;

@Repository
public class RoleDaoImpl extends GenericDaoImpl<Role> implements RoleDao {

	public RoleDaoImpl() {
		super(Role.class);
	}
	
}
