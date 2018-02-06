package com.fogsoft.mymoney.bean;

import com.fogsoft.mymoney.model.User;

public class LoggedUserBean{

	private User user;

	public void login(User user) {
		this.user = user;
	}

	public void logout() {
		this.user = null;
	}
	
	public User getUser() {
		return user;
	}

	public boolean isLogged() {
		return user != null;
	}
}
