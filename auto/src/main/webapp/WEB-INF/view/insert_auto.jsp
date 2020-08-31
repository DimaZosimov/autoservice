<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="insertAuto.title"/></title>
</head>
<body>
<div>
	<a href="<%=request.getContextPath()%>/insert_auto?languageVar=en">EN</a>
  	<a href="<%=request.getContextPath()%>/insert_auto?languageVar=ru">RU</a>
	<sec:authorize access="!isAuthenticated()">
		<jsp:forward page="/auto-1.0/"></jsp:forward>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div align="center">
			<table>
				<tr>
					<td><a href="/auto-1.0/"><spring:message code="insertAuto.href.home"/></a></td>
					<td><a href="/auto-1.0/profile"><spring:message code="insertAuto.href.profile"/></a></td>
					<td><a href="/auto-1.0/auto"><spring:message code="insertAuto.href.auto"/></a></td>
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
					<form:label path="brand"><spring:message code="insertAuto.text.brand"/></form:label><br>
					<form:input type="text" path="brand" placeholder="brand"/>
					<form:errors path="brand"/>
					</div>
					<div>
					<form:label path="model"><spring:message code="insertAuto.text.model"/></form:label><br>
					<form:input type="text" path="model" placeholder="model"/>
					<form:errors path="model"/>
					</div>
	 				<div>
					<form:label path="engine"><spring:message code="insertAuto.text.typeOfEngine"/></form:label><br>
					<form:radiobutton path="engine" value="PETROL" checked="checked"/><spring:message code="insertAuto.text.typeOfEngine.petrol"/><br>
					<form:radiobutton path="engine" value="DIESEL"/><spring:message code="insertAuto.text.typeOfEngine.diesel"/><br>
					<form:radiobutton path="engine" value="ELECTRIC"/><spring:message code="insertAuto.text.typeOfEngine.electric"/>
					<form:errors path="engine"/>
					</div>
					<div>
					<form:label path="yearOfManufacture"><spring:message code="insertAuto.text.yearOfManufacture"/></form:label><br>
					<form:input type="text" path="yearOfManufacture" placeholder="yearOfManufacture"/>
					<form:errors path="yearOfManufacture"/>
					</div>
					<div>
					<form:label path="milleage"><spring:message code="insertAuto.text.milleage"/></form:label><br>
					<form:input type="text" path="milleage" placeholder="milleage"/>
					<form:errors path="milleage"/>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button type="submit"><spring:message code="insertAuto.button.insert"/></button>
				</form:form>
			</div>
		</div>
	</sec:authorize>
</div>

</body>
</html>