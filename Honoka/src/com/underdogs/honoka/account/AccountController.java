package com.underdogs.honoka.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.underdogs.honoka.user.IUserService;
import com.underdogs.honoka.user.UserVO;

@Controller
@SuppressWarnings("unchecked")
public class AccountController {
	
	@Autowired
	IAccountService service;
	IAccountService a_service;

	
	
	//회원 로그인하기
	@RequestMapping(value="/accountLogin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String member_login(String mid, String mpassword, Model m){
		
		
		return "";
		//AccountVO account = service.(mid);
	
	}
	
	
	@RequestMapping("/registerAccount.do")
	public void registerAccount(){

		System.out.println("registerAccount AccountController");
		
/*		List<UserVO> Account = service.getUserList();
		UserVO user = users.get(0);
		System.out.println(user.toString());
		JSONObject jsonObj =  new JSONObject();
		
		try
		{
			jsonObj.put("userid", user.getUserID());
			jsonObj.put("crunchtime", user.getCrunchTime());
			jsonObj.put("acid", user.getAcID());
			jsonObj.put("achvid", user.getAchvID());
			System.out.println("Hello");
			System.out.println(jsonObj);
		}
		catch(Exception e)
		{
			System.out.println("Exception");
			jsonObj.put("userid", "-1");
		}
		finally
		{
			//return jsonObject.toJSONString();
		}
*/
	}
	@RequestMapping("/AccountCheck.do")
	public int AccountCheck(String aid, Model m){
		int flag = 1;
		if(a_service.accountCheck(aid)==null){
			flag = 0;
			System.out.println("�ùٸ� ���̵��Դϴ�.");
		}
		return flag;
	}
	@RequestMapping("/GetCompanyInfo.do")
	public List<CompanyVO> getCompanyInfo(String c_name, Model m){
		a_service.getCompanyInfo(c_name);
		return null;
		
	}
}
