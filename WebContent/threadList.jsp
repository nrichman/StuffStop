<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.users.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		  <meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
			        <li><a href="userPage.jsp?name=<%=user.getloginName() %>">My Page</a></li>
			        <li class="active"><a href="threadList.jsp">Forums</a></li>
			      	</ul><br>
			    </div>
				<div class="col-sm-9">
					<!--   <h3>Logged in as:<%=user.getloginName()%></h3> -->
			

	<h2>Forum</h2>
	<div>

		
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
			String selectSQL = "SELECT * FROM THREAD";
			PreparedStatement preparedStatement2 = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement2.executeQuery();
		%>

		<table style="text-align:center; border: 1px solid black; width:96%">
			<tr>
				<th>User</th>
				<th>Title</th>
				<th>Description</th>
				<th>Tag</th>
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

						String href = "userPage.jsp?name=" + rs.getString("user");
						String href2 = "comments.jsp?ID=" + rs.getString("ID");
				%>

				<td><a href=<%=href%>><%=userName%></a></td>
				<!-- Makes an href to the profile of the user who posted it -->
				<td><a href=<%=href2%>><%=title%></a></td>
				<td><%=description%></td>
				<td><%=tag%></td>
			</tr>
			<%
				}
			%>
		</table>
		
		
		<h3>Create new thread</h3>

		<form action="addForum" method="post">

			<input type="hidden" name="loginName" value="<%=user.getloginName()%>" />

			<table style="text-align:center; border: 1px solid black; width:50">
				<tr>
					<td>Title:</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><input type="text" name="description" /></td>
				</tr>
				<tr>
					<td>tag:</td>
					<td><select name="tag">
							<option value="Buy">Buy</option>
							<option value="Sell">Sell</option>
							<option value="Trade">Trade</option>
					</select></td>
				</tr>
			</table>
<br>
				<p><input type="submit" class="btn btn-info" role="button" value="Submit"/></p>
			

		</form>
		
	</div>
	
	
	</div>
	</div>
	</div>
		<footer class="container-fluid">
		  <p>Copyright 2017 :)</p>
		</footer>
</body>
</html>
