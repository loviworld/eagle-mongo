package com.eagle.portal.web.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.eagle.commons.dao.SequenceDao;
import com.eagle.commons.exception.DataAccessException;
import com.eagle.commons.exception.ServiceException;
import com.eagle.commons.service.impl.GenericServiceImpl;
import com.eagle.portal.web.dao.ContactInfoDao;
import com.eagle.portal.web.dao.SellerDao;
import com.eagle.portal.web.domain.ContactInfo;
import com.eagle.portal.web.domain.Seller;
import com.eagle.portal.web.service.SellerService;
import com.eagle.user.dao.RoleDao;
import com.eagle.user.domain.Permission;
import com.eagle.user.domain.Role;
import com.eagle.user.domain.User;

@Service
public class SellerServiceImpl extends GenericServiceImpl<Seller>implements SellerService {
	
	@Autowired
	private SellerDao sellerDao;

	@Autowired
	private ContactInfoDao contactInfoDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private SequenceDao sequenceDao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@PostConstruct
	void init() {
		init(Seller.class, sellerDao);
	}

	@Override
	public Seller save(Seller obj) throws ServiceException {

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

	public Seller add(Seller seller) throws ServiceException {
        
        try {
        	//set auto genarated id
        	seller.setId(sequenceDao.getNextSequenceId(User.class.getSimpleName()));
        	
        	//encode password
        	seller.setPassword(passwordEncoder.encode(seller.getPassword()));
        	
        	//set user_role
        	Role role = roleDao.getById(1);//seller's role_id -> 1
        	
        	seller.getRoles().add(role);
        	
        	//set user_permission
        	List<Permission> permissions = role.getPermissions();
        	for(Permission permission : permissions){
        		seller.getPermissions().add(permission);
        	}
        	
        	sellerDao.add(seller);
        	
        	//reset 2nd level references
        	seller.setRoles(new ArrayList<Role>());
        	seller.setPermissions(new ArrayList<Permission>());
            
            return seller;
        } catch (DataAccessException e) {
            throw translateException(e);
        }
    }

	public Seller edit(Seller seller) throws ServiceException {

		try {
			ContactInfo contactInfo = seller.getContactInfo();
			contactInfoDao.add(contactInfo);
			sellerDao.modify(seller);
			
			//reset 2nd level references
        	seller.setRoles(new ArrayList<Role>());
        	seller.setPermissions(new ArrayList<Permission>());
        	seller.setContactInfo(new ContactInfo());
			
			return seller;
		} catch (DataAccessException e) {
			throw translateException(e);
		}
	}
}
