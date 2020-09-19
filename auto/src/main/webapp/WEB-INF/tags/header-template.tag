<!DOCTYPE html>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #792A8A">
      <a href="#" class="navbar-brand"><spring:message code="navbar.brand"/></a>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a href="/main" class="nav-link"><spring:message code="navbar.home"/></a>
          </li>
          <li class="nav-item">
            <a href="/auto" class="nav-link"><spring:message code="navbar.my.cars"></spring:message></a>
          </li>
          <li class="nav-item">
            <a href="/profile" class="nav-link"><spring:message code="navbar.my.profile"/></a>
          </li>
        </ul>
        <span class="navbar-text mr-sm-2">
          ${pageContext.request.userPrincipal.name}
        </span>
        <form class="form-inline">
          <button class="btn btn-dark " type="submit"><spring:message code="navbar.button.logout"/></button>
        </form>
      </div>
    </nav>
