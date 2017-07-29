package com.underdogs.honoka.account;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOImpl implements IAccountDAO {

	@Autowired
	SqlSession session;
	
	
	@Override
	public void registerAccount(AccountVO account) {
		// TODO Auto-generated method stub
	session.insert("account.registerAccount",account);
		
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

	@Override
	public String loginAccount(String acid, String pwd) {
		// TODO Auto-generated method stub
		AccountVO account = session.selectOne("account.loginAccount",acid);
		String result = "1"; //로그인 오류 : 1 , 로그인 성공 : 0
		if(pwd.equals(account.getPwd())){
			result="0";
		}
		return result;
	}

	/*
	 * @Override public List<UserVO> getUserList() { System.out.println(
	 * "UserDAOImpl : getUserList()"); List<UserVO>
	 * users=session.selectList("user.getUserList");
	 * System.out.println(users.toString());
	 * 
	 * return users; }
	 */

}
