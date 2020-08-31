<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div>
				<form:form method="POST" modelAttribute="autoRequest" action="insert_auto">
					<div>
					Brand:<br>
					<form:input type="text" path="brand" placeholder="brand"/>
					<form:errors path="brand"/>
					</div>
					<div>
					Model:<br>
					<form:input type="text" path="model" placeholder="model"/>
					<form:errors path="model"/>
					</div>
	 				<div>
					Engine:<br>
					<form:radiobutton path="engine" value="PETROL" checked="checked"/>Бензин<br>
					<form:radiobutton path="engine" value="DIESEL"/>Дизель<br>
					<form:radiobutton path="engine" value="ELECTRIC"/>Электро
					<form:errors path="engine"/>
					</div>
					<div>
					Year of manufacture:<br>
					<form:input type="text" path="yearOfManufacture" placeholder="yearOfManufacture"/>
					<form:errors path="yearOfManufacture"/>
					</div>
					<div>
					Milleage:<br>
					<form:input type="text" path="milleage" placeholder="milleage"/>
					<form:errors path="milleage"/>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button type="submit">Добавить</button>
				</form:form>
			</div>
		</div>
	</sec:authorize>
</div>

</body>
</html>