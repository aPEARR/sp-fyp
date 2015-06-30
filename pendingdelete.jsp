<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>pending delete</title>
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
	</center>
<% 
String id = request.getParameter("hiddenID");
//Connection conn = null;
try {
	//step1: Load JDBC Driver
	Class.forName("com.mysql.jdbc.Driver"); 

	//step2: Define Connection URL
	String connURL = "jdbc:mysql://127.4.30.130:3306/fyp7?user=adminkkgGJMz&password=RQ2YQNMvUeGS";

	//step3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);

	String sqlStr = "Delete from pending WHERE id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sqlStr); 
	pstmt.setInt(1, Integer.parseInt(id)); 
	
	//ResultSet rs = pstmt.executeQuery();
	
	int rec=pstmt.executeUpdate(); 
	if (rec > 0){
		out.println(rec + "records deleted from database!");
	}else
		out.println("Delete Unsuccessful");
	conn.close();
	} catch (Exception e){
		out.print(e);
	}
	%>


</body>
</html>