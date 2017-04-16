<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %>
<%@	page import="com.users.*" %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div>
<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");
String login = "no";
String userUsername = "";
String userFirstname = "";
String userLastname = "";
String userEmail = "";


while (rs.next()) {

				String number = rs.getString("id");
                String username = rs.getString("username");
                String name = rs.getString("firstname");
          		
                
                
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String pass = rs.getString("pass");
                
                String enteredPass = request.getAttribute("enteredPass").toString();
                
             
                
                if (pass.equals(enteredPass)){
                	login = "yes";
                	userUsername = username;
                	userFirstname = name;
                	userLastname = lastname;
                	userEmail = email;
                }
                else
                {
                	login = "no";
                	
                }
            }


if (login.equals("yes")){
	
	%>
	
	SUCCESSFULLY LOGGED IN 
	
    <jsp:useBean id="user" scope="session" class="com.users.User">
    </jsp:useBean>
<%


	
	user.setloginName(userUsername);

	user.setFirstName(userFirstname);
	user.setSurname(userLastname);
	user.setEmail(userEmail);
%>
	
	<%
	 
} else
{
	%>
	LOGIN FALIED RETURN TO MAIN
	<%
}

%>
</div>


<c:redirect url="/welcome.jsp"/>


</body>
</html>