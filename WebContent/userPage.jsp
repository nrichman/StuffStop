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
	    td {
	    	background-color:#f1f1f1;
	    	padding: 5px;
	    	text-align: center;
	    	border-bottom: 1px solid #000;
	    
	    }
	    th{
	    	font-weight:bold;
	    	background-color:#f1f1f1;
	    	padding: 5px;
	    	text-align: center;
	    	border-bottom: 1px solid #000;
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
		<%
		User user = (User) session.getAttribute("user");
		if (user == null){ %>
		<c:redirect url="/welcome.jsp"/>
		<% 
		} else {	
			%>
			<div style="background-color:#e6eeff"><p>Logged in as: <%=user.getloginName() %>
			 <a href="welcome.jsp?value=0">Logout</a> </p>
			 </div>
		<%
		}
		%>
		<div class="container-fluid">
			<div class="row content">
			    <div class="col-sm-3 sidenav">
			      	<img src="bootstrap/logo.png" style="width:100%;height:100px;">
			      	<ul class="nav nav-pills nav-stacked">
			        <li><a href="welcome.jsp">Welcome Page</a></li>
			        <li class="active"><a href="userPage.jsp?name=<%=user.getloginName() %>">My Page</a></li>
			        <li><a href="threadList.jsp">Forums</a></li>
			      	</ul><br>
			    </div>
				<div class="col-sm-9">

<h1> Welcome to <b><%= request.getParameter("name") %></b>'s User page!</h1> 
  <!--   <h3> Logged in as: <%=user.getloginName() %> </h3> -->

<div>
</div>

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
String selectSQL = "SELECT * FROM THREAD WHERE user = '" +  request.getParameter("name") + "'";
PreparedStatement preparedStatement2 = connection.prepareStatement(selectSQL);
ResultSet rs = preparedStatement2.executeQuery();
%>

<center>
<%if (!request.getParameter("name").equals(user.getloginName())){ %>
<b>Message this user:</b>
<a href="conversation.jsp?userA=<%=user.getloginName() %>&userB=<%=request.getParameter("name")%>">
   <button>Message This User</button>
</a>

<%} %>
</center>



<center>
<h3 style="text-align:center">Posts from this user:</h3>
<table style="text-align:center; border: 1px solid black; width:60%">
<tr>
<th>Title</th><th>Description</th><th>Tag</th>
</tr>
<%
while (rs.next()) {
                %>
                <tr>
                <%
                String title = rs.getString("title");
                String description = rs.getString("description");      
                String tag = rs.getString("tag");
                
                String href2 = "comments.jsp?ID=" + rs.getString("ID");
                %>
                
                 <td><a href=<%=href2%>><%=title%></a></td>
                 <td><%= description %></td>
                 <td><%= tag %></td>
               </tr>
               <%
            }
%>
</table>
</center>
</div>
</div>
</div>
		<footer class="container-fluid">
		  <p>Copyright 2017 :)</p>
		</footer>
</body>
</html>