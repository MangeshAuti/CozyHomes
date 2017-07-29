package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.AccountDaoInterface;

@Service("address_service")
@Transactional
public class AddressService implements AddressServiceInterface {

	@Autowired
	AccountDaoInterface accountDao;

	public List<String> getcity() {
		return accountDao.getCities();
	}

}
