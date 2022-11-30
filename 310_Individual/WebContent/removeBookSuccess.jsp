<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<h1 style="text-align:center;font-family: Futura;">Book Successfully Removed from the Database</h1>
<%
String isbn = request.getParameter("isbn");
if(isbn == null)
	isbn = "0";

//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

Connection con = DriverManager.getConnection(url, uid, pw);

String sql2 = "DELETE FROM books WHERE isbn = ?";
PreparedStatement pstmt = con.prepareStatement(sql2);
pstmt.setInt(1,Integer.parseInt(isbn));
pstmt.executeUpdate();

con.close();
%>
<style>
    .text-c {
		text-align: center;
	}
</style>
<div class="text-c">
<a href="login.jsp">Back to Login Page</a>
</div>
</body>
</html>

