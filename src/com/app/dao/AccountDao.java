package com.app.dao;

import java.util.List;
import java.util.UUID;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.pojos.Address;
import com.app.pojos.User;

@Repository
public class AccountDao {

	@Autowired
	private SessionFactory session;

	public User validateUser(User user) {
		try {
			return (User) session.getCurrentSession()
					.createQuery("from User u where u.email = :em and u.password = :pass and u.active=1", User.class)
					.setParameter("em", user.getEmail()).setParameter("pass", user.getPassword()).getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (NonUniqueResultException e) {
			return null;
		}
	}

	public boolean addUser(User user) {
		try {
			session.getCurrentSession().save(user);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public void removeUser(User user) {
		try {
			session.getCurrentSession().delete(user);
		} catch (Exception e) {

		}
	}

	public boolean checkEmail(String email) {
		try {
			Query checkEmailQuery = session.getCurrentSession()
					.createQuery("from User u where u.email = :email", User.class).setParameter("email", email);
			checkEmailQuery.getSingleResult();
			System.out.println("inside check email found");
			return true;

		} catch (NoResultException e) {
			System.out.println("inside check email not found");
			return false;
		}

	}

	public boolean activateAccount(String activateId) {
		try {
			Query query = session.getCurrentSession().createQuery("from User where tempId = :tempId", User.class);
			query.setParameter("tempId", activateId);
			User resultUser = (User) query.getSingleResult();
			resultUser.setActive(true);
			resultUser.setTempId(null);
			return true;
		} catch (NoResultException e) {
			return false;
		}
	}

	public String forgotPassword(String email) {
		try {
			Query query = session.getCurrentSession().createQuery("from User u where email = :email", User.class);
			query.setParameter("email", email);
			User user = (User) query.getSingleResult();
			user.setTempId(UUID.randomUUID().toString());
			return user.getTempId();
		} catch (NoResultException e) {
			return null;
		}
	}

	public User recoverPassword(String recoverId) {
		try {

			Query query = session.getCurrentSession().createQuery("from User u where tempId = :tempId", User.class);
			query.setParameter("tempId", recoverId);
			User user = (User) query.getSingleResult();
			User activeUser = new User();
			activeUser.setEmail(user.getEmail());
			activeUser.setTempId(user.getTempId());
			System.out.println("recover id found");
			return activeUser;
		} catch (NoResultException e) {
			System.out.println("recover id not found");
			return null;
		}
	}

	public boolean updatePassword(User activeForgotuser) {
		try {
			Query query = session.getCurrentSession().createQuery("from User u where email = :email", User.class);
			query.setParameter("email", activeForgotuser.getEmail());
			User user = (User) query.getSingleResult();
			user.setTempId(null);
			user.setPassword(activeForgotuser.getPassword());
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	@SuppressWarnings("unchecked")
	public List<String> getCities() {
		return session.getCurrentSession().createQuery("select distinct(a.city) from Address a").getResultList();
	}

}
