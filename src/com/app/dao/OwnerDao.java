package com.app.dao;

import javax.management.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.pojos.Property;
import com.app.pojos.User;

@Repository
public class OwnerDao {

	@Autowired
	private SessionFactory session;
	
	public boolean insertProperty(Property property,User user)
	{
		try{
			session.getCurrentSession().update(user);
			user.addProperty(property);
			return true;
		}catch(Exception e)
		{
			return false;
		}
	}
	
	public void updateUser(User user)
	{
		session.getCurrentSession().update(user);
	}
}
