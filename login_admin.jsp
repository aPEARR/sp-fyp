<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script language="javascript" type="text/javascript" >


</script>
	<body background="Pictures/Backgound.jpg">



    	<center>
    		<a href="login_admin.jsp"><img src="Pictures/LoginAdminBtn.jpg" border="none"></a>
    		 
      
      <div id="msg"></div>
      <form action="adminlogin" method="post">
<b>Admin Login</b><br><br> 
Login ID: <input type="text" name="Username" id="Username"><br><br>
Password: <input type="Password" name="Password" id="Password"><br><br>
<input type="submit" name="btnSubmit" value="Login" onclick="return checkForm()" id="btnSave" >
</form>


      </center>


</body>
</html>



