<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="${rc.locale}" ng-app="indexApp">
<head>

    <meta charset="utf-8">
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>

    <title>${param.pageTitle} - <spring:message code="label.app.name"/></title>
    
    <%--AngularJS--%>
    <script type="text/javascript" src="<c:url value="/static/js/angular-1.5/angular.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/js/angular-1.5/angular-route.min.js"/>"></script>
    
    <%--jQuery--%>
    <script type="text/javascript" src="<c:url value="/static/js/jquery-1.11.1/jquery.min.js"/>"></script>
    
    <%--Project realated--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/main/css/module.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/user/css/module.css"/>"/>
    <script type="text/javascript">
  		//setting contextPath as a global js veriable
		contextPath =  '${pageContext.request.contextPath}'; 
	</script>
    <script type="text/javascript" src="<c:url value="/static/main/js/module.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/user/js/module.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/static/main/js/module.js"/>"></script>


    <script type="text/javascript">
        loginUrl = "<c:url value="/e/auth/login?lang=en"/>";
        <jsp:include page="labels.jsp"/>
    </script>
    
    
    
</head>
<body>
<sec:authentication property="principal" var="principal"/>
<div style="background-color: yellow; font-size: 16pt">
    ${param.pageTitle}
</div>

