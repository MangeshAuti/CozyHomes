package com.app.service;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.OwnerDao;
import com.app.pojos.Property;
import com.app.pojos.User;

@Service("owner_service")
@Transactional
public class OwnerService {
	@Autowired
	private OwnerDao ownerDao;
	
	public static Object[] reverseArray(Object[] arr) {
	    List<Object> list = Arrays.asList(arr);
	    Collections.reverse(list);
	    return list.toArray();
	}
	
	public User addProperty(Property property,User activeUser)
	{
		property.setStatus(true);
		String[] loc=property.getAddress().getLocation().split(",");
		System.out.println(loc);
		loc=(String[]) reverseArray(loc);
		if(loc.length>=1)
		property.getAddress().setCountry(loc[0]);
		if(loc.length>=2)
			property.getAddress().setState(loc[1]);
		if(loc.length>=3)
			property.getAddress().setCity(loc[2]);
		if(loc.length>=4)
			property.getAddress().setLocation(loc[3]);
		else
			property.getAddress().setLocation(null);
		if(ownerDao.insertProperty(property,activeUser))
			return activeUser;
		return null;
		
	}
	
	public void updateUser(User u)
	{
		ownerDao.updateUser(u);
	}
}
