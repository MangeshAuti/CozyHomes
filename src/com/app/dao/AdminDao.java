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
public class AdminDao implements AdminDaoInterface {
	@Autowired
	private SessionFactory session;

	public boolean delProperty(int propId) {
		try {
			Query<Property> query = session.getCurrentSession().createQuery("from Property p where propId =:propId",
					Property.class);
			query.setParameter("propId", propId);
			Property p = (Property) query.getSingleResult();
			session.getCurrentSession().delete(p);
			return true;
		} catch (NoResultException e) {
			return false;
		} catch (NonUniqueResultException e) {
			return false;
		}
	}

	public boolean updateVerificationStatus(Property updateProperty) {
		try {
			Query<Property> query = session.getCurrentSession().createQuery("from Property p where propId =:propId",
					Property.class);
			query.setParameter("propId", updateProperty.getPropId());
			Property p = (Property) query.getSingleResult();
			p.setVerificationStatus(updateProperty.isStatus());
			return true;
		} catch (NoResultException e) {
			return false;
		} catch (NonUniqueResultException e) {
			return false;
		}

	}

	public List<User> showUsers() {
		List<User> ls = session.getCurrentSession().createQuery("from User", User.class).getResultList();
		return ls;
	}

	public List<Property> showproperties(int start) {
		List<Property> ls = session.getCurrentSession().createQuery("from Property", Property.class)
				.setFirstResult(start).setMaxResults(5).getResultList();
		for (Property p : ls) {
			p.getImages().size();
		}
		return ls;
	}

	public boolean updatePropety(Property updateProperty) {
		try {
			Query<Property> query = session.getCurrentSession().createQuery("from Property p where propId =:propId",
					Property.class);
			query.setParameter("propId", updateProperty.getPropId());
			Property p = (Property) query.getSingleResult();
			p.getImages().size();
			p.setAccomFor(updateProperty.getAccomFor());
			p.setAccomType(updateProperty.getAccomType().trim());
			p.setDeposite(updateProperty.getDeposite());
			p.setRent(updateProperty.getRent());
			p.setFurnishType(updateProperty.getFurnishType());
			p.setNoBeds(updateProperty.getNoBeds());
			p.setNoRooms(updateProperty.getNoRooms());
			session.getCurrentSession().saveOrUpdate(p);
			return true;
		} catch (NoResultException e) {
			return false;
		} catch (NonUniqueResultException e) {
			return false;
		}
	}
}
