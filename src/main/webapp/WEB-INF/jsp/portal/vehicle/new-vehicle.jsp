<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="vehicle.new_vehicle.title" var="title" scope="page"/>
<jsp:include page="../include/header.jsp">
	<jsp:param name="pageTitle" value="${title}"/>
</jsp:include>
<jsp:include page="../include/menu.jsp" />

<div align="center">
	<h1>New Vehicle</h1>
	<form enctype="multipart/form-data" action="<c:url value=""/>" method="post">
		<input type="text" name="grade" />
		<input type="file" value="upload" name="fileResource" id="fileResource" onchange="previewImage()"/>
		<input type="submit" value="save" />
	</form>
</div>

<jsp:include page="../include/footer.jsp" />