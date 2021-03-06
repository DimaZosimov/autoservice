<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><spring:message code="profile.title"/></title>
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
            <div class="tab-pane fade show active" id="main">
              <div class="row mt-md-3 ml-md-3">
                <div class="col-md-3"><h5 class="text-light"><spring:message code="profile.text.username"/></h5></div>
                <div class="col-md-9"><h5 class="text-muted">${response.username}</h5></div>
              </div>
              <div class="row ml-md-3">
                <div class="col-md-3"><h5 class="text-light"><spring:message code="profile.text.firstName"/></h5></div>
                <div class="col-md-9"><h5 class="text-muted">${response.firstName}</h5></div>
              </div>
              <div class="row ml-md-3">
                <div class="col-md-3"><h5 class="text-light"><spring:message code="profile.text.middleName"/></h5></div>
                <div class="col-md-9"><h5 class="text-muted">${response.middleName}</h5></div>
              </div>
              <div class="row ml-md-3">
                <div class="col-md-3"><h5 class="text-light"><spring:message code="profile.text.lastName"/></h5></div>
                <div class="col-md-9"><h5 class="text-muted">${response.lastName}</h5></div>
              </div>
              <div class="row ml-md-3">
                <div class="col-md-3"><h5 class="text-light"><spring:message code="profile.text.dateOfBirth"/></h5></div>
                <div class="col-md-9"><h5 class="text-muted">${response.dateOfBirth}</h5></div>
              </div>
            </div>
           </div>
           <c:if test="${not empty successMessage}">
	           <div class="alert alert-success mb-0">
				  <p>${successMessage}</p>
			   </div>
		   </c:if>
		   <c:if test="${not empty errorMessage}">
			   <div class="alert alert-danger mb-0">
				  <p>${errorMessage}</p>
			   </div>
		   </c:if>
		   <c:if test="${not empty warningMessage}">
			   <div class="alert alert-warning mb-0">
				  <p>${warningMessage}</p>
			   </div>
		   </c:if>
          </div>
 		</div>
      </div>
    </body>
</html>