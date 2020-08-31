<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
</head>

<body>
<div>
  <form:form method="POST" modelAttribute="registrationRequest">
    <h2>Регистрация</h2>
    <div>
    	Login:<br/>
      <form:input type="text" path="username" placeholder="Username"
                  autofocus="true"/><br>
      <form:errors path="username"/>
        ${usernameError}
    </div>
    <div>
    	Password:<br/>
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
    	First name:<br>
    	<form:input path="firstName" type="text" placeholder="first name"/><br>
    	<form:errors path="firstName"/><br>
    	Middle name:<br>
    	<form:input path="middleName" type="text" placeholder="middle name"/><br>
    	Last name:<br>
    	<form:input path="lastName" type="text" placeholder="last name"/><br>
    	<form:errors path="lastName"/><br>
    	Date of birth:<br>
    	<form:input path="dateOfBirth" type="date"/><br>
    </div>
    ${error}<br>
    <button type="submit">Зарегистрироваться</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form:form>
  <a href="/auto-1.0/">Главная</a>
</div>
</body>
</html>