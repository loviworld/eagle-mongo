package com.eagle.portal.web.service.impl;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eagle.commons.exception.DataAccessException;
import com.eagle.commons.exception.ServiceException;
import com.eagle.commons.service.impl.GenericServiceImpl;
import com.eagle.portal.web.dao.ContactInfoDao;
import com.eagle.portal.web.domain.ContactInfo;
import com.eagle.portal.web.service.ContactInfoService;

@Service
public class ContactInfoServiceImpl extends GenericServiceImpl<ContactInfo> implements ContactInfoService{

	@Autowired
	private ContactInfoDao contactInfoDao;
	
	@PostConstruct
    void init() {
        init(ContactInfo.class, contactInfoDao);
    }
	
	@Override
    public ContactInfo save(ContactInfo obj) throws ServiceException {

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
	
	public ContactInfo add(ContactInfo contactInfo) throws ServiceException {
        
        try {
        	contactInfoDao.add(contactInfo);
            //do other sub objects related things here..
            return contactInfo;
        } catch (DataAccessException e) {
            throw translateException(e);
        }
    }

    public ContactInfo edit(ContactInfo contactInfo) throws ServiceException {

        try {
        	contactInfoDao.modify(contactInfo);
            return contactInfo;
        } catch (DataAccessException e) {
            throw translateException(e);
        }
    }
}
