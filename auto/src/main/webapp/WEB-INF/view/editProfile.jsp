<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><spring:message code="editProfile.title"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
            <div class="tab-pane fade show active" id="edit-profile">
              <div class="text-light">
                <h3><spring:message code="editProfile.text.head"/></h3>
              </div>
              <form:form action="edit" method="POST" modelAttribute="profileRequest">
                <!-- Username -->
                <div class="form-group row">
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="username">
                  	<spring:message code="editProfile.text.username"/>
                  </form:label>
                  <div class="col-md-9">
	                  <form:input class="form-control" type="text" path="username" value="${response.username}"/>
	                  <div class="text-danger">
	                    <p><form:errors path="username"/></p>
	                  </div>
	                  <div class="text-warning">
	                  	<p>${warningMessage}</p>
	                  </div>
                  </div>
                </div>
                <!-- First name -->
                <div class="form-group row">
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="firstName">
                  	<spring:message code="editProfile.text.firstName"/>
                  </form:label>
                  <div class="col-md-9">
                  	<form:input class="form-control" type="text" path="firstName" value="${response.firstName}"/>
                  	<div class="text-danger">
                    	<p><form:errors path="firstName"/></p>
                  	</div>
                  </div>
                </div>
                <!-- Middle name -->
                <div class="form-group row">
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="middleName">
                  	<spring:message code="editProfile.text.middleName"/>
                  </form:label>
                  <div class="col-md-9">
	                  <form:input class="form-control" type="text" path="middleName" value="${response.middleName}"/>
	                  <div class="text-danger">
	                    <p><form:errors path="middleName"/></p>
	                  </div>
                  </div>
                </div>
                <!-- Last name -->
                <div class="form-group row">
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="lastName">
                  	<spring:message code="editProfile.text.lastName"/>
                  </form:label>
                  <div class="col-md-9">
	                  <form:input class="form-control" type="text" path="lastName" value="${response.lastName}"/>
	                  <div class="text-danger">
	                    <p><form:errors path="lastName"/></p>
	                  </div>
                  </div>
                </div>
                <!-- Date of birth -->
                <div class="form-group row">
                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="dateOfBirth">
                  	<spring:message code="editProfile.text.dateOfBirth"/>
                  </form:label>
                  <div class="col-md-9">
	                  <form:input class="form-control" type="date" path="dateOfBirth" value="${response.dateOfBirth}"/>
	                  <div class="text-danger">
	                    <p><form:errors path="dateOfBirth"/></p>
	                  </div>
                  </div>
                </div>
                <button class="btn btn-primary" type="submit"><spring:message code="editProfile.button.save"/></button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              </form:form>
            </div>
           </div>
          </div>
       </div>
      </div>
    </body>
</html>