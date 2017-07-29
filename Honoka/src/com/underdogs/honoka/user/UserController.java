package com.underdogs.honoka.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SuppressWarnings("unchecked")
public class UserController {
	
	@Autowired
	IUserService service;
	
	@RequestMapping("/getUserList.do")
	public String getUserList(Model m){
		
		System.out.println("getUserList");
		List<UserVO> users = service.getUserList();
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

		return "redirect:index.jsp";
	}

}
