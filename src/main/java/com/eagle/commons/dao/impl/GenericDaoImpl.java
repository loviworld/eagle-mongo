package com.eagle.commons.dao.impl;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import com.eagle.commons.dao.GenericDao;
import com.eagle.commons.exception.DataAccessException;

public class GenericDaoImpl<T> implements GenericDao<T>{

	private static final Logger logger = LoggerFactory.getLogger(GenericDaoImpl.class);
	
	@Autowired
	protected MongoOperations mongoOperations;
	
	private Class<T> type;
	
	public GenericDaoImpl(Class<T> type) {
		this.type = type;
	}
	
	@Override
	public T getById(Object id) throws DataAccessException {
		logger.debug("type {} getById", type);
		return mongoOperations.findById(id, type);
	}

	@Override
	public List<T> getAll() throws DataAccessException {
		logger.debug("type {} getAll", type);
		return mongoOperations.findAll(type);
	}

	@Override
	public void delete(T object) throws DataAccessException {
		logger.debug("type {} delete", type);
		mongoOperations.remove(object);
	}

	@Override
	public void add(T object) throws DataAccessException {
		logger.debug("type {} add", type);
		mongoOperations.insert(object);
	}

	@Override
	public void modify(T object) throws DataAccessException {
		logger.debug("type {} modify", type);
		mongoOperations.save(object);
	}

	@Override
	public MongoOperations getMongoOperations() {
		return mongoOperations;
	}
}
