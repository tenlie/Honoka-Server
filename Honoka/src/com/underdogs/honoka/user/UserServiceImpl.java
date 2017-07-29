package com.underdogs.honoka.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService{
	
	@Autowired
	IUserDAO dao;

	@Override
	public List<UserVO> getUserList() {
		System.out.println("UserServiceImpl : getUserList()");
		List<UserVO> users = dao.getUserList();
		System.out.println("UserServiceImpl : return");
		return users;
	}
}
