<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.users.*"
    %>
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
if (user == null){
%>
<h1>You are not registered! Please to go
<a href="registrationform.jsp">Register</a>
</h1>
<%
} else {
%>

<h1> Welcome to the User page!</h1> 
 <h3> Logged in as: <%=user.getloginName() %> </h3>
 <p>Logout?<p>
 <a href="welcome.jsp?value=0">Logout</a><br>

<div>
<h2>~USER PAGE CONTENT~</h2>
<p>This is the page for users</p>

<p>First name: <%=user.getFirstName() %></p>
<p>Last name: <%=user.getSurname() %></p>
<p>Email: <%=user.getEmail() %></p>


<p> more stuff </p>
</div>



<h3>Pages:</h3>

<a href="userPage.jsp">My Page</a><br>
<a href="forumList">NewListings</a><br>




<%
}%>







</body>
</html>