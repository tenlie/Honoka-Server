<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="com.scsa.busta.route.*" import="com.scsa.busta.route.RouteVO"%>

<%
List<RouteStopVO> list = (List<RouteStopVO>)request.getAttribute("list");
StringBuilder builder = new StringBuilder();
builder.append("<routestops>");
for(RouteStopVO stop:list){
	builder.append("<stop>");
	builder.append("<stopid>");
	builder.append(stop.getStopid());
	builder.append("</stopid>");
	builder.append("<stopname>");
	builder.append(stop.getStopname());
	builder.append("</stopname>");
	builder.append("<stoporder>");
	builder.append(stop.getStoporder());
	builder.append("</stoporder>");
	builder.append("<direction>");
	builder.append(stop.getDirection());
	builder.append("</direction>");	
	builder.append("</stop>");
}
builder.append("</routestops>");
%>
<%=builder%>
