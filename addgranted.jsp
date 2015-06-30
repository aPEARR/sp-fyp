<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add granted</title>
</head>
<body background="Pictures/Backgound.jpg">

<%
String userid = (String) session.getAttribute("USER");
String pass = (String) session.getAttribute("PASS");

if(userid!=null)
	out.println("<h2>welcome " + userid + "</h2>"); 
else 
	response.sendRedirect("login_admin.jsp");
%>
	<center>
    
	
	<br>

		<form>
		<input type="button" value="add user to granted list" onClick="window.location.href='addgranted.jsp'">
		<input type="button" value="display granted list" onClick="window.location.href='displaygrantedlist.jsp'">
		<input type="button" value="display pending list" onClick="window.location.href='displaypendinglist.jsp'">
		<input type="button" value="Logout Admin" onClick="window.location.href='logout'">
	
</form>

	<br><br>

	
	<form action="processaddgranted.jsp" method="post">	
	<br>
	<br>
	<b>Add users to granted list</b><br><br>
	
	imei: <br/>
	<input type="text" name="imei" size="50"><br><br>
	email: <br/>
	<input type="text" name="email" size="50"><br><br>
	name: <br/>
	<input type="text" name="name" size="50"><br><br>
		<input type="submit" name="btnCreate" value="Add granted"><br><br>
</center>
	</form>
</body>
</html>