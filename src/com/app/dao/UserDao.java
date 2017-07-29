package com.app.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.jsonclasses.RequestJsonP;
import com.app.pojos.Notification;
import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.pojos.User;

@Repository
public class UserDao implements UserDaoInterface {
	@Autowired
	private SessionFactory session;

	public boolean updateProfileImg(User user) {
		try {
			Query<User> query = session.getCurrentSession().createQuery("from User where email = :email", User.class);
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
			System.out.println("in exceptipn" + e.getMessage());
			return false;
		}
	}

	// show property for user home page
	public List<Property> getProperties(User user) {
		List<Property> ls = null;
		if (user.getAddress() != null) {
			if (user.getAddress().getCity() != null) {
				ls = session.getCurrentSession()
						.createQuery("from Property p where p.address.city like :city and p.status=0", Property.class)
						.setParameter("city", "%" + user.getAddress().getCity() + "%").setMaxResults(5).getResultList();
			} else if (user.getAddress().getState() != null) {
				ls = session.getCurrentSession()
						.createQuery("from Property p where p.address.state like :state and p.status=0", Property.class)
						.setParameter("state", "%" + user.getAddress().getState() + "%").setMaxResults(5)
						.getResultList();
			}
		}
		if (ls == null || ls.isEmpty()) {
			ls = session.getCurrentSession().createQuery("from Property p where p.status=0", Property.class)
					.setMaxResults(5).getResultList();
		}

		for (Property p : ls) {
			p.getImages().size();
		}
		return ls;
	}

	// show property using search criteria
	public List<Property> getSearchProperties(Search searchOpt) {
		System.out.println("search opt in dao" + searchOpt.toString());
		List<Property> ls = session.getCurrentSession()
				.createQuery("from Property p where p.address.city like :city " + "and p.accomFor like :accomFor "
						+ "and p.accomType like :accomType " + "and p.propType = :propType " + "and p.rent < :rent "
						+ "and p.status=0 ", Property.class)
				.setParameter("city", "%" + searchOpt.getCity() + "%")
				.setParameter("accomFor", "%" + searchOpt.getAccomFor() + "%")
				.setParameter("accomType", "%" + searchOpt.getAccomType() + "%")
				.setParameter("propType", searchOpt.getPropType()).setParameter("rent", searchOpt.getRent())
				.setFirstResult(searchOpt.getStart()).setMaxResults(5).getResultList();

		for (Property p : ls) {
			p.getImages().size();
		}
		return ls;
	}

	public Property getProperty(int propId) {
		try {
			Query<Property> query = session.getCurrentSession().createQuery("from Property p where p.propId = :propId",
					Property.class);
			query.setParameter("propId", propId);
			Property prop = (Property) query.getSingleResult();
			prop.getImages().size();
			return prop;
		} catch (NoResultException e) {
			return null;
		}
	}

	public boolean sendMessage(RequestJsonP notiData, Notification notification) {
		try {
			Query<Property> query = session.getCurrentSession().createQuery("from Property p where p.propId = :propId",
					Property.class);
			query.setParameter("propId", notiData.getPropId());
			Property prop = (Property) query.getSingleResult();
			notification.setUserId(prop.getUser().getUserId());
			session.getCurrentSession().saveOrUpdate(notification);
			return true;
		} catch (NoResultException e) {
			return false;
		}
	}
}
