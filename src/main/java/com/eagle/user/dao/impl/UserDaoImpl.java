package com.eagle.user.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import com.eagle.commons.dao.impl.GenericDaoImpl;
import com.eagle.commons.exception.DataAccessException;
import com.eagle.user.dao.UserDao;
import com.eagle.user.domain.Permission;
import com.eagle.user.domain.User;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao{

	public UserDaoImpl() {
		super(User.class);
	}
	
	@Override
	public User getByEmail(String email) throws DataAccessException {
		
		List<Criteria> criterias = new ArrayList<Criteria>();
		criterias.add(Criteria.where("email").is(email));
		criterias.add(Criteria.where("status").is(1));
		
		Query query = new Query(new Criteria().andOperator(criterias.toArray(new Criteria[criterias.size()])));
		return mongoOperations.findOne(query, User.class);
	}

	@Override
	public List<Permission> getUserPermissions() {
		return null;
	}
}
