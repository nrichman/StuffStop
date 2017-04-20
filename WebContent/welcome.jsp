<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.users.*"
    %>
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
	  </style>
	</head>
	<body>
		<%
		User user = (User) session.getAttribute("user");
		if (user != null){ %>
		<div style="background-color:#e6eeff">
			<p>Logged in as: <span style="font-weight:bold"><%=user.getloginName() %></span>
			  <a href="welcome.jsp?value=0">Logout</a>
			 <!--  <a href="welcome.jsp?value=0" class="btn btn-info" role="button">Logout</a> </p> -->
		<%
		}
		%>
		</div>
		<div class="container-fluid">
			<div class="row content">
			    <div class="col-sm-3 sidenav">
			      	<img src="bootstrap/logo.png" style="width:100%;height:100px;">
			      	<ul class="nav nav-pills nav-stacked">
			        <li class="active"><a href="welcome.jsp">Welcome Page</a></li>
			        <%if (user != null){ %>
			        	<li><a href="userPage.jsp?name=<%=user.getloginName() %>">My Page</a></li>
			        	<li><a href="threadList.jsp">Forums</a></li>
			        <%}%>
			      	</ul><br>
			    </div>
				<div class="col-sm-9">
					<%
					String value;
						
					if (request.getParameter("value")!= null){
						value = request.getParameter("value").toString();
					}
					else{
						value = "Not found";
					}
					if (value.equals("0")){
						user = null;
						request.getSession().invalidate();
					}
					if (user == null){
					%>
					<h2>You are not logged in!</h2>
					<a href="registrationform.jsp" class="btn btn-info" role="button">Register</a>
					<a href="Login.jsp" class="btn btn-info" role="button">Login</a>
					<%
					} else {
					%>
					<h1 style="text-align:center"> Welcome Page!</h1>
						<!--   <h3>Logged in as: <%=user.getloginName() %> </h3> -->
					<br>
					<div>
						<h2>Welcome to StuffStop!</h2>
						<p>The best place for hobbyists of all kinds. At StuffStop you can post your collectables for sale and look for something new! Meet friends with similar hobbies and join a community that pertains to your interests. It's the place to stop. For stuff!</p>
					<br>
					<h4>History</h4>
					<p>Stuff Stop was established by four young university students in early 2017 and is has been making Internet users stop for stuff ever since.  </p>
					</div>
					<br>
					<h4>What's New</h4>
					<p>StuffStop is proud to announce users can now directly message other users, post threads, AND delete their own threads. How bout them apples!</p>
					<%}%>
				</div>
			</div>
		</div>
		<footer class="container-fluid">
		  <p>Copyright 2017 :)</p>
		</footer>
	</body>
</html>