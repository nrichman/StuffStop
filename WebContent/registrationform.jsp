<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div class="container-fluid">
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
</div>
</body>
</html>