<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body>
    <h1>Register User</h1>

    <jsp:useBean id="user" scope="session" class="com.users.User">
      <jsp:setProperty name="user" property="*" />
    </jsp:useBean>

    Welcome new user:
    <p>Your first name is <%= user.getFirstName() %>.</p>
    <p>Your last name is
       <jsp:getProperty name="user" property="surname" />.</p>
    <p>Your user id is
       <jsp:getProperty name="user" property="loginName" />.</p>
    <p>Your email is
       <jsp:getProperty name="user" property="email" />.</p>
          
    <p>Your pass is
       <jsp:getProperty name="user" property="pass" />.</p>

   
  </body>
</html>