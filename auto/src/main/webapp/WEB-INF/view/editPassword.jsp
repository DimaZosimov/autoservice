<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><spring:message code="editPassword.title"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

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
            <a href="/auto-1.0/auto" class="nav-link"><spring:message code="navbar.my.cars"></spring:message></a>
          </li>
          <li class="nav-item">
            <a href="/auto-1.0/profile" class="nav-link"><spring:message code="navbar.my.profile"/></a>
          </li>
        </ul>
        <span class="navbar-text mr-sm-2">
          ${pageContext.request.userPrincipal.name}
        </span>
        <form class="form-inline" action="logout" method="POST">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <button class="btn btn-dark " type="submit"><spring:message code="navbar.button.logout"/></button>
        </form>
      </div>
    </nav>
	<div class="container mt-3">
		<h2 class="text-light"><spring:message code="profile.text.head"/></h2>
		<div class="row">
        <div class="col-md-3">
          <div class="list-group font-weight-bold" id="list-tab">
            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/main" id="home-list">
            	<spring:message code="profile.list.home"/>
            </a>
            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/profile" id="profile-list">
            	<spring:message code="profile.list.profile"/>
            </a>
            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/profile/edit" id="edit-profile-list">
            	<spring:message code="profile.list.editProfile"/>
            </a>
            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/profile/password" id="edit-password-list">
            	<spring:message code="profile.list.editPassword"/>
            </a>
          </div>
        </div>
        <div class="col-md-9">
          <div class="tab-content">
            <div class="tab-pane fade show active" id="edit-password">
              <div class="text-light mt-3">
                <h3><spring:message code="editPassword.text.head"/></h3>
              </div>
              <form:form class="needs-validation" action="password" method="POST" modelAttribute="requestPassword">
                <div class="form-group row">
                  <!-- Old password -->
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="password">
                  	<spring:message code="editPassword.text.oldPassword"/>
                  </form:label>
                  <div class="col-md-9">
                  	<form:input class="form-control col-md-9" type="password" path="password"/>
	                <div class="text-danger">
	                   <p><form:errors path="password"/></p>
	                </div>
	                <div class="text-danger">
	                   <p>${errorMessage}</p>
	                </div>
	              </div>  
                </div>
                <!-- New password -->
                <div class="form-group row">
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="newPassword">
                  	<spring:message code="editPassword.text.newPassword"/>
                  </form:label>
                  <div class="col-md-9">
	                  <form:input class="form-control col-md-9" type="password" path="newPassword"/>
	                  <div class="text-danger">
	                    <p><form:errors path="newPassword"/></p>
	                  </div>
                  </div>
                </div>
                <!-- Confirm password -->
                <div class="form-group row">
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="newPasswordConfirm">
                  	<spring:message code="editPassword.text.confirmPassword"/>
                  </form:label>
                  <div class="col-md-9">
                  	<form:input class="form-control col-md-9" type="password" path="newPasswordConfirm"/>
	                <div class="text-danger">
	                  <p><form:errors path="newPasswordConfirm"/></p>
	                </div>
                  </div>
                </div>
                <c:if test="${not empty errorPassword}">
	                <div class="alert alert-danger" role="alert">
				  		<h5 class="mb-0">${errorPassword}</h5>
			   		</div>
			   	</c:if>
                <button class="btn btn-primary" type="submit"><spring:message code="editPassword.button.save"/></button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              </form:form>
            </div>
          </div>
        </div>
       </div>
      </div>
    </body>
</html>