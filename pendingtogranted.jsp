
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>pending to granted</title>
</head>
<body>
<%
String userid = (String) session.getAttribute("USER");
String pass = (String) session.getAttribute("PASS");

if(userid!=null)
	out.println("<h2>welcome " + userid + "</h2>"); 
else 
	response.sendRedirect("login_admin.jsp");
%>

<%
String id = request.getParameter("hiddenID");


String i, n, e, p; 

Connection conn = null;
try {
		//step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		//step2: Define Connection URL
		String connURL = "jdbc:mysql://127.4.30.130:3306/fyp7?user=adminkkgGJMz&password=RQ2YQNMvUeGS";

		//step3: Establish connection to URL
		conn = DriverManager.getConnection(connURL);

		System.out.println("test0"); 
		Statement stmt = conn.createStatement(); 
		
		
		System.out.println("test00"); 
		String sql = "SELECT imei, name, email FROM pending WHERE id=?"; 
		PreparedStatement pstmt1 = conn.prepareStatement(sql); 
		pstmt1.setInt(1, Integer.parseInt(id)); 
		
		ResultSet rs = pstmt1.executeQuery();
		
		while (rs.next()){
		System.out.println("test0000"); 
			i = rs.getString("imei"); 
			n = rs.getString("name"); 
			e = rs.getString("email"); 
			//p = rs.getString("password"); 
			
			
			System.out.println("test1");
			
		
			String sql2 = "Insert into granted(imei, name, email) values(?,?,?)";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, i);
			pstmt2.setString(2, n);
			pstmt2.setString(3, e);
			//pstmt2.setString(4, p);
			
			
			System.out.println("test2");
			
		
			String sql3 = "Delete from pending WHERE id=?";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3); 
			pstmt3.setInt(1, Integer.parseInt(id)); 
			
			System.out.println("test3");
		
		
		int rec = pstmt2.executeUpdate() + pstmt3.executeUpdate();
		
		if (rec > 1){
			response.sendRedirect("displaypendinglist.jsp");
		}else
			out.println("Insert Unsuccessful");
			conn.close();
		}	} catch (Exception d){
			//out.print(d);
		}

		%>
		
		
</body>
</html>