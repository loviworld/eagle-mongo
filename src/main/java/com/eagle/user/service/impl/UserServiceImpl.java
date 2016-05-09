package com.eagle.user.service.impl;

import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.commons.exception.DataAccessException;
import com.eagle.commons.exception.ServiceException;
import com.eagle.commons.service.impl.GenericServiceImpl;
import com.eagle.user.dao.UserDao;
import com.eagle.user.domain.User;
import com.eagle.user.service.UserService;

@Service
public class UserServiceImpl extends GenericServiceImpl<User> implements UserService{

	@Autowired
	UserDao userDao;
	
	@PostConstruct
	void init() {
        init(User.class, userDao);
    }

	@Override
	public User getByEmail(String email) throws ServiceException {
		try{
			return userDao.getByEmail(email);
		}catch (DataAccessException dae) {
            throw translateException(dae);
        }
	}

	@Override
	public User save(User obj) throws ServiceException {
		if (obj != null) {
            if (obj.getId() == null) {
                this.add(obj);
            } else {
                this.edit(obj);
            }
        } else {
            throw new ServiceException(ServiceException.VALIDATION_FAILED, "label.error.required.user");
        }
        return obj;
	}

	@Override
	public void delete(int id) throws ServiceException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(List<Integer> idList) throws ServiceException {
		// TODO Auto-generated method stub
		
	}
}
