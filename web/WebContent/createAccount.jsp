<!DOCTYPE html>
<html>
<head>
<title>Create Account Page</title>
</head>
<body style="background-color:#FFFDD0;">

<div class="text-c">
<h2>Create a New Accoount</h2>
<br>
<br>
<form method="get" action="createAccountSuccess.jsp">
<br>
<b>Enter a new Username, Password, and Level (0 for admin | 1 for user):</b>
<br>
<br>
<b>Username:</b>
<input type="text" name="uname">
<br>
<br>
<b>Password:</b>
<input type="text" name="pass">
<br>
<br>
<b>Level:</b>
<input type="text" name="lvl">
<br>
<br>
<input type="submit">
</form>
</div>

<style>
    .text-c {
		text-align: center;
	}
</style>
</body>
</html>

