<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
<style>
body {
  background-color : #00BFFF;
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
h2 {
	text-align: center;
}
span{
	text-align: center;
}


</style>
</head>
<body>

<div>
<h2>Add New Item:</h2>
<form action="/TechExercise/Servlet2" method="post">
<table>

<tr>
<td>Item Number: </td>
<td><input type="text" name ="number"/></td>
</tr>
<tr>
<td>Name: </td>
<td><input type="text" name ="name" /></td>
</tr>
<tr>
<td>Distributor: </td>
<td><input type="text" name ="dist" /></td>
</tr>
<tr>
<td>Description: </td>
<td><input type="text" name ="desc" /></td>
</tr>
<tr>
<td>Quantity: </td>
<td><input type="text" name ="quantity"/></td>
</tr>

</table>

<p><input type="submit" value="Add Item"/></p>

</form>
</div>

<% 
ArrayList<String> myList = (ArrayList<String>)session.getAttribute("list");
ArrayList<String> myList2 = (ArrayList<String>)session.getAttribute("list2");

%>

<div>
<h2>Update Item Quantity</h2>
<span>
<form action="/TechExercise/Servlet3" method="post">
 <select name="itemToUpdate">
<%
if (myList != null ){

for(int i=0; i < myList.size(); i++){
        	%>
        	<option value="<%=myList.get(i)%>"><%=myList2.get(i) %></option>
        	
        	<% 
        }
}
%>

  
</select> 
<input type="text" name ="quantity"/>
<p><input type="submit" value="Update"/></p>

</form>
</span>
</div>

<div>
<h2>Delete Item</h2>
<span>
<form action="/TechExercise/Servlet4" method="post">
 <select name="itemToDelete">

<%
for(int i=0; i < myList.size(); i++){
        	%>
        	<option value="<%=myList.get(i)%>"><%=myList2.get(i) %></option>
        	
        	<% 
        }
%>
</select> 

<p><input type="submit" value="Delete Selected"/></p>

</form></span>
</div>
</body>
</html>