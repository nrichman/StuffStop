<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %> 
<%@ page import="com.users.*" %>

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
	text-align: center;
	font-size: 150%;
}
h1{

	text-align: center;
	font-size: 200%;

}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listings Page</title>
</head>
<body>

<%
User user = (User) session.getAttribute("user");
if (user == null){
%>
<h3>You are not registered! Please to go
<a href="registrationform.jsp">Register</a>
</h3>

<% 
} else {	
	%><h3>Logged in as: <%=user.getloginName() %></h3>
	<h3>Logout?</h3>
	 <a href="welcome.jsp?value=0">Logout</a><br>
<%
}
%>



<h1>LISTINGS FOR <b>ROCKS</b></h1>
<div>



<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");

%>
<table>
<tr>
<td>ID</td><td>Item Name</td>
<td>Owner</td><td>Buy Or Sell</td><td>Price</td><td>Posted on</td>
</tr>
<%
while (rs.next()) {
                %>
                <tr>
                <%
				String id = rs.getString("id");
                String itemname = rs.getString("itemname");
                String owner = rs.getString("owner");      
                
                String bos = rs.getString("bos");
                String price = rs.getString("price");
                String posted = rs.getString("posted");
                
    
                
                %>
                
                
                 <td> <%= id %> </td>
                 <td><%= itemname %> </td>
                 <td><%= owner %></td>
                 <td><%= bos %></td>
                 <td><%= price %></td>
                 <td><%= posted %></td>
                 
     
               <%
               %>
               </tr>
               <%
            }
%>
</table>
</div>

<div>
<h3>Pages:</h3>
<a href="userPage.jsp">My Page</a><br>
<a href="search.html">Search Page</a><br>
<a href="other.html">Other Page</a><br>
<a href="welcome.jsp">Welcome Page</a><br>
</div>
</body>
</html>