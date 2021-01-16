<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>ログイン画面</title>
</head>
<body>
	<div class="main">
		<h1>ログイン画面</h1>
		<form action="login" method="post">
			<div class="filed">
				<label for="email">Email</label>
				<input type="text" id="email" name="email">
			</div>
			<div class="filed">
				<label for="password">Password</label>
				<input type="text" id="password" name="password">
			</div>
			<div>
				<input type="submit">
			</div>
		</form>
	</div>

</body>
</html>
