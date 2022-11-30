<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<h1 style="text-align:center;font-family: Futura;">Your Account has been Successfully Created</h1>
<%

String username = request.getParameter("uname");
if(username == null)
	username = "";
String password = request.getParameter("pass");
if(password == null)
	password = "";
String level = request.getParameter("lvl");
if(level == null)
	level = "2";

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

String sql = "INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) " +
            "VALUES (?,?,?,?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, username);
pstmt.setString(2, password);
pstmt.setInt(3, Integer.parseInt(level));
pstmt.setString(4, null);
pstmt.setString(5, null);
pstmt.setString(6, null);
pstmt.setString(7, null);
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
<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Our <a href="https://twitter.com/hashtag/ReadingTipOfTheWeek?src=hash&amp;ref_src=twsrc%5Etfw">#ReadingTipOfTheWeek</a> this week reminds us of the importance of choice. There are so many great things to read from books to magazines, graphic novels to blogs and much more besides. What are you reading at the moment? <a href="https://twitter.com/hashtag/WorldClassBookCulture?src=hash&amp;ref_src=twsrc%5Etfw">#WorldClassBookCulture</a> <a href="https://twitter.com/hashtag/WeAreStar?src=hash&amp;ref_src=twsrc%5Etfw">#WeAreStar</a> <a href="https://t.co/pmxyPd8rva">pic.twitter.com/pmxyPd8rva</a></p>&mdash; Eden Boys&#39; School, Bolton (@edenboysbolton) <a href="https://twitter.com/edenboysbolton/status/1595500383853547537?ref_src=twsrc%5Etfw">November 23, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</html>
