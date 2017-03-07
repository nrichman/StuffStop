<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<title>Registration Form</title>

</head>
<body>
<h1>Please enter your information</h1>

<form action="registerUser" method="post">
 
      <table>
       <tr>
          <td align="right">User Name:</td>
          <td align="left"><input type="text"
              name="loginName"/></td>
        </tr>
                <tr>
          <td align="right">Email:</td>
          <td align="left"><input type="text"
              name="email"/></td>
        </tr>
        <tr>
          <td align="right">First name:</td>
          <td align="left"><input type="text"
              name="firstname" /></td>
        </tr>
        <tr>
          <td align="right">Last name:</td>
          <td align="left"><input type="text"
              name="lastname"/></td>
        </tr>
                <tr>
          <td align="right">Password:</td>
          <td align="left"><input type="password"
              name="pass" /></td>
        </tr>
       
      </table>

      <p><input type="submit" value="Submit"/></p>
 
</form>
</body>
</html>