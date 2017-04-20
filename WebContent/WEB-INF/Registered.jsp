<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %> 

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
	    body{
	    background-color:#f1f1f1;
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

    <jsp:useBean id="user" scope="session" class="com.users.User">
    </jsp:useBean>
<%
	user.setloginName(request.getAttribute("id").toString());
	user.setPass(request.getAttribute("pass").toString());
	user.setFirstName(request.getAttribute("firstname").toString());
	user.setSurname(request.getAttribute("lastname").toString());
	user.setEmail(request.getAttribute("email").toString());
%>
    
<h2 style="text-align:center"> Thank you for registering <b> <%=user.getloginName() %> </b>!</h2>

<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");
%>


</body>
</html>