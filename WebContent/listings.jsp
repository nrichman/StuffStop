<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %> 
<%@ page import="com.users.*" %>

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



<h1>FORUM</h1>
<div>

<h1>Create new thread:</h1>

<form action="addForum" method="post">
 	
 	<input type="hidden" name="loginName" value="<%=user.getloginName() %>" />
 
      <table>
       <tr>
          <td align="right">Title: </td>
          <td align="left"><input type="text"
              name="title"/></td>
        </tr>
                <tr>
          <td align="right">Description:</td>
          <td align="left"><input type="text"
              name="description"/></td>
        </tr>
        <tr>
          <td align="right">tag:</td>
          <td align="left"><input type="text"
              name="tag" /></td>
        </tr>
       
      </table>

      <p><input type="submit" value="Submit"/></p>
 
</form>
<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");

%>
<table>
<tr>
<td>User</td><td>Title</td><td>Description</td><td>Tag</td>
</tr>
<%
while (rs.next()) {
                %>
                <tr>
                <%
                String userName = rs.getString("user");
                String title = rs.getString("title");
                String description = rs.getString("description");      
                String tag = rs.getString("tag");
                
    
                
                %>
                
                
                 <td> <%= userName %> </td>
                 <td><%= title %> </td>
                 <td><%= description %></td>
                 <td><%= tag %></td>
                 
     
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
<a href="welcome.jsp">Welcome Page</a><br>
<a href="userPage.jsp">My Page</a><br>
</div>
</body>
</html>