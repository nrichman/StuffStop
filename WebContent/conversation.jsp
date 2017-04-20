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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  
  
    div.padded {  
background: #444;  
      color: white; 
      padding-top: 10px;  
      padding-right: 0px;  
      padding-bottom: 0.25in;  
      padding-left: 5em;  
    }
  </style>
</head>
<body>


<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
    
  
<%
User user = (User) session.getAttribute("user");
if (user == null){
%>
<p>You are not registered! Please to go
<a href="registrationform.jsp">Register</a>
</p>

<% 
} else {	
	%><p>Logged in as: <%=user.getloginName() %>
	 <a href="welcome.jsp?value=0">Logout</a> </p>
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
	<img src="bootstrap/logo.png" style="width:100%;height:100px;">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="conversation.jsp">Messages</a></li>
        <li><a href="welcome.jsp">Welcome Page</a></li>
        <li><a href="userPage.jsp">My Page</a></li>
   
      </ul><br>
      </div>
      <div class="col-sm-9">
      <h2>Messages</h2>




<%
while (rs.next()) {
                %>
                
                
                <%
                String rsFrom = rs.getString("fromUser");
                String rsTo = rs.getString("toUser");
                String message = rs.getString("message");
                if((rsFrom.equals(fromUser) && rsTo.equals(toUser)) || (rsFrom.equals(toUser) && rsTo.equals(fromUser))){
                
                if (rs.getString("fromUser").equals(request.getParameter("userA"))) {
                %>
                
                <div align="right">
                <p style="background-color:#d6f5f5">
                 <%=message%>
                   <span style="font-weight:bold; border:1px solid black; padding:2px"><%=rsFrom%></span>
                 <p>
               </div>
               
               <% } else{
               %>
                
                <div align="left">
                 <p style="background-color:#ccd9ff">
                 
                 <span style="font-weight:bold; border:1px solid black; padding:2px"><%=rsFrom%></span>
                 
                 
                 <%=message%><p>
               </div>
               
               <%}
                %>
               
               <%
            }
                
}
%>



<h4>New Message</h4>
<form action="messageUser" method="post">
    <input type="hidden" name="toUser" value="<%=toUser%>"/>
 	<input type="hidden" name="fromUser" value="<%=fromUser%>"/>
	<div class = "form-group"> 
      <textarea class="form-control" type="text" name="message" rows="3" name="userPost" required></textarea>
    </div>
    <p><input type="submit" value="Submit"/></p>
</form>


 </div>
  </div>
</div>
</body>
</html>