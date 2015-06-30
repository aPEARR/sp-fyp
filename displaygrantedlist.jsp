<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>display granted list</title>
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
	
		<form action="searchgranted.jsp" method="get">
		Search granted email: <input type="text" name="searchString"
		value="<%=request.getParameter("searchString")%>" size="50" /> 
		<input type="submit" value="Search" />
	</form>
	<br><br>
<%

		String search = request.getParameter("searchString");
		Connection conn = null;
	try {
		//step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		//step2: Define Connection URL
		String connURL = "jdbc:mysql://127.4.30.130:3306/fyp7?user=adminkkgGJMz&password=RQ2YQNMvUeGS";
		//step3: Establish connection to URL
		conn = DriverManager.getConnection(connURL);

		//step4:create statement object
		Statement stmt = conn.createStatement();
		
		//sql
		String sqlStr = "select * from granted";
		ResultSet rs = stmt.executeQuery(sqlStr);
	
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<td>id</td>");
		out.println("<td>imei</td>");
		out.println("<td>name</td>");
		out.println("<td>email</td>");
		//out.println("<td>password</td>");
		out.println("</tr>");
		while (rs.next()){

			String id = rs.getString("id");
			String imei = rs.getString("imei");
			String name = rs.getString("name");
			String email = rs.getString("email");
			//String pw = rs.getString("password");
			out.println("<tr>");
			out.println("<td>" + id + "</td>");
			out.println("<td>" + imei + "</td>");
			out.println("<td>" + name + "</td>");
			out.println("<td>" + email + "</td>");
			//out.println("<td>" + pw + "</td>");
			%>
			
			<td>
			<form action="granteddelete.jsp">
				<input type="hidden" value="<%=id%>" name="hiddenID"> 
				<input type="submit" value="Delete">
			</form>
			<form action="updategranted.jsp">
				<input type="hidden" value="<%=id%>" name="hiddenID">
				<input type="submit" value="Update">
			</form>
			</td>
			
			<%
			out.println("</tr>");
		}
		out.println("</table>");
		
		
		conn.close();
		
		

	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>


	</center>

	
</body>
</html>