<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %> 
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import="com.users.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>

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

<%
String fromUser = request.getParameter("userA");
String toUser = request.getParameter("userB");
%>


<%
/*Gets all of the information from THREAD to print the available threads*/
Connection connection = null;
String url = "jdbc:mysql://ec2-52-10-150-59.us-west-2.compute.amazonaws.com:3306/myDB";
try {
	connection = DriverManager.getConnection(url, "newremoteuser", "password");
} catch (SQLException e) {
	System.out.println("Connection Failed! Check output console");
	e.printStackTrace();
	return;
}
System.out.println(toUser + " " + fromUser);
String selectSQL1 = "SELECT * FROM MESSAGE";
PreparedStatement preparedStatement = connection.prepareStatement(selectSQL1);
ResultSet rs = preparedStatement.executeQuery();
%>

<center>
<table>
<tr>
<td>USERNAME&nbsp;</td><td>TEXT</td>
</tr>
<%
while (rs.next()) {
                %>
                
                <tr>
                <%
                if(rs.getString("fromUser").equals(request.getParameter("userA")) || rs.getString("toUser").equals(request.getParameter("userA"))){
                String userSource = rs.getString("fromUser");
                String message = rs.getString("message");
                %>
                
                 <td><%=userSource%></td>
                 <td><%=message%></td>
               </tr>
               <%
            }}
%>
</table>
</center>

<b>New Message:</b>
<form action="messageUser" method="post">
 	<input type="hidden" name="toUser" value="<%=toUser%>"/>
 	<input type="hidden" name="fromUser" value="<%=fromUser%>"/>
	Text: <input type="text"  name="message"/>

      <p><input type="submit" value="Submit"/></p>
</form>

<h3>Pages:</h3>
<a href="welcome.jsp">Welcome Page</a><br>
<a href="userPage.jsp">My Page</a><br>
</div>
</body>
</html>