package com.eagle.user.service.impl;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.commons.dao.SequenceDao;
import com.eagle.commons.exception.DataAccessException;
import com.eagle.commons.exception.ServiceException;
import com.eagle.commons.service.impl.GenericServiceImpl;
import com.eagle.user.dao.PermissionDao;
import com.eagle.user.domain.Permission;
import com.eagle.user.service.PermissionService;

@Service
public class PermissionServiceImpl extends GenericServiceImpl<Permission> implements PermissionService{

	@Autowired
	protected PermissionDao permissionDao;
	
	@Autowired
	protected SequenceDao sequenceDao;
	
	@PostConstruct
	void init() {
        init(Permission.class, permissionDao);
    }
	
	@Override
	public Permission add(Permission obj) throws ServiceException {
		try{
			obj.setId(sequenceDao.getNextSequenceId(Permission.class.getSimpleName()));
			permissionDao.add(obj);
			return obj;
		}catch (DataAccessException dae) {
            throw translateException(dae);
        }
	}
}
