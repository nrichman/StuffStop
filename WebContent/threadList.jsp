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
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
	%>
	<h3>
		You are not registered! Please to go <a href="registrationform.jsp">Register</a>
	</h3>

	<%
		} else {
	%><h3>
		Logged in as:
		<%=user.getloginName()%></h3>
	<h3>Logout?</h3>
	<a href="welcome.jsp?value=0">Logout</a>
	<br>
	<%
		}
	%>


	<h1>FORUM</h1>
	<div>

		<h1>Create new thread:</h1>

		<form action="addForum" method="post">

			<input type="hidden" name="loginName" value="<%=user.getloginName()%>" />

			<table>
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

			<p>
				<input type="submit" value="Submit" />
			</p>

		</form>

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

		<table>
			<tr>
				<td>User</td>
				<td>Title</td>
				<td>Description</td>
				<td>Tag</td>
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
	</div>

	<div>
		<h3>Pages:</h3>
		<a href="welcome.jsp">Welcome Page</a><br> 
		<a href="userPage.jsp?name=<%=user.getloginName() %> ">My Page</a><br>
	</div>
</body>
</html>