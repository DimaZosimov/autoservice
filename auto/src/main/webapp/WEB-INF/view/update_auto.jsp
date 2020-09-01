<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="updateAuto.title"/></title>
</head>
<body>
<div>
	<a href="<%=request.getContextPath()%>/update_auto?languageVar=en&updateId=${response.autoId}&${_csrf.parameterName}=${_csrf.token}">EN</a>
  	<a href="<%=request.getContextPath()%>/update_auto?languageVar=ru&updateId=${response.autoId}&${_csrf.parameterName}=${_csrf.token}">RU</a>
	<sec:authorize access="!isAuthenticated()">
		<jsp:forward page="/auto-1.0/"></jsp:forward>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div align="center">
			<table>
				<tr>
					<td><a href="/auto-1.0/"><spring:message code="updateAuto.href.home"/></a></td>
					<td><a href="/auto-1.0/profile"><spring:message code="updateAuto.href.profile"/></a></td>
					<td><a href="/auto-1.0/auto"><spring:message code="updateAuto.href.auto"/></a></td>
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
						<td><b><form:label path="brand"><spring:message code="updateAuto.text.brand"/></form:label></b></td>
						<td><form:input path="brand" type="text" value="${response.brand}"/>
												  <form:errors path="brand"/></td>
					</tr>
					<tr>
						<td><b><form:label path="model"><spring:message code="updateAuto.text.model"/></form:label></b></td>
						<td><form:input path="model" value="${response.model}"/>
												  <form:errors path="model"/></td>
					</tr>
					<tr>
						<td><b><form:label path="engine"><spring:message code="updateAuto.text.typeOfEngine"/></form:label></b></td>
						<td><form:radiobutton path="engine" value="PETROL" />
							<spring:message code="updateAuto.text.typeOfEngine.petrol"/><br>
							<form:radiobutton path="engine" value="DIESEL" checked="checked"/>
							<spring:message code="updateAuto.text.typeOfEngine.diesel"/><br>
							<form:radiobutton path="engine" value="ELECTRIC"/>
							<spring:message code="updateAuto.text.typeOfEngine.electric"/>
							<form:errors path="engine"/></td>
					</tr>
					<tr>
						<td><b><form:label path="yearOfManufacture"><spring:message code="updateAuto.text.yearOfManufacture"/></form:label></b></td>
						<td><form:input path="yearOfManufacture" value="${response.yearOfManufacture}"/>
																<form:errors path="yearOfManufacture"/></td>
					</tr>
					<tr>
						<td><b><form:label path="mileage"><spring:message code="updateAuto.text.mileage"/></form:label></b></td>
						<td><form:input path="mileage" value="${response.mileage}"/>
													 <form:errors path="mileage"/></td>
					</tr>
				</table>
				<form:hidden path="autoId" value="${response.autoId}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button type="submit"><spring:message code="updateAuto.button.save"/></button> 
			</form:form>
		</div>
	</sec:authorize>
</div>

</body>
</html>