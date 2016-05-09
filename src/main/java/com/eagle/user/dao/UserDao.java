package com.eagle.user.dao;

import java.util.List;
import com.eagle.commons.dao.GenericDao;
import com.eagle.commons.exception.DataAccessException;
import com.eagle.user.domain.Permission;
import com.eagle.user.domain.User;

public interface UserDao extends GenericDao<User>{
	
	User getByEmail(String email) throws DataAccessException;

	List<Permission> getUserPermissions();
}
