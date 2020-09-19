<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="auto.title"/></title>
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
    <div class="container mt-3">
    	<h2 class="text-light"><spring:message code="auto.text.head"/></h2>
    	<div class="row">
	        <div class="col-md-3">
	          <div class="list-group font-weight-bold" id="list-tab">
	            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/main" id="home-list">
	            	<spring:message code="auto.list.home"/>
	            </a>
	            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/auto" id="auto-list">
	            	<spring:message code="auto.list.auto"/>
	            </a>
	            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/auto/insert_auto" id="edit-auto-list">
	            	<spring:message code="auto.list.insert"/>
	            </a>
	          </div>
	        </div>
	        <div class="col-md-9">
	        	<p class="text-center text-info">${noAuto}</p>
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
	        	 <c:if test="${not empty  listCars}">
	        	  <c:forEach var="auto" items="${listCars}">
	        	  	<div class="row">
	        	 		<div class="col-md-4 font-weight-bold text-light">${auto.brand}</div>
	        	 		<div class="col-md-8 font-weight-normal text-light">${auto.model}</div>
	        	 	</div>
	        	 	<div class="row">
	        	 		<div class="col-md-4 font-weight-bold text-muted"><spring:message code="auto.text.typeOfEngine"/></div>
	        	 		<div class="col-md-8 font-weight-normal text-light">${auto.engine}</div>
	        	 	</div>
	        	 	<div class="row">
	        	 		<div class="col-md-4 font-weight-bold text-muted"><spring:message code="auto.text.yearOfManufacture"/></div>
	        	 		<div class="col-md-8 font-weight-normal text-light">${auto.yearOfManufacture}</div>
	        	 	</div>
	        	 	<div class="row">
	        	 		<div class="col-md-4 font-weight-bold text-muted"><spring:message code="auto.text.mileage"/></div>
	        	 		<div class="col-md-8 font-weight-normal text-light">${auto.mileage}</div>
	        	 	</div>
	        	 	<div class="row">
	        	 		<div class="col-md-3">
	        	 			<form action="update_auto" method="GET">
	        	 				<input type="hidden" name="updateId" value="${auto.autoId}"/>
	        	 				<button class="btn btn-primary btn-small" type="submit">
	        	 					<spring:message code="auto.button.edit"/>
	        	 				</button>
	        	 			</form>
	        	 		</div>
	        	 		<div class="col-md-3">
	        	 			<form action="main_auto" method="POST">
	        	 				<input type="hidden" name="mainId" value="${auto.autoId}"/>
	        	 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        	 				<button class="btn btn-primary btn-small" type="submit">
	        	 					<spring:message code="auto.button.main"/>
	        	 				</button>
	        	 			</form>
	        	 		</div>
	        	 		<div class="col-md-3">
	        	 			<a class="btn btn-primary btn-small" data-toggle="collapse" data-target="#mileage" href="#mileage" role="button" 
	        	 				aria-expanded="false" aria-controls="mileage">
    							<spring:message code="auto.button.mileage"/>
  							</a>
	        	 		</div>
	        	 		<div class="col-md-3">
	        	 			<form action="delete_auto" method="GET">
	        	 				<input type="hidden" name="deleteId" value="${auto.autoId}"/>
	        	 				<button class="btn btn-primary btn-small" type="submit">
	        	 					<spring:message code="auto.button.delete"/>
	        	 				</button>
	        	 			</form>
	        	 		</div>
	        	 	</div>
	        	 	<div class="collapse " id="mileage">
						<div class="card card-body bg-info">
							<form class="form-inline" action="mileage" method="POST">
						  		<label class="text-light mr-2"><spring:message code="auto.text.mileage"/></label>
						    	<input class="form-control mr-2" name="mileage" type="text"/>
						    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						    	<button class="btn btn-primary btn-small" type="submit">
						    		<spring:message code="auto.button.edit"/>
						    	</button>
						    </form>
						</div>
	        	 	</div>
	        	  </c:forEach>
	        	 </c:if>
	        </div>
        </div>
	</div>
	 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</body>
</html>