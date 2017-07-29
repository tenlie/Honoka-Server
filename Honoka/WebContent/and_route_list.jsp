<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="com.scsa.busta.route.*" import="com.scsa.busta.route.RouteVO"%>

<%
List<RouteVO> list = (List<RouteVO>)request.getAttribute("list");
StringBuilder builder = new StringBuilder();
builder.append("<routelist>");
for(RouteVO route:list){
	builder.append("<route>");
	builder.append("<routenum>");
	builder.append(route.getRoutenum());
	builder.append("</routenum>");
	builder.append("<routeid>");
	builder.append(route.getRouteid());
	builder.append("</routeid>");
	builder.append("<startstop>");
	builder.append(route.getStartstop());
	builder.append("</startstop>");
	builder.append("<endstop>");
	builder.append(route.getEndstop());
	builder.append("</endstop>");	
	builder.append("</route>");
}
builder.append("</routelist>");
%>
<%=builder%>

