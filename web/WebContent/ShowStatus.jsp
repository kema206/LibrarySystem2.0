<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.time.LocalDate"%> 
<%@ page import="java.text.SimpleDateFormat"%> 
<%@ page import="java.util.concurrent.TimeUnit"%> 
<%@ page import="javax.servlet.*"%> 
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">

<div class="text-c">
<style>
    .text-c {
		text-align: center;
	}
	
	.form_pos { 
		position:absolute;
		left:0;
		right:0;
		bottom:0;
	}
</style>
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

String username = request.getParameter("un");
if(username==null){
    username="";
}
String bookName = request.getParameter("bn");
if(bookName==null){
    bookName="";
}
// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

Connection con = DriverManager.getConnection(url, uid, pw);


String sql = "SELECT uid, uname, book1, book2, date1, date2 FROM users";
String sql2 = "UPDATE books SET qty=qty-1 WHERE bookName=?";
Statement stmt = con.createStatement();
ResultSet rst = stmt.executeQuery(sql);
       
        %>
            <h1>Your Current Status</h1>
		    <table border="1" style="border-collapse:collapse;margin-left:auto;margin-right:auto;font-family: Futura;">
				<tr>
					<th>UserId</th>
					<th>Username</th>
					<th>Book1</th>
					<th>Book2</th>
					<th>Date1</th>
					<th>Date2</th>
				</tr>
                <%
while(rst.next()){
    if(rst.getString("uname").equals(username)){
    %>
				<tr>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("uid")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("uname")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("book1")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("book2")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getDate("date1")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getDate("date2")%></td>
				</tr>
	<%
    PreparedStatement pstmt = con.prepareStatement(sql2);
    pstmt.setString(1,bookName);
    pstmt.executeUpdate();
        }
    }



con.close();

%>
</div>
<div class="form_pos text-c">
<h2> <a href="login.jsp">Back to Login Page</a></span></h2>
</div>
</body>
</html>