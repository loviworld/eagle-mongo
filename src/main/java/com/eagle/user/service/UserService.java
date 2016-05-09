package com.eagle.user.service;

import java.util.List;

import com.eagle.commons.exception.ServiceException;
import com.eagle.commons.service.GenericService;
import com.eagle.user.domain.User;

public interface UserService extends GenericService<User>{
	
	User getByEmail(String email) throws ServiceException;

    User save(User obj) throws ServiceException;
    
    void delete(int id) throws ServiceException;

    void delete(List<Integer> idList) throws ServiceException;
}
