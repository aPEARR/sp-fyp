
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>updatepending</title>
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
 <%
	String id = request.getParameter("hiddenID");
	Connection conn = null;
	try{
	Class.forName("com.mysql.jdbc.Driver");
	String connURL = "jdbc:mysql://127.4.30.130:3306/fyp7?user=adminkkgGJMz&password=RQ2YQNMvUeGS";
	conn= DriverManager.getConnection(connURL);

	String sqlStr = "select * from pending WHERE id = ?";

	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, Integer.parseInt(id));

	ResultSet rs = pstmt.executeQuery();

	if(rs.next()){
	String imei=rs.getString("imei");
	String name=rs.getString("name");
	String email=rs.getString("email");
	//String password=rs.getString("password");


%>
	<div id="updating">
	<form action="updatePendingProcess.jsp" method="get">
	<table>
	<tr>
	<td colspan="2">Update Record</td>
	</tr>
	<tr>
	<td>imei:</td>
	<td><input type="text" name="imei" value="<%=imei%>" size="50" /></td>
	</tr>
	<tr>
	<td>name:</td>
	<td><input type="text" name="name" value="<%=email%>" size="50" /></td>
	</tr>
	<tr>
	<td>email:</td>
	<td><input type="text" name="email" value="<%=email%>" size="50" /></td>
	</tr>
	<td><input type="hidden" name="hiddenID" value="<%=id %>" /></td>
	<td><input type="submit" value="Update Now!" /> <input type="reset" value="Reset" /></td>
	</tr>
	</table>
	</form>
	<div id="updateback">
	<form action="updatependingProcess.jsp" method="post">
	<input type="submit" value="Back" />
	</form>
	</div>
<%
}
	conn.close();
}catch(Exception e){
	out.println(e);
}
%>


</body>
</html>