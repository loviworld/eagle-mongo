package com.eagle.user.service.impl;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.commons.dao.SequenceDao;
import com.eagle.commons.exception.DataAccessException;
import com.eagle.commons.exception.ServiceException;
import com.eagle.commons.service.impl.GenericServiceImpl;
import com.eagle.user.dao.RoleDao;
import com.eagle.user.domain.Role;
import com.eagle.user.service.RoleService;

@Service
public class RoleServiceImpl extends GenericServiceImpl<Role> implements RoleService{

	@Autowired
	protected RoleDao roleDao;
	
	@Autowired
	protected SequenceDao sequenceDao;
	
	@PostConstruct
	void init() {
        init(Role.class, roleDao);
    }
	
	@Override
	public Role add(Role obj) throws ServiceException {
		try{
			obj.setId(sequenceDao.getNextSequenceId(Role.class.getSimpleName()));
			roleDao.add(obj);
			return obj;
		}catch (DataAccessException dae) {
            throw translateException(dae);
        }
	}
}
