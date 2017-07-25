package com.app.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.pojos.User;

@Repository
public class UserDao {
	@Autowired
	private SessionFactory session;

	public boolean updateProfileImg(User user) {
		try {
			Query query = session.getCurrentSession().createQuery("from User where email = :email", User.class);
			query.setParameter("email", user.getEmail());
			User resultUser = (User) query.getSingleResult();
			resultUser.setImageAdd(user.getImageAdd());
			return true;
		} catch (NoResultException e) {
			return false;
		}
	}

	public boolean updateProfile(User user) {
		try {
			session.getCurrentSession().saveOrUpdate(user);
			return true;
		} catch (Exception e) {
			System.out.println("in exceptipn"+e.getMessage());
			return false;
		}
	}

	public List<Property> getProperties(User user) {
		List<Property> ls = null;
		if (user.getAddress() != null) {
			if (user.getAddress().getLocation() != null) {
				ls = session.getCurrentSession()
						.createQuery("from Property p where p.address.location like :location and p.status=1",
								Property.class)
						.setParameter("location", "%" + user.getAddress().getLocation() + "%").setMaxResults(5).getResultList();
			}
			else if (!ls.isEmpty() && user.getAddress().getCity() != null) {
				ls = session.getCurrentSession()
						.createQuery("from Property p where p.address.city like :city and p.status=1", Property.class)
						.setParameter("city", "%" + user.getAddress().getCity() + "%").setMaxResults(5).getResultList();
			}
			else if (!ls.isEmpty()  && user.getAddress().getState() != null) {
				ls = session.getCurrentSession()
						.createQuery("from Property p where p.address.state like :state and p.status=1", Property.class)
						.setParameter("state", "%" + user.getAddress().getState() + "%").setMaxResults(5).getResultList();
			}
		}
		if (ls==null||ls.isEmpty() ) {
			ls = session.getCurrentSession()
					.createQuery("from Property p where p.address.city like :city and p.status=1", Property.class)
					.setParameter("city", "%pune%").setMaxResults(5).getResultList();
		}

		for (Property p : ls) {
			p.getImages().size();
		}
		return ls;
	}

	
}
