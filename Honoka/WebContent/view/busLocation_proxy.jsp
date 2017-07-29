<%@ page language="java" contentType="application/xml"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><% String routeid=request.getParameter("routeid");
	// String url="http://openapi.gbis.go.kr/ws/rest/buslocationservice?serviceKey=JG6akkeZBos3f6FEt8S%2F84KeNeYjiblYeZd3J%2FZZJzkBG6zgKPb0hiOnbhXJKRXPw%2FBhiTeJnrbKM%2BDOl%2BP%2FmA%3D%3D&routeId="+routeid;
	String url="http://openapi.gbis.go.kr/ws/rest/buslocationservice?serviceKey=0123456789&routeId="+routeid;
%><c:import url="<%=url%>" charEncoding="utf-8" ></c:import>
