<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>

    <jsp:useBean id="user" scope="session" class="com.users.User">
    </jsp:useBean>
<%
	user.setloginName(request.getAttribute("id").toString());
	user.setPass(request.getAttribute("pass").toString());
	user.setFirstName(request.getAttribute("firstname").toString());
	user.setSurname(request.getAttribute("lastname").toString());
	user.setEmail(request.getAttribute("email").toString());
%>
    
<h1> Thank you for registering <b> <%=user.getloginName() %> </b>!</h1>

<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");
%>


<div>
<p>
<a href="welcome.jsp">Go to Welcome Page</a>
<p>
</div>

</body>
</html>