<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Auto service</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <spring:url value="/resources/css/style.css" var="style" />
  <link rel="stylesheet" type="text/css" href="${style}">
   
</head>
<body>
<div>
  <sec:authorize access="!isAuthenticated()">
    <jsp:forward page="/login"></jsp:forward>
  </sec:authorize>
  <sec:authorize access="isAuthenticated()">
  	<jsp:forward page="/main"></jsp:forward>
  </sec:authorize>
</div>
</body>
</html>