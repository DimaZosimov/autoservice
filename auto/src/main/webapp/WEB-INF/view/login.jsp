<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>
</head>

<body>
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/auto-1.0/"); %>
</sec:authorize>
<div align="center">
	<a href="<%=request.getContextPath()%>/login?languageVar=en">EN</a>
  	<a href="<%=request.getContextPath()%>/login?languageVar=ru">RU</a>
  <form method="POST" action="login">
    <h2><spring:message code="login.main"/></h2>
    <div>
      <input name="username" type="text" placeholder="Username"
             autofocus="true"/>
      <input name="password" type="password" placeholder="Password"/>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <button type="submit"><spring:message code="login.button.enter"/></button>
    </div>
    <div>
        <label>
            <input type="checkbox" id="rememberme"  name="_spring_security_remember_me"/><spring:message code="login.rememberMe"/>
        </label>
    </div>
    <h4><a href="/auto-1.0/registration"><spring:message code="login.href.registration"/></a></h4>
  </form>
</div>

</body>
</html>