<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Auto</title>
</head>
<body>
<div>
	<sec:authorize access="!isAuthenticated()">
		<jsp:forward page="/auto-1.0/"></jsp:forward>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div align="center">
			<table>
				<tr>
					<td><a href="/auto-1.0/">Главная</a></td>
					<td><a href="/auto-1.0/profile">Мой профиль</a></td>
					<td><a href="/auto-1.0/auto">Мои автомобили</a></td>
					<td><div><form action="logout" method="post">
					            <input type="submit" value="Sign Out"/>
					            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					    	</form></div>
					</td>
				</tr>
			</table>
		</div>
		<div align="center">
			<form:form method="POST" modelAttribute="autoRequest" action="update_auto">
				<table>
					<tr>
						<td><b>Brand:</b></td><td><form:input path="brand" type="text" value="${response.brand}"/>
												  <form:errors path="brand"/></td>
					</tr>
					<tr>
						<td><b>Model:</b></td><td><form:input path="model" value="${response.model}"/>
												  <form:errors path="model"/></td>
					</tr>
					<tr>
						<td><b>Engine:</b></td><td><form:radiobutton path="engine" value="PETROL" />Бензин<br>
												   <form:radiobutton path="engine" value="DIESEL" checked="checked"/>Дизель<br>
												   <form:radiobutton path="engine" value="ELECTRIC"/>Электро
												   <form:errors path="engine"/></td>
					</tr>
					<tr>
						<td><b>Year of manufacture:</b></td><td><form:input path="yearOfManufacture" value="${response.yearOfManufacture}"/>
																<form:errors path="yearOfManufacture"/></td>
					</tr>
					<tr>
						<td><b>Milleage:</b></td><td><form:input path="milleage" value="${response.milleage}"/>
													 <form:errors path="milleage"/></td>
					</tr>
				</table>
				<form:hidden path="autoId" value="${response.autoId}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button type="submit">Сохранить</button> 
			</form:form>
		</div>
	</sec:authorize>
</div>

</body>
</html>