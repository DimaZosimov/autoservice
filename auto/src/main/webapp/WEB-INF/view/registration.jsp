<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title><spring:message code="registration.title"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  
</head>

<body style="background-color: #2E2B3D">
    <div class="container mt-3">
      <div class="row">
        <div class="col-md-2">
          <h2 class="text-light"><spring:message code="registration.text.head"/></h2>
        </div>
        <div class="col-md-3">
          <a href="/auto-1.0/main" class="btn btn-default btn-lg" style="color: #C2C1C1"><spring:message code="registration.href.home"/></a>
          <a href="/auto-1.0/login" class="btn btn-default btn-lg" style="color: #C2C1C1"><spring:message code="registration.href.login"/></a>
        </div>
        <div class="col-md-2">
          <a href="<%=request.getContextPath()%>/registration?languageVar=ru" class="btn btn-default" style="color: #C2C1C1">RU</a>
          <a href="<%=request.getContextPath()%>/registration?languageVar=en" class="btn btn-default" style="color: #C2C1C1">EN</a>
        </div>
      </div>
      <form:form class="mt-md-3 mb-2" action="registration" method="POST" modelAttribute="registrationRequest">
        <div class="form-group row">
          <form:label class="col-md-2 col-form-label col-form-label-lg" style="color: #C2C1C1" path="username">
            <spring:message code="registration.text.login"/>
          </form:label>
          <form:input class="form-control col-md-4" type="text" path="username" placeholder="Username"/>
          <div class="text-danger">
            <form:errors path="username"/>
          </div>
          <div class="text-danger">
            ${usernameError}
          </div>
        </div>
        <div class="form-group row">
          <form:label class="col-md-2 col-form-label col-form-label-lg" style="color: #C2C1C1" path="password">
            <spring:message code="registration.text.password"/>
          </form:label>
          <form:input class="form-control col-md-4" type="password" path="password" placeholder="Password"/>
          <div class="text-danger">
            <form:errors path="password"/>
          </div>
        </div>
        <div class="form-group row">
          <form:label class="col-md-2 col-form-label col-form-label-lg" style="color: #C2C1C1" path="passwordConfirm">
              <spring:message code="registration.text.passwordConfirm"/>
          </form:label>
          <form:input class="form-control col-md-4" type="password" path="passwordConfirm" placeholder="Password confirm"/>
          <div class="text-danger">
            <form:errors path="passwordConfirm"/>
          </div>
          <div class="text-danger">
            ${passwordError}
          </div>
        </div>
        <div class="form-group row">
          <form:label class="col-md-2 col-form-label col-form-label-lg" style="color: #C2C1C1" path="firstName">
            <spring:message code="registration.text.firstName"/>
          </form:label>
          <form:input class="form-control col-md-4" type="text" path="firstName" placeholder="First name"/>
          <div class="text-danger">
            <form:errors path="firstName"/>
          </div>
        </div>
        <div class="form-group row">
          <form:label class="col-md-2 col-form-label col-form-label-lg" style="color: #C2C1C1" path="middleName">
            <spring:message code="registration.text.middleName"/>
          </form:label>
          <form:input class="form-control col-md-4" type="text" path="middleName" placeholder="Middle name"/>
          <div class="text-danger">
            <form:errors path="middleName"/>
          </div>
        </div>
        <div class="form-group row">
          <form:label class="col-md-2 col-form-label col-form-label-lg" style="color: #C2C1C1" path="lastName">
            <spring:message code="registration.text.lastName"/>
          </form:label>
          <form:input class="form-control col-md-4" type="text" path="lastName" placeholder="Lastname"/>
          <div class="text-danger">
            <form:errors path="lastName"/>
          </div>
        </div>
        <div class="form-group row">
          <form:label class="col-md-2 col-form-label col-form-label-lg" style="color: #C2C1C1" path="dateOfBirth">
            <spring:message code="registration.text.dateOfBirth"/>
          </form:label>
          <form:input class="form-control col-md-4" type="date" path="dateOfBirth"/>
          <div class="text-danger">
            <form:errors path="dateOfBirth"/>
          </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button class="btn" style="color: #C2C1C1; background-color: #765252" type="submit">
          <spring:message code="registration.button.registration"/>
        </button>
      </form:form>
    </div>
</body>
</html>