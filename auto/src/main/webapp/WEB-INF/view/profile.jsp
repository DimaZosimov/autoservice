<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="profile.title"/></title>
</head>
<body>
<div>
	<a href="<%=request.getContextPath()%>/profile?languageVar=en">EN</a>
  	<a href="<%=request.getContextPath()%>/profile?languageVar=ru">RU</a>
	<sec:authorize access="!isAuthenticated()">
		<jsp:forward page="/auto-1.0/"></jsp:forward>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<h2><spring:message code="profile.text.head"/></h2>
		<div></div><c:if test="${edit == 'false'}">
			<table>
				<tr><td><b><spring:message code="profile.text.username"/></b></td><td>${response.username}</td></tr>
				<tr><td><b><spring:message code="profile.text.firstName"/></b></td><td>${response.firstName}</td></tr>
				<tr><td><b><spring:message code="profile.text.middleName"/></b></td><td>${response.middleName}</td></tr>
				<tr><td><b><spring:message code="profile.text.lastName"/></b></td><td>${response.lastName}</td></tr>
				<tr><td><b><spring:message code="profile.text.dateOfBirth"/></b></td><td>${response.dateOfBirth}</td></tr>
			</table>
			<form:form method="GET" action="profile_edit">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button type="submit"><spring:message code="profile.button.edit"/></button>
			</form:form>
						
		</c:if></div>
		<div><c:if test="${edit == 'true'}">
			${usernameError}
			<form:form action="profile" method="POST" modelAttribute="profileRequest">
					<table>
					<tr>
						<td><b><form:label path="username"><spring:message code="profile.text.username"/></form:label></b></td>
						<td><form:input type="text" path="username" value="${response.username}"/></td>
					</tr>
					<tr><td><form:errors path="username"/></td></tr>
					<tr>
						<td><b><form:label path="username"><spring:message code="profile.text.firstName"/></form:label></b></td>
						<td><form:input type="text" path="firstName" value="${response.firstName}"/></td>
					</tr>
					<tr><td><form:errors path="firstName"/></td></tr>
					<tr>
						<td><b><form:label path="username"><spring:message code="profile.text.middleName"/></form:label></b>
						</td><td><form:input type="text" path="middleName" value="${response.middleName}"/></td>
					</tr>
					<tr></tr>
					<tr>
						<td><b><form:label path="username"><spring:message code="profile.text.lastName"/></form:label></b></td>
						<td><form:input type="text" path="lastName" value="${response.lastName}"/></td>
					</tr>
					<tr><td><form:errors path="lastName"/></td></tr>
					<tr>
						<td><b><form:label path="username"><spring:message code="profile.text.dateOfBirth"/></form:label></b>
						</td><td><form:input type="date" path="dateOfBirth" value="${response.dateOfBirth}"/></td>
					</tr>
				</table>
				<button type="submit"><spring:message code="profile.button.save"/></button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form:form>
		</c:if></div>
		${messageOfSaved}
		${error}
		<div>
			<a href="/auto-1.0/password"><spring:message code="profile.href.changePassword"/></a><br>
			<a href="/auto-1.0/"><spring:message code="profile.href.home"/></a>
		</div>
	</sec:authorize>

</div>
</body>
</html>