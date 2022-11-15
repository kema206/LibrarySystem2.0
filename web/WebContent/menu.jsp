<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Menu Page</title>
</head>
<body style="background-color:#FFFDD0;">

<style>
    .text-c {
		text-align: center;
	}
</style>
<%
String username = request.getParameter("un");
if(username == null) {
	username = "";
}

String pass = request.getParameter("pass");
if(pass == null) {
	pass = "";
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

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

Connection con = DriverManager.getConnection(url, uid, pw);


String sql = "SELECT * FROM users WHERE uname=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, username);
ResultSet rst = pstmt.executeQuery();


if(!rst.next()){
	%>
		<div class="text-c">
		<h2>The username you entered is invalid</h2>
		<h3>Go back to login page</h3>
		<a href="login.jsp">Back</a>
		<h3>Go to create aaccount page</h3>
		<a href="createAccout.jsp">Create Account</a>
	<%
} else{
		if(rst.getString("password").equals(pass)){
			if(rst.getInt("lvl")==1){
				%>
				<div class="text-c">
				<h2>WELCOME <%=rst.getString("uname")%></h2>
				<br>
				<h2>What do you want to do today?</h2>
				<br>
				<br>
				<h3>Borrow a Book</h3>
				<form method="get" action="listBook.jsp">
				<input type="submit" value="Borrow Book">
				</form>
				<br>
				<br>
				<h3>Return a Book</h3>
				<form method="get" action="returnBook.jsp">
				<input type="submit" value="Return Book">
				</form>
				<br>
				<br>
				<h3>Logout</h3>
				<form method="get" action="login.jsp">
				<input type="submit" value="Logout">
				</form>
				<br>
				<br>
				</div>
			<%
			}else{
				%>
				<div class="text-c">
				<h2>WELCOME <%=rst.getString("uname")%></h2>
				<br>
				<h2>What do you want to do today?</h2>
				<br>
				<br>
				<h3>Add Book</h3>
				<form method="get" action="addBook.jsp">
				<input type="submit" value="Add Book">
				</form>
				<br>
				<br>
				<h3>Remove Book</h3>
				<form method="get" action="removeBook.jsp">
				<input type="submit" value="Remove Book">
				</form>
				<br>
				<br>
				<h3>Borrow a Book</h3>
				<form method="get" action="listBook.jsp">
				<input type="submit" value="Borrow Book">
				</form>
				<br>
				<br>
				<h3>Return a Book</h3>
				<form method="get" action="returnBook.jsp">
				<input type="submit" value="Return Book">
				</form>
				<br>
				<br>
				<h3>Logout</h3>
				<form method="get" action="login.jsp">
				<input type="submit" value="Logout">
				</form>
				<br>
				<br>
				</div>
			<%
			}
		}else{
			%>
			<div class="text-c">
			<h2>The password you entered is invalid</h2>
			<h3>Go back to login page</h3>
			<a href="login.jsp">Back</a>
		<%
		}
}
con.close();
%>
<style>
    .text-c {
		text-align: center;
	}
</style>

</body>
</html>

