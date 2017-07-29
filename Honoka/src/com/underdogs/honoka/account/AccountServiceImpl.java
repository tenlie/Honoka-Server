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
		// TODO Auto-generated method stub
		
	}

	@Override
	public String accountCheck(String aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompanyVO> getCompanyInfo(String c_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAccount(String pwd, String field, String company) {
		// TODO Auto-generated method stub
		
	}
	

	}

}
