<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title><spring:message code="registration.title"/></title>
</head>

<body>
<div>
  <a href="<%=request.getContextPath()%>/registration?languageVar=en">EN</a>
  <a href="<%=request.getContextPath()%>/registration?languageVar=ru">RU</a>
  <form:form method="POST" modelAttribute="registrationRequest">
    <h2><spring:message code="registration.text.head"/></h2>
    <div>
      <form:label path="username"><spring:message code="registration.text.login"/></form:label><br>
      <form:input type="text" path="username" placeholder="Username"
                  autofocus="true"/>
      <form:errors path="username"/><br/>
        ${usernameError}
    </div>
    <div>
      <form:label path="password"><spring:message code="registration.text.password"/></form:label><br>
      <form:input type="password" path="password" placeholder="Password"/><br>
      <form:errors path="password"/>
    </div>
    <div>
      <form:input type="password" path="passwordConfirm"
                  placeholder="Confirm your password"/><br>
      <form:errors path="password"/>
        ${passwordError}
    </div>
    <div>
    	<form:label path="firstName"><spring:message code="registration.text.firstName"/></form:label><br>
    	<form:input path="firstName" type="text" placeholder="first name"/><br>
    	<form:errors path="firstName"/><br>
    	<form:label path="middleName"><spring:message code="registration.text.middleName"/></form:label><br>
    	<form:input path="middleName" type="text" placeholder="middle name"/><br>
    	<form:label path="lastName"><spring:message code="registration.text.lastName"/></form:label><br>
    	<form:input path="lastName" type="text" placeholder="last name"/><br>
    	<form:errors path="lastName"/><br>
    	<form:label path="dateOfBirth"><spring:message code="registration.text.dateOfBirth"/></form:label><br>
    	<form:input path="dateOfBirth" type="date"/><br>
    </div>
    ${error}<br>
    <button type="submit"><spring:message code="registration.button.registration"/></button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form:form>
  <a href="/auto-1.0/"><spring:message code="registration.href.home"></spring:message></a>
</div>
</body>
</html>