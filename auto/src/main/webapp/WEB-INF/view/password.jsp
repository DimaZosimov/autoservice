<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="password.title"/></title>
</head>
<body>
	<a href="<%=request.getContextPath()%>/password?languageVar=en">EN</a>
  	<a href="<%=request.getContextPath()%>/password?languageVar=ru">RU</a>
	<div align="center">
		<h2><spring:message code="password.text.edit.password"/></h2>
		<form:form action="password" modelAttribute="requestPassword" method="POST">
			<table>
				<tr><td><form:label path="password"><spring:message code="password.text.oldPassword"/></form:label></td></tr>
				<tr><td><form:input path="password" type="password"/></td></tr>
				<tr><td><form:errors path="password" /></td></tr>
				<tr><td><form:label path="newPassword"><spring:message code="password.text.newPassword"/></form:label></td></tr>
				<tr><td><form:input path="newPassword" type="password"/></td></tr>
				<tr><td><form:errors path="newPassword" /></td></tr>
				<tr><td><form:label path="newPasswordConfirm"><spring:message code="password.text.confirmPassword"/></form:label></tr>
				<tr><td><form:input path="newPasswordConfirm" type="password"/></td></tr>
				<tr><td><form:errors path="newPasswordConfirm" /></td></tr>
			</table>
			${passwordError}<br>
			<button type="submit"><spring:message code="password.button.save"/></button>
		</form:form></div>
		<br>${error}
	<div align="center"><a href="/auto-1.0/"><spring:message code="password.href.home"/></a></div>
</body>
</html>