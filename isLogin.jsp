<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%
	Fuser user=(Fuser)session.getAttribute("user");
	if(user==null)
	{
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>