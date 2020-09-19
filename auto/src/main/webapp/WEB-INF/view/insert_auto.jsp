<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><spring:message code="insertAuto.title"/></title>
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
          <a href="<%=request.getContextPath()%>/auto/insert_auto?languageVar=ru" class="btn btn-default" style="color: #C2C1C1">RU</a>
          <a href="<%=request.getContextPath()%>/auto/insert_auto?languageVar=en" class="btn btn-default" style="color: #C2C1C1">EN</a>
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
	            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/auto" id="profile-list">
	            	<spring:message code="auto.list.auto"/>
	            </a>
	            <a class="list-group-item list-group-item-action list-group-item-info" href="/auto-1.0/auto/insert_auto" id="edit-profile-list">
	            	<spring:message code="auto.list.insert"/>
	            </a>
	          </div>
	        </div>
	        <div class="col-md-9">
	        	<div class="text-light">
                	<h3><spring:message code="insertAuto.text.head"/></h3>
              	</div>
	        	<form:form action="insert_auto" method="POST" modelAttribute="autoRequest">
	        		<!-- Brand -->
	                <div class="form-group row">
	                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="brand">
	                  	<spring:message code="insertAuto.text.brand"/>
	                  </form:label>
	                  <div class="col-md-9">
	                  	<form:input class="form-control" type="text" path="brand" placeholder="brand"/>
	                  	<div class="text-danger">
	                    	<p><form:errors path="brand"/></p>
	                  	</div>
	                  </div>
	                </div>
	                <!-- Model -->
	                <div class="form-group row">
	                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="model">
	                  	<spring:message code="insertAuto.text.model"/>
	                  </form:label>
	                  <div class="col-md-9">
	                  	<form:input class="form-control" type="text" path="model" placeholder="model"/>
	                  	<div class="text-danger">
	                    	<p><form:errors path="model"/></p>
	                  	</div>
	                  </div>
	                </div>
	                <!-- Type of engine -->
	                <div class="form-group row">
	                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="engine">
	                  	<spring:message code="insertAuto.text.typeOfEngine"/>
	                  </form:label>
	                  <div class="col-md-9">
	                  	<div class="form-check text-light">
							<form:radiobutton class="form-check-input" path="engine" value="PETROL" checked="checked"/>
						  	<form:label class="form-check-label" path="engine">
						    	<spring:message code="insertAuto.text.typeOfEngine.petrol"/>
						  	</form:label>
						</div>
						<div class="form-check text-light">
							<form:radiobutton class="form-check-input" path="engine" value="DIESEL"/>
						  	<form:label class="form-check-label" path="engine">
						    	<spring:message code="insertAuto.text.typeOfEngine.diesel"/>
						  	</form:label>
						</div>
						<div class="form-check text-light">
							<form:radiobutton class="form-check-input" path="engine" value="ELECTRIC"/>
						  	<form:label class="form-check-label" path="engine">
						    	<spring:message code="insertAuto.text.typeOfEngine.electric"/>
						  	</form:label>
						</div>
	                  	<div class="text-danger">
	                    	<p><form:errors path="engine"/></p>
	                  	</div>
	                  </div>
	                </div>
	                <!-- Year of manufacture -->
	                <div class="form-group row">
	                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="yearOfManufacture">
	                  	<spring:message code="insertAuto.text.yearOfManufacture"/>
	                  </form:label>
	                  <div class="col-md-9">
	                  	<form:input class="form-control" type="text" path="yearOfManufacture" placeholder="yearOfManufacture"/>
	                  	<div class="text-danger">
	                    	<p><form:errors path="yearOfManufacture"/></p>
	                  	</div>
	                  </div>
	                </div>
	                <!-- Mileage -->
	                <div class="form-group row">
	                  <form:label class="col-md-3 col-form-label col-form-label-lg text-muted" path="mileage">
	                  	<spring:message code="insertAuto.text.mileage"/>
	                  </form:label>
	                  <div class="col-md-9">
	                  	<form:input class="form-control" type="text" path="mileage" placeholder="mileage"/>
	                  	<div class="text-danger">
	                    	<p><form:errors path="mileage"/></p>
	                  	</div>
	                  </div>
	                </div>
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button class="btn btn-primary" type="submit"><spring:message code="insertAuto.button.insert"/></button>
	        	</form:form>
	        </div>
		</div>
	</div>
</body>
</html>