<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Главная</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div>
  <h3>${pageContext.request.userPrincipal.name}</h3>
  <sec:authorize access="!isAuthenticated()">
    <h4><a href="/auto-1.0/login"><spring:message code="index.login"/></a></h4>
    <h4><a href="/auto-1.0/registration"><spring:message code="index.registration"/></a></h4>
  </sec:authorize>
  <sec:authorize access="isAuthenticated()">
  	<div align="left">
  		<a href="/auto-1.0/profile"><spring:message code="index.my.profile"/></a>
  		<a href="/auto-1.0/auto"><spring:message code="index.my.cars"/></a>
  	</div>
    <form action="logout" method="post">
    	    <button type="submit"><spring:message code="index.button.logout"/></button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
  </sec:authorize>
  <a href="<%=request.getContextPath()%>?languageVar=en">EN</a>
  <a href="<%=request.getContextPath()%>?languageVar=ru">RU</a>
</div>
</body>
</html>