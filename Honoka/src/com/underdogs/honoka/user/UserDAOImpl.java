package com.underdogs.honoka.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements IUserDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public List<UserVO> getUserList() {
		System.out.println("UserDAOImpl : getUserList()");
		List<UserVO> users=session.selectList("user.getUserList");
		System.out.println(users.toString());
		
		return users;
	}

}
