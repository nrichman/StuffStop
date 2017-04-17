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

String value;

if (request.getParameter("value")!= null){
	value = request.getParameter("value").toString();
}
else{
	value = "Not found";
}
if (value.equals("0")){
	user = null;
	request.getSession().invalidate();
   
}
if (user == null){
%>
<h2>You are not registered! Please
<a href="registrationform.jsp">Register</a>
Or 
<a href="Login.jsp">Login</a>

</h2>
<%
} else {
%>

<h1> Welcome Page!</h1>
 <h3>Logged in as: <%=user.getloginName() %> </h3>
 <h3>Logout?</h3>
  <a href="welcome.jsp?value=0">Logout</a><br>

<div>
<h2>~MAIN WELCOME PAGE CONTENT~</h2>

</div>
<h3>Pages:</h3>

<a href="userPage.jsp?name=<%=user.getloginName() %> ">My Page</a><br>
<a href="threadList.jsp">NewListings</a><br>
<%}%>


</body>
</html>