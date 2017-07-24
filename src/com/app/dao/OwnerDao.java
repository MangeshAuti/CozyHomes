package com.app.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
	
	public int addProperty(Property property)
	{
		return (int) session.getCurrentSession().save(property);
	}
	
	public void updateUser(User user)
	{
		session.getCurrentSession().update(user);
	}

	public List<Property> getPropertyList(User user) {
		List<Property> ls= session.getCurrentSession().createQuery("from Property p where user.userId =:userId",Property.class)
				.setParameter("userId", user.getUserId()).getResultList();
		
		for(Property p:ls)
		{
			p.getImages().size();
			
		}
		
		return ls;
		
	}

	public void delProperty(int propId) {
		Query query=session.getCurrentSession().createQuery("from Property p where propId =:propId",Property.class);
		query.setParameter("propId", propId);
		Property p=(Property) query.getSingleResult();
		session.getCurrentSession().delete(p);
	}
}
