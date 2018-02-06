package com.fogsoft.mymoney.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fogsoft.mymoney.dao.UserDao;
import com.fogsoft.mymoney.exception.DuplicateEntityException;
import com.fogsoft.mymoney.model.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	@Transactional
	public void update(User user) {
		userDao.update(user);
	}

	@Transactional
	public void add(User user) throws DuplicateEntityException {
		if( userDao.getByField("email", user.getEmail() ) != null)
			throw new DuplicateEntityException();

		userDao.save(user);
	}

	@Transactional(readOnly = true)
	public List<User> list() {
		return userDao.findAll();
	}

	@Transactional
	public User get(int id) {
		return userDao.getByKey(id);
	}

	@Transactional
	public void delete(int id) {
		User user = userDao.getByKey(id);

		if (user != null)
			userDao.remove(user);
	}
}