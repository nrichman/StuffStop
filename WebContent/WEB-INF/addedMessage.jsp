<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %>
<%@	page import="com.users.*" %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String url = "conversation.jsp?userA="+request.getAttribute("fromUser")+"&userB="+request.getAttribute("toUser");
%>

<c:redirect url="<%=url%>"/>


