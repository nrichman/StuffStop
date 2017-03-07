<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.users.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
  background-color : #AFEEEE;
} 
table {
    border: 1px solid black;
    margin-left: auto;
	margin-right: auto;
	padding: 10px;
}
td, th{
	 border: 1px solid black;
	padding: 10px;
	text-align: center;
}
div {
	border: 1px solid black;
	align: center;
	margin-left: auto;
	margin-right: auto;
}
p {

	font-size: 90%;
}
h1{

	text-align: center;
	font-size: 200%;

}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Page!</title>
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