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
		<h1>入力確認</h1>
		<p>メールアドレス ${customer.email}</p>
		<p>パスワード ${customer.password}</p>
		<p>名前 ${customer.name}</p>
		<p>性別
		<c:choose>
			<c:when test="${customer.gender == 0}">男</c:when>
			<c:otherwise>女</c:otherwise>
		</c:choose>
		</p>
		<p>血液型 ${customer.blood}型</p>
		<p>年齢 ${customer.old}歳</p>
		<p>メモ ${customer.memo}</p>
		<form method="post" action="create">
			<input type="hidden" name="email" value="<c:out value='${customer.email}' />" >
			<input type="hidden" name="password" value="<c:out value='${customer.password}' />" >
			<input type="hidden" name="name" value="<c:out value='${customer.name}' />" >
			<input type="hidden" name="gender" value="<c:out value='${customer.gender}' />" >
			<input type="hidden" name="blood" value="<c:out value='${customer.blood}' />" >
			<input type="hidden" name="old" value="<c:out value='${customer.old}' />" >
			<input type="hidden" name="memo" value="<c:out value='${customer.memo}' />" >
			<input type="submit" value="登録">
		</form>
		<a href="insert.jsp">修正する</a>
	</div>
</body>
</html>