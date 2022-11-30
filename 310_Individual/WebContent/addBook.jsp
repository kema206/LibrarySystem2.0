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
<h2>Enter Book you want to add:</h2>
<br>
<br>
<form method="get" action="addBookSuccess.jsp">
    ISBN:<br> <input type="text" name="isbn">
    <br>
    Book Name:<br> <input type="text" name="bookName">
    <br>
    Author:<br> <input type="text" name="author">
    <br>
    Year Published:<br> <input type="text" name="yearpub">
    <br>
    Genre:<br> <input type="text" name="genre">
    <br>
    qty:<br> <input type="text" name="qty">
    <br>
    originalAmt:<br> <input type="text" name="originalAmt">
    <br>
    <br>
    <input type="submit">
</form>
</div>