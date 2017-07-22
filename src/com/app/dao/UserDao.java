package com.app.dao;

import javax.persistence.NoResultException;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.pojos.User;

@Repository
public class UserDao {
	@Autowired
	private SessionFactory session;
	
	public boolean uploadPic(User user)
	{
		try {
			Query query = session.getCurrentSession().createQuery("from User where email = :email", User.class);
			query.setParameter("email", user.getEmail());
			User resultUser = (User) query.getSingleResult();
			resultUser.setImageAdd(user.getImageAdd());;
			return true;
		} catch (NoResultException e) {
			return false;
		}
	}
}
