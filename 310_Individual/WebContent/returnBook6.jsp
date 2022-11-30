<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<h1 style="text-align:center;font-family: Futura;">Your book status: </h1>
<br>
<br>
<br>
<%

String uname = request.getParameter("uname");//get the uname from user (by form)
if(uname ==null)
    uname="";


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

String sql = "SELECT uname, book1, book2, date1, date2 FROM users WHERE uname=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,uname);
ResultSet rst = pstmt.executeQuery();

%>
		<table border="1" style="border-collapse:collapse;margin-left:auto;margin-right:auto;font-family: Futura;">
				<tr>
					<th>Username</th>
					<th>Book1</th>
					<th>Book2</th>
					<th>Date1</th>
					<th>Date2</th>
				</tr>
			<%
// Print out the order summary information
while(rst.next()){
        %>
				<tr>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("uname")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("book1")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("book2")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getDate("date1")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getDate("date2")%></td>
				</tr>
				<%
}
%>
	</table>
<%
con.close();
%>
<style>
    .text-c {
		text-align: center;
	}
</style>
</body>
<form method="get" action="returnBook5.jsp">
<input type="hidden" name="uname" value=<%=uname%>> 
</form>
<br>
<br>
<br>
<div class="text-c">
<a href="login.jsp">Back to Login Page</a>
</div>
</html>

