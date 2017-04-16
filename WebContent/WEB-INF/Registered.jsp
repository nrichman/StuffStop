<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
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
	
<h1> Thank you for registering <b> <%=user.getloginName() %> </b>!</h1>

<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");
%>
<%-- 
<table>
<tr><th>ID</th><th>USERNAME</th><th>FIRSTNAME</th><th>LASTNAME</th><th>EMAIL</th></tr>

<%
ArrayList<String> myList;
ArrayList<String> myList2;

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
                <tr>
                <%
				String number = rs.getString("id");
                String username = rs.getString("username");
                String name = rs.getString("firstname");
          
                
                
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                
                %>
                
                
                 <td> <%= number %> </td>
                 <td><%= username %> </td>
                 <td><%= name %></td>
                 <td><%= lastname %></td>
                   <td><%= email %></td>
                 
     
               <%
               %>
               </tr>
               <%
            }


%>
</div>
</table>
--%>

<div>
<p>
<a href="welcome.jsp">Go to Welcome Page</a>
<p>
</div>

</body>
</html>