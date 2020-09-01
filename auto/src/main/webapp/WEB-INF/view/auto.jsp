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
<title><spring:message code="auto.title"/></title>
</head>
<body>
<div>
	<a href="<%=request.getContextPath()%>/auto?languageVar=en">EN</a>
  	<a href="<%=request.getContextPath()%>/auto?languageVar=ru">RU</a>
	<sec:authorize access="!isAuthenticated()">
		<jsp:forward page="/auto-1.0/"></jsp:forward>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div align="center">
			<table>
				<tr>
					<td><a href="/auto-1.0/"><spring:message code="auto.href.home"/></a></td>
					<td><a href="/auto-1.0/profile"><spring:message code="auto.href.profile"/></a></td>
					<td><a href="/auto-1.0/auto"><spring:message code="auto.href.auto"/></a></td>
					<td><div><form action="logout" method="post">
					            <input type="submit" value="Sign Out"/>
					            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					    	</form></div>
					</td>
				</tr>
			</table>
		</div>
		
    	<div align="center">
    		<div>${noAuto}</div>
    		<c:if test="${not empty  listCars}">
    			<table>
    				<c:forEach var="auto" items="${listCars}">
    					<tr>
    						<td><b>${auto.brand}</b></td>
    						<td>${auto.model}</td>
    					</tr>
    					<tr>
    						<td><spring:message code="auto.text.typeOfEngine"/></td>
    						<td>${auto.engine}</td>
    					</tr>
    					<tr>
    						<td><spring:message code="auto.text.yearOfManufacture"/></td>
    						<td>${auto.yearOfManufacture}</td>
    					</tr>
    					<tr>
    						<td><spring:message code="auto.text.mileage"/></td>
    						<td>${auto.mileage}</td>
    					</tr>
    					<tr>
    						<td><form:form method="GET" action="update_auto">
    							<input type="hidden" name="updateId" value="${auto.autoId}"/>
    							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    							<button type="submit"><spring:message code="auto.button.edit"/></button>
    							</form:form></td>
    						<td><form:form method="GET" action="delete_auto">
    							<input type="hidden" name="deleteId" value="${auto.autoId}"/>
    							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    							<button type="submit"><spring:message code="auto.button.delete"/></button> 
    						</form:form>
    				</c:forEach>
    			</table>
    		</c:if>
    	</div>
    	<div>
    		<form:form method="GET" action="insert_auto">
    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    			<button type="submit"><spring:message code="auto.button.insertAuto"/></button>
    		</form:form>
    	</div>
	</sec:authorize>
</div>
</body>
</html>