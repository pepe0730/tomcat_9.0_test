<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>マイページ</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="main">
		<h1>マイページ</h1>
		<c:if test="${!empty LoginUser.name}">
			<p>こんにちは、${LoginUser.name}さん</p>
		</c:if>
		<c:if test="${!empty LoginUser.email}">
			<p>こんにちは、${LoginUser.email}さん</p>
		</c:if>
		<p> 顧客情報の検索条件を入力してください</p>
		<form action="search" method="post">
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
			<input type="submit" value="送信">
		</form>
		<p>全権取得したい場合はこちら</p>
		<a href="search_all">全件検索</a>
		<table border="1">
			<tr>
				<th>id</th>
				<th>email</th>
				<th>氏名</th>
				<th>性別</th>
				<th>血液型</th>
				<th>年齢</th>
				<th>詳細</th>
			</tr>
			<c:forEach var="customer" items="${customerList}">
				<tr>
					<td><c:out value="${customer.id}" /></td>
					<td><c:out value="${customer.email}" /></td>
					<td><c:out value="${customer.name}" /></td>
					<c:if test="${customer.gender == 0 }"><td>男</td></c:if>
					<c:if test="${customer.gender == 1 }"><td>女</td></c:if>
					<td><c:out value="${customer.blood}" />型</td>
					<td><c:out value="${customer.old}" />歳</td>
					<td>
						<a href="search?id=<c:out value="${customer.id}" />">詳細はこちら</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>
