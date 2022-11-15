<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Library</title>
</head>
<body style="background-color:#FFFDD0;">


<h2>Enter your uname to see current books borrowed:</h2>
<%
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
%>

<h2>Enter your uname:</h2>
<form method="get" action="returnBook2.jsp">
    uname:<br> <input type="text" name="uname">
    <input type="submit">
</form>

<%
con.close();
%>
</body>
</html>
