<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="seller.new_seller.title" var="title" scope="page"/>
<jsp:include page="../include/header.jsp">
	<jsp:param name="pageTitle" value="${title}"/>
</jsp:include>
<jsp:include page="../include/menu.jsp" />

<div align="center" ng-view="" ng-controller="NewSellerCtrl">
</div>

<script type="text/javascript" src="<c:url value="/static/main/js/portal/seller/new-seller.js"/>"></script>

<jsp:include page="../include/footer.jsp" />