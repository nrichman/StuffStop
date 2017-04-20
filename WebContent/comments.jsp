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
String threadNo = request.getParameter("ID");
String location = request.getParameter("location");
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
String selectSQL = "SELECT * FROM COMMENT WHERE ID = " + threadNo;
PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
ResultSet rs = preparedStatement.executeQuery();

String selectSQL2 = "SELECT * FROM THREAD WHERE ID = " + threadNo;
PreparedStatement preparedStatement2 = connection.prepareStatement(selectSQL2);
ResultSet rs2 = preparedStatement2.executeQuery();
%>


<%/* REMOVE THREAD */
System.out.println(rs2.last());
String thisUser = rs2.getString("user");
if(thisUser.equals(user.getloginName())){
%>

<form action="removeForum" method="post">
<input type="hidden" name="ID" value="<%=threadNo%>"/>
<p><input type="submit" value="Remove Thread"/></p>
</form>

<%
}
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
                String userName = rs.getString("user");
                String text = rs.getString("text");
                
                String href = "userPage.jsp?name=" + rs.getString("user");
                String href2 = "comments.jsp?ID=" + rs.getString("ID");
                %>
                
                 <td><a href=<%=href%>><%=userName%></a></td> <!-- Makes an href to the profile of the user who posted it -->
                 <td><%= text %></td>
               </tr>
               <%
            }
%>
</table>
</center>

<b>Create new comment:</b>
<form action="addComment" method="post">
 	<input type="hidden" name="ID" value="<%=threadNo%>"/>
 	<input type="hidden" name="location" value="<%=location%>"/>
 	    
 	<input type="hidden" name="loginName" value="<%=user.getloginName() %>" />
      <table>
       <tr>
          <td align="right">Text: </td>
          <td align="left"><input type="text"
              name="userPost"/></td>
        </tr>
      </table>

      <p><input type="submit" value="Submit"/></p>
</form>

<h3>Pages:</h3>
<a href="welcome.jsp">Welcome Page</a><br>
<a href="userPage.jsp?name=<%=user.getloginName() %> ">My Page</a><br>
</div>
</body>
</html>