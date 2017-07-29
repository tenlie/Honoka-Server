package com.underdogs.honoka.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AccountServiceImpl implements IAccountService {

	@Autowired
	IAccountDAO dao;
	
	@Override
	public void registerAccount() {
		System.out.println("UserServiceImpl : getUserList()");
		dao.registerAccount();
		System.out.println("UserServiceImpl : return");
	}

}
