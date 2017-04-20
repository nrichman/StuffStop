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
<html lang="en">
<head>
  <title>Comments Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
 

      <h4>StuffStop</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="Testing.jsp">Comments</a></li>
        <li><a href="welcome.jsp">Welcome Page</a></li>
        <li><a href="userPage.jsp">My Page</a></li>
   
      </ul><br>
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search Blog..">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
    </div>

    <div class="col-sm-9">

    <h2>Comments</h2><br>
    <div class="row">
    
    <%
while (rs.next()) {
	%>
	   <%
                String userName = rs.getString("user");
                String text = rs.getString("text");
                
                String href = "userPage.jsp?name=" + rs.getString("user");
                String href2 = "comments.jsp?ID=" + rs.getString("ID");
                %>
    
 <div class="col-sm-10" style="border: 1px solid grey">
 <span>
          <h4><a href=<%=href%>><%=userName%></a></h4>
          <p><%= text %></p>
          <br>
          </span>
        </div>
 
      <%
}
%>
		</div>
      
      <h4>Leave a Comment:</h4>
      
      <form action="addComment" method="post" role="form">
      <div class = "form-group">
      <textarea class="form-control" rows="3" name="userPost" required></textarea>
      </div>
 	<input type="hidden" name="ID" value="<%=threadNo%>"/>
 	<input type="hidden" name="location" value="<%=location%>"/>
 	    
 	<input type="hidden" name="loginName" value="<%=user.getloginName() %>" />

    <button type="submit" class="btn btn-success" value="Submit" >Submit</button>
	</form>

      
    </div>
  </div>
</div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>