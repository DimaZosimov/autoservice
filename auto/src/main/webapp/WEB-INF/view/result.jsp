<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Result</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	
</head>
<body style="background-color: #2E2B3D">
	<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #792A8A">
      <a href="#" class="navbar-brand"><spring:message code="navbar.brand"/></a>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a href="/auto-1.0/main" class="nav-link"><spring:message code="navbar.home"/></a>
          </li>
          <li class="nav-item">
            <a href="/auto-1.0/auto" class="nav-link"><spring:message code="navbar.my.cars"/></a>
          </li>
          <li class="nav-item">
            <a href="/auto-1.0/profile" class="nav-link"><spring:message code="navbar.my.profile"/></a>
          </li>
        </ul>
        <div>
          <a href="<%=request.getContextPath()%>/auto?languageVar=ru" class="btn btn-default" style="color: #C2C1C1">RU</a>
          <a href="<%=request.getContextPath()%>/auto?languageVar=en" class="btn btn-default" style="color: #C2C1C1">EN</a>
        </div>
        <span class="navbar-text mr-sm-2">
          ${pageContext.request.userPrincipal.name}
        </span>
        <form class="form-inline" action="logout" method="POST">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <button class="btn btn-dark " type="submit"><spring:message code="navbar.button.logout"/></button>
        </form>
      </div>
    </nav>
    <div class="container">
    	<c:if test="${not empty errorMessage}">
			           <div class="alert alert-danger mb-0 text-center">
						  <p>${errorMessage}</p>
					   </div>
				    </c:if>
				    <c:if test="${not empty successMessage}">
			           <div class="alert alert-success mb-0 text-center">
						  <p>${successMessage}</p>
					   </div>
		</c:if>
	</div>

</body>
</html>