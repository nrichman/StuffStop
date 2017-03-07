<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %>
<%@	page import="com.users.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
  background-color : #AFEEEE;
} 
table {
    border: 1px solid black;
    margin-left: auto;
	margin-right: auto;
	padding: 10px;
}
td, th{
	 border: 1px solid black;
	padding: 10px;
	text-align: center;
}
div {
	border: 1px solid black;
	align: center;
	margin-left: auto;
	margin-right: auto;
}
p {
	text-align: center;
	font-size: 150%;
}
h1{

	text-align: center;
	font-size: 200%;

}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered</title>

</head>
<body>

<%-- 
    <jsp:useBean id="user" scope="session" class="com.users.User">
    </jsp:useBean>
    
<%
	user.setloginName(request.getAttribute("id").toString());
	user.setPass(request.getAttribute("pass").toString());
	user.setFirstName(request.getAttribute("firstname").toString());
	user.setSurname(request.getAttribute("lastname").toString());
	user.setEmail(request.getAttribute("email").toString());
%>
    --%>
    
    <%--  
    <p>Your first name is <%= user.getFirstName() %>.</p>
    <p>Your last name is
       <jsp:getProperty name="user" property="surname" />.</p>
    <p>Your user id is
       <jsp:getProperty name="user" property="loginName" />.</p>
    <p>Your email is
       <jsp:getProperty name="user" property="email" />.</p>
          
    <p>Your pass is
       <jsp:getProperty name="user" property="pass" />.</p>
	--%>
	
<div>
<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");
String login = "no";
String userUsername = "";
String userFirstname = "";
String userLastname = "";
String userEmail = "";

%>


<%


/*
if (session.getAttribute("list") == null)
{
	myList = new ArrayList<String>();
	myList2 = new ArrayList<String>();


}
else{
	myList = (ArrayList)session.getAttribute("list");
	myList2 = (ArrayList)session.getAttribute("list2");

	myList.clear();
	myList2.clear();
}
*/
// ArrayList<String> myList = new ArrayList<String>();
// myList.clear();

while (rs.next()) {
                %>
                
                <%
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
                
                
                
                %>
                
                
                
     
               <%
               %>
               
               <%
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



<div>
<p>
<a href="welcome.jsp">Go to Welcome Page</a>
<p>
</div>

</body>
</html>