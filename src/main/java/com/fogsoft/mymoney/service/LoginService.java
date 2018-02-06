package com.fogsoft.mymoney.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fogsoft.mymoney.bean.LoggedUserBean;
import com.fogsoft.mymoney.dao.UserDao;
import com.fogsoft.mymoney.model.User;

@Service
public class LoginService {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private HttpSession session;

	@Transactional
	public boolean login(User login) {
		User user = userDao.getByField("email", login.getEmail());
		
		if (user != null && user.getPassword().equals(login.getPassword())) {
			
			LoggedUserBean loggedUser = new LoggedUserBean();
			loggedUser.login(user);
			session.setAttribute("loggedUser", loggedUser);
			return true;
		}
		
		return false;
	}
	
	public void logout() {
		session.removeAttribute("loggedUser");
	}

	public boolean isLogged() {
		LoggedUserBean loggedUser = (LoggedUserBean) session.getAttribute("loggedUser");
		return loggedUser == null ? false : loggedUser.isLogged();
	}
}
