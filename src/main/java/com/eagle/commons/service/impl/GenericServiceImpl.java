package com.eagle.commons.service.impl;

import java.util.List;

import com.eagle.commons.dao.GenericDao;
import com.eagle.commons.exception.DataAccessException;
import com.eagle.commons.exception.ServiceException;
import com.eagle.commons.service.GenericService;

public class GenericServiceImpl<T> implements GenericService<T> {
	
	@SuppressWarnings("unused")
	private Class<? extends T> type;
	protected GenericDao<T> genericDao;
	
	protected void init(Class<? extends T> type, GenericDao<T> dao) {
        this.type = type;
        this.genericDao = dao;
    }
	
	@Override
	public T getById(int id) throws ServiceException {
		try {
            return genericDao.getById(id);
        } catch (DataAccessException dae) {
            throw translateException(dae);
        } catch (Exception e) {
            throw new ServiceException(ServiceException.PROCESSING_FAILED, e.getMessage(), e);
        }
	}

	@Override
	public T add(T obj) throws ServiceException {
		try {
            genericDao.add(obj);
        } catch (DataAccessException dae) {
            throw translateException(dae);
        }
        return obj;
	}

	@Override
	public T edit(T obj) throws ServiceException {
		try {
            genericDao.modify(obj);
        } catch (DataAccessException dae) {
            throw translateException(dae);
        }
        return obj;
	}

	@Override
	public void delete(T object) throws ServiceException {
		try {
            genericDao.add(object);;
        } catch (DataAccessException dae) {
            throw translateException(dae);
        }
	}

	@Override
	public List<T> getAll() throws ServiceException {
		try {
            return genericDao.getAll();
        } catch (DataAccessException dae) {
            throw translateException(dae);
        } catch (Exception e) {
            throw new ServiceException(ServiceException.PROCESSING_FAILED, e.getMessage(), e);
        }
	}

	@Override
	public ServiceException translateException(DataAccessException de) {
		switch (de.getCode()) {
        case DataAccessException.VALIDATION_FAILED:
            return new ServiceException(ServiceException.VALIDATION_FAILED, de.getMessage());
        default:
            return new ServiceException(ServiceException.PROCESSING_FAILED, de.getMessage());
		}
	}

}
