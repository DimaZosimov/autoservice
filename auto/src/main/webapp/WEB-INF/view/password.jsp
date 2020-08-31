<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password</title>
</head>
<body>
	<sec:authorize access="!isAuthenticated()">
		<jsp:forward page="/auto-1.0/"></jsp:forward>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div align="center">
		<h2>Изменение пароля</h2>
		<form:form action="password" modelAttribute="requestPassword" method="POST">
			<table>
				<tr><td>Старый пароль:</td></tr>
				<tr><td><form:input path="password" type="password"/></td></tr>
				<tr><td><form:errors path="password" /></td></tr>
				<tr><td>Новый пароль:</td></tr>
				<tr><td><form:input path="newPassword" type="password"/></td></tr>
				<tr><td><form:errors path="newPassword" /></td></tr>
				<tr><td>Повторить пароль:</tr>
				<tr><td><form:input path="newPasswordConfirm" type="password"/></td></tr>
				<tr><td><form:errors path="newPasswordConfirm" /></td></tr>
			</table>
			${passwordError}<br>
			<button type="submit">Сохранить</button>
		</form:form></div>
		<br>${error}
		<div align="center"><a href="/auto-1.0/">Главная</a></div>
	</sec:authorize>

</body>
</html>