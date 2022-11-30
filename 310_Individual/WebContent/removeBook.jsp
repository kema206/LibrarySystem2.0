<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Library</title>
</head>
<body style="background-color:#FFFDD0;">

<style>
    .text-c {
		text-align: center;
	}
</style>

<div class="text-c">
<h2>Enter Book you want to remove:</h2>
<br>
<br>
<form method="get" action="removeBookSuccess.jsp">
    ISBN: <input type="text" name="isbn">
    <br>
    <br>
    <input type="submit">
</form>
</div>

</body>
</html>

