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
			<form action="update" method="post">
				<label for="email">Email</label>
				<input type="text" name="email" value="${customer.email}">
				<label for="password">パスワード</label>
				<input type="text" name="password" value="${customer.password}">
				<label for="name">氏名</label>
				<input type="text" name="name" value="${customer.name}">
				<label for="gender">性別</label>
				<input type="radio" name="gender" value="0">男
				<input type="radio" name="gender" value="1">女
				<label for="blood">血液型</label>
				<select name="blood">
					<c:choose>
						<c:when test="${customer.blood == 'A'}">
							<option value="A" selected>A型</option>
						</c:when>
						<c:otherwise>
							<option value="A">A型</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${customer.blood == 'B'}">
							<option value="B" selected>B型</option>
						</c:when>
						<c:otherwise>
							<option value="B">B型</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${customer.blood == 'O'}">
							<option selected value="O">O型</option>
						</c:when>
						<c:otherwise>
							<option value="O">O型</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${customer.blood == 'AB'}">
							<option value="AB" selected>AB型</option>
						</c:when>
						<c:otherwise>
							<option value="AB">AB型</option>
						</c:otherwise>
					</c:choose>
				</select>
				<label for="memo">メモ</label>
				<textarea name="memo" rows="4" cols="41" maxlength="100">${customer.memo}</textarea>
				<input type="hidden" name="id" value="${customer.id}">
				<input type="submit" value="更新">
			</form>
			<form method="post" action="destroy">
				<input type="hidden" name="id" value="${customer.id}">
				<input type="submit" value="削除">
			</form>
		</div>
	</body>
</html>