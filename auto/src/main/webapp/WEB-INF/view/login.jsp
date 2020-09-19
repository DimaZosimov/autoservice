<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  
</head>

<body style="background-color: #1C105C">
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/auto-1.0/main"); %>
</sec:authorize>
<div class="mx-auto mt-5 " style="background-color: #2E2B3D; width: 350px">
      <div class="row justify-content-center">
        <div class="btn-group mt-2">
          <a href="<%=request.getContextPath()%>/login?languageVar=ru" class="btn btn-default btn-sm"><p class="text-light">RU</p></a>
          <a href="<%=request.getContextPath()%>/login?languageVar=en" class="btn btn-default btn-sm"><p class="text-light">EN</p></a>
        </div>
      </div>
      <div class="row justify-content-center pt-3">
        <h1 class="text-light"><spring:message code="login.main"/></h1>
      </div>
      <form class="needs-validation pb-5" action="login" method="POST">
        <div class="form-row justify-content-center mt-3">
          <div class="col-10">
            <input type="text" name="username" class="form-control" placeholder="Username">
          </div>
          <div class="valid-feedback">
            Valid!
          </div>
        </div>
        <div class="form-row justify-content-center mt-1">
          <div class="col-10">
            <input type="password" name="password" class="form-control" placeholder="Password">
          </div>
          <div class="valid-feedback">
            Valid!
          </div>
        </div>
        <div class="form-group ml-5">
          <div class="form-ckeck">
            <input class="form-check-input" type="checkbox" value="" id="remember-me">
            <label for="remember-me" class="form-check-label text-light">
              <spring:message code="login.rememberMe"/>
            </label>
          </div>
        </div>
        <div class="form-inline justify-content-center">
          <div class="col-auto">
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit"><spring:message code="login.button.enter"/></button>
          </div>
          <div class="col-auto">
            <a href="/auto-1.0/registration" class="btn btn-primary"><spring:message code="login.href.registration"/></a>
          </div>
        </div>
      </form>
    </div>
</body>
</html>