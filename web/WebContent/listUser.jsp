<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>List of Books</title>
</head>
<body style="background-color:#FFFDD0">


<h1 style="text-align:center;font-family: Futura;">Book List</h1>
<br>
<%



String name = request.getParameter("customerName");
if(name == null) {
	name = "";
}

//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);  // Prints $5.00

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

Connection con = DriverManager.getConnection(url, uid, pw);


// Write query to retrieve all order summary records
String sql = "SELECT * FROM users";

Statement stmt = con.createStatement();

// For each order in the ResultSet
ResultSet rst = stmt.executeQuery(sql);
%>
		<table border="1" style="border-collapse:collapse;margin-left:auto;margin-right:auto;font-family: Futura;">
			<th>
				<tr>
					<th>USERID</th>
					<th>USERNAME</th>
					<th>LVL</th>
					<th>Book1</th>
					<th>Book2</th>
					<th>Date1</th>
					<th>Date2</th>
				</tr>
			</th>
			<%
// Print out the order summary information
while(rst.next()){
		%>
				<tr>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("uid")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("uname")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("lvl")%></td>
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
// Close connection
con.close();
%>
</body>
</html>

