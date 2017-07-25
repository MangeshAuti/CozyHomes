package com.app.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

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

	public boolean insertProperty(Property property, User user) {
		try {

			session.getCurrentSession().update(user);
			user.addProperty(property);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public int addProperty(Property property) {
		return (int) session.getCurrentSession().save(property);
	}

	public List<Property> getPropertyList(User user) {
		List<Property> ls = session.getCurrentSession()
				.createQuery("from Property p where user.userId =:userId", Property.class)
				.setParameter("userId", user.getUserId()).getResultList();

		for (Property p : ls) {
			p.getImages().size();
		}

		return ls;

	}

	public boolean delProperty(int propId, int userId) {
		try {
			Query query = session.getCurrentSession().createQuery("from Property p where propId =:propId",
					Property.class);
			query.setParameter("propId", propId);
			Property p = (Property) query.getSingleResult();
			if (p.getUser().getUserId() != userId)
				return false;
			session.getCurrentSession().delete(p);
			return true;
		} catch (NoResultException e) {
			return false;
		} catch (NonUniqueResultException e) {
			return false;
		}

	}

	public Property updatePropety(Property updateProperty, User propertyOwner) {
		try {
			Query query = session.getCurrentSession().createQuery("from Property p where propId =:propId",
					Property.class);
			query.setParameter("propId", updateProperty.getPropId());
			Property p = (Property) query.getSingleResult();
			if (p.getUser().getUserId() != propertyOwner.getUserId())
				return null;
			p.getImages().size();
			p.setAccomFor(updateProperty.getAccomFor());
			p.setAccomType(updateProperty.getAccomType());
			p.setDeposite(updateProperty.getDeposite());
			p.setRent(updateProperty.getRent());
			p.setFurnishType(updateProperty.getFurnishType());
			session.getCurrentSession().saveOrUpdate(p);
			return p;
		} catch (NoResultException e) {
			return null;
		} catch (NonUniqueResultException e) {
			return null;
		}

	}

	public boolean statusUpdateOfProperty(Property updateProperty, int userId) {
		try {
			Query query = session.getCurrentSession().createQuery("from Property p where propId =:propId",
					Property.class);
			query.setParameter("propId", updateProperty.getPropId());
			Property p = (Property) query.getSingleResult();
			if (p.getPropId() != userId)
				return false;
			p.setStatus(updateProperty.isStatus());
			return true;
		} catch (NoResultException e) {
			return false;
		} catch (NonUniqueResultException e) {
			return false;
		}

	}
}
