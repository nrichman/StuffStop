<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.users.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<title>Welcome Page</title>

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

<a href="userPage.jsp">My Page</a><br>
<a href="forumList">NewListings</a><br>




<%
}%>


</body>
</html>