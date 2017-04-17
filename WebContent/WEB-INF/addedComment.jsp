<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %>
<%@	page import="com.users.*" %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String threadID = request.getAttribute("userid").toString();
String redirectURL = "comments.jsp?ID=" + threadID;
%>


<c:redirect url="<%=redirectURL%>"/>

