<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cars</title>
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
    		<div>${noAuto}</div>
    		<c:if test="${not empty  listCars}">
    			<table>
    				<c:forEach var="auto" items="${listCars}">
    					<tr>
    						<td><b>${auto.brand}</b></td>
    						<td>${auto.model}</td>
    					</tr>
    					<tr>
    						<td>Тип двигателя:</td>
    						<td>${auto.engine}</td>
    					</tr>
    					<tr>
    						<td>Год выпуска:</td>
    						<td>${auto.yearOfManufacture}</td>
    					</tr>
    					<tr>
    						<td>Пробег:</td>
    						<td>${auto.milleage}</td>
    					</tr>
    					<tr>
    						<td><form:form method="GET" action="update_auto">
    							<input type="hidden" name="updateId" value="${auto.autoId}"/>
    							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    							<button type="submit">Изменить</button>
    							</form:form></td>
    						<td><form:form method="GET" action="delete_auto">
    							<input type="hidden" name="deleteId" value="${auto.autoId}"/>
    							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    							<button type="submit">Удалить</button> 
    						</form:form>
    				</c:forEach>
    			</table>
    		</c:if>
    	</div>
    	<div>
    		<form:form method="GET" action="insert_auto">
    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    			<button type="submit">Добавить авто</button>
    		</form:form>
    	</div>
	</sec:authorize>
</div>
</body>
</html>