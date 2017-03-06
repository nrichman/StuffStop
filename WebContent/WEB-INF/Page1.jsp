<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.ResultSet" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
  background-color : #cccccc;
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
<title>Main Page</title>

</head>
<body>
<h1> ${message}</h1>
<div>
<%

ResultSet rs = (ResultSet)request.getAttribute("resultSet");
%>

<table>
<tr><th>ITEM NUMBER</th><th>NAME</th><th>DISTRIBUTOR</th><th>DESCRIPTION</th><th>QUANTITY</th></tr>

<%
ArrayList<String> myList;
ArrayList<String> myList2;

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
// ArrayList<String> myList = new ArrayList<String>();
// myList.clear();

while (rs.next()) {
                %>
                <tr>
                <%
				String number = rs.getString("NUMBER");
               
                String name = rs.getString("NAME");
                String forList = (number);
                String forList2 = (number+ " : "+name);

                
                myList.add(forList);
                myList2.add(forList2);

                
                
                String distributor = rs.getString("DISTRIBUTOR");
                String description = rs.getString("DESCRIPTION");
                int quantity = rs.getInt("QUANTITY");
                %>
                
                
                 <td> <%= number %> </td>
                 <td><%= name %> </td>
                 <td><%= distributor %></td>
                 <td><%= description %></td>
                 
                 <% if (quantity < 7) {
                
                 %>
                	 <td style="background-color:yellow;"> <%= quantity %></td>
                 <%}
                 else {
                	%>
                	<td><%=quantity %></td>	
                	<% 
                 }
                 
                 
                 %>
               <%
               %>
               </tr>
               <%
            }
session.setAttribute("list", myList);
session.setAttribute("list2", myList2);

%>
</div>
</table>
<div>
<p>
<a href="Update.jsp">Update</a>
</p>
<p>
<a href="welcome.jsp">Welcome</a>
</p>
</div>

</body>
</html>