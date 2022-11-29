<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<head>
<title>List Book</title>
</head> 
<body style="background-color:#FFFDD0">
<div class="text-c">
<h1 style="text-align:center;font-family: Futura;">Book List</h1>
<h3>Genre Filter</h3>
<form method="get" action="listBook.jsp">
<select name="genre" id="genre">
	<option value="all">all</option>
	<option value="fiction">fiction</option>
	<option value="romance">romance</option>
	<option value="bildungsroman">bildungsroman</option>
	<option value="epic">epic</option>
	<option value="tragedy">tragedy</option>
	<option value="philosophy">philosophy</option>
</select>
<input type="submit" value="Filter">
</form>
</div>

<style>
    .text-c {
		text-align: center;
	}
	
	.form_pos { 
		position:relative;
		left:0;
		right:0;
		bottom:0;
		margin-left:auto;
		margin-right:auto;
	}
</style>

<br>
<%

String genre = request.getParameter("genre");
if(genre == null) {
	genre = "all";
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

if(!genre.equals("all")){
	String sql = "SELECT * FROM books WHERE genre=? AND qty>0";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, genre);
	ResultSet rst = pstmt.executeQuery();

%>
<h2 style="text-align:center;font-family: Futura;"><%=genre%> books</h2>
		<table border="1" style="margin-left:auto;margin-right:auto;font-family: Futura;">
				<tr>
					<th>ISBN</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Year Published</th>
					<th>Genre</th>
					<th>Quantity</th>
					<th>Total Amount</th>
				</tr>
			<%



		while(rst.next()) {
			String bookUrl = "Book.jsp?isbn=" + rst.getString("isbn");
			%>
				<tr>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("isbn")%></td>
					<td style="text-align:center;font-family: Futura;"><a href=<%=bookUrl%>><%=rst.getString("bookName")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("author")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("yearPub")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("genre")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("qty")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("originalAmt")%></td>
				</tr>
			<%
	}
} else{
	String sql = "SELECT * FROM books WHERE qty>0";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rst = pstmt.executeQuery();

%>
		<table border="1" style="margin-left:auto;margin-right:auto;font-family: Futura;">
				<tr>
					<th>ISBN</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Year Published</th>
					<th>Genre</th>
					<th>Quantity</th>
					<th>Total Amount</th>
				</tr>
			<%

// For each product create a link of the form
// addcart.jsp?id=productId&name=productName&price=productPrice
while(rst.next()) {
	String bookUrl = "Book.jsp?isbn=" + rst.getString("isbn");
	%>
				<tr>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("isbn")%></td>
					<td style="text-align:center;font-family: Futura;"><a href=<%=bookUrl%>><%=rst.getString("bookName")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("author")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("yearPub")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("genre")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("qty")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("originalAmt")%></td>
				</tr>
				<%
	}
}
// Close connection

%>
<div class="form_pos text-c">
<form method="get" action="borrowBook.jsp">
Pick a book you want to borrow<select name="bookName" id="bookName">
<%
String sql = "SELECT bookName FROM books";
Statement stmt = con.createStatement();
ResultSet rst = stmt.executeQuery(sql);

while(rst.next()){
%>
<option value="<%=rst.getString("bookName")%>"><%=rst.getString("bookName")%></option>
<%
}
%>
</select><br>
Username: <input type="text" name="uname" size="20"><br>
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>
<%

con.close();
%>
</div>
</body>
</html>

