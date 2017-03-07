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
	text-align: center;
	font-size: 150%;
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
if (user == null){
%>
<h1>You are not registered! Please to go
<a href="registrationform.jsp">Register</a>
</h1>
<%
} else {
%>

<h1> Welcome User!
 <%=user.getloginName() %></h1>

<h2>Pages:</h2>

<a href="myPage.html">My Page</a>
<a href="search.html">Search Page</a>
<a href="listings.html">Listings</a>
<a href="other.html">Other Page</a>




<%
}%>


</body>
</html>