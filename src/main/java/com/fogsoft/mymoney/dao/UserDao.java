package com.fogsoft.mymoney.dao;

import org.springframework.stereotype.Repository;

import com.fogsoft.mymoney.model.User;

@Repository
public class UserDao extends AbstractDao<User> {

	public UserDao() {
		super(User.class);
	}
}