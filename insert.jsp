<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>マイページ</title>
		<link href="style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="main">
			<h1>詳細画面</h1>
			<form action="check" method="post">
				<label for="email">Email</label>
				<input type="text" name="email">
				<label for="password">パスワード</label>
				<input type="text" name="password">
				<label for="name">氏名</label>
				<input type="text" name="name">
				<label for="gender">性別</label>
				<input type="radio" name="gender" value="0">男
				<input type="radio" name="gender" value="1">女
				<label for="blood">血液型</label>
				<select name="blood">
					<option value="A">A型</option>
					<option value="B">B型</option>
					<option value="O">O型</option>
					<option value="AB">AB型</option>
				</select>
				<label for="old">年齢</label>
				<input type="text" name="old" placeholder="半角英数のみ">歳
				<label for="memo">メモ</label>
				<textarea name="memo" rows="4" cols="41" maxlength="100"></textarea>
				<input type="submit" value="新規登録">
			</form>
		</div>
	</body>
</html>