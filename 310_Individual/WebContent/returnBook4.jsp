<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<%



String bname = request.getParameter("bname"); //get bname 
if(bname == null)
    bname ="";
String bid = request.getParameter("bid"); //get bname 
if(bid == null)
    bid ="";
String uname = request.getParameter("uname"); //get bname 
if(uname == null)
    uname ="";    


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

String sql2 ="UPDATE books SET qty = qty + 1 WHERE bookName = ?";

PreparedStatement pstmt = con.prepareStatement(sql2);
pstmt.setString(1, bname);

pstmt.executeUpdate();
con.close();
%>
<form method="get" action="returnBook5.jsp">
<input type="hidden" name="bname" value=<%=bname%>> 
<input type="hidden" name="bid" value=<%=bid%>> 
<input type="hidden" name="uname" value=<%=uname%>> 
</form>

</body>
</html>
<jsp:forward page="returnBook5.jsp" />