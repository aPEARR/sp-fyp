<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update granted process</title>
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
		String imei = request.getParameter("imei");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		//String password = request.getParameter("password");
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://127.4.30.130:3306/fyp7?user=adminkkgGJMz&password=RQ2YQNMvUeGS";
			conn = DriverManager.getConnection(connURL);
			String sqlStr = "UPDATE granted SET imei=?, name=?, email=?"
					+" WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, imei);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			//pstmt.setString(4, password);
			pstmt.setInt(5, Integer.parseInt(id));
			int rec = pstmt.executeUpdate();
			if (rec > 0){
				out.println(rec + "Updated in database!");
			}else
				out.println("Update Unsuccessful");
			conn.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>