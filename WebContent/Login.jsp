	<head>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		  <meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	  	<style>
	    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
	    .row.content {height: 1500px}
	    body {
	    background-color: #f1f1f1;
	    }
	    span{
	    background-color: white;
	    border: 2px, solid black;
	    text-align:center;
	    }
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
	
<h1 style="text-align:center">Please enter your login information:</h1>
<div style="border:1px solid black; padding:5px; background-color: white;">
<form action="loginServlet" method="post">
 
 <div align="center" style="vertical-align:bottom">
<div align="center" style="vertical-align:bottom">
      <table>
       <tr>
          <td align="right">User Name:</td>
          <td align="left"><input type="text"
              name="loginName"/></td>
        </tr>
 
                <tr>
          <td align="right">Password:</td>
          <td align="left"><input type="password"
              name="pass"/></td>
        </tr>
       
      </table>
      <br>

       <p><input type="submit" class="btn btn-info" role="button" value="Submit"/></p>
      </div>
</div>
 
</form>
</div>

</div>
</body>
</html>