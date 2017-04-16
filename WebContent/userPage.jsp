<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.users.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<%
User user = (User) session.getAttribute("user");
if (user == null){ %>
<c:redirect url="/welcome.jsp"/>
<% } %>

<h1> Welcome to <b><%= request.getParameter("name") %></b>'s User page!</h1> 
 <h3> Logged in as: <%=user.getloginName() %> </h3>

<div>
</div>



<h3>Pages:</h3>

<a href="userPage.jsp">My Page</a><br>
<a href="forumList">NewListings</a><br>
<a href="welcome.jsp?value=0">Logout</a><br>

</body>
</html>