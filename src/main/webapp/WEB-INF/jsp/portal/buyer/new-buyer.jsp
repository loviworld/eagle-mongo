<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="buyer.new_buyer.title" var="title" scope="page"/>
<jsp:include page="../include/header.jsp">
    <jsp:param name="pageTitle" value="${title}"/>
</jsp:include>
<jsp:include page="../include/menu.jsp" />
<div align="center" ng-view="" ng-controller="NewBuyerCtrl">

</div>
<script type="text/javascript" src="<c:url value="/static/main/js/portal/buyer/new-buyer.js"/>"></script>

<!--<form action="new-buyer" method="post">
    <table>
        <tr>
            <td>
                <label>First Name</label>
            </td>
            <td>
                <input type="text" name="firstName">
            </td>
        </tr>
        <tr>
            <td>
                <label>Last name</label>
            </td>
            <td>
                <input type="text" name="lastName">
            </td>
        </tr>
        <tr>
            <td>
                <label>Country</label>
            </td>
            <td>
                <input type="text" name="country">
            </td>
        </tr>
        <tr>
            <td>
                <label>Address line 1</label>
            </td>
            <td>
                <input type="text" name="address1">
            </td>
        </tr>
        <tr>
            <td>
                <label>Address line 2</label>
            </td>
            <td>
                <input type="text" name="address2">
            </td>
        </tr>
        <tr>
            <td>
                <label>City</label>
            </td>
            <td>
                <input type="text" name="city">
            </td>
        </tr>
        <tr>
            <td>
                <label>postalCode</label>
            </td>
            <td>
                <input type="text" name="postalCode">
            </td>
        </tr>
        <tr>
            <td>
                <label>stateProvince</label>
            </td>
            <td>
                <input type="text" name="stateProvince">
            </td>
        </tr>
        <tr>
            <td>
                <label>phone</label>
            </td>
            <td>
                <input type="text" name="phone">
            </td>
        </tr>
        <tr>
            <td>
                <label>fax</label>
            </td>
            <td>
                <input type="text" name="fax">
            </td>
        </tr>
        <tr>
            <td>
                <label>hotline</label>
            </td>
            <td>
                <input type="text" name="hotline">
            </td>
        </tr>
        <tr>
            <td>
                <label>email</label>
            </td>
            <td>
                <input type="text" name="email">
            </td>
        </tr>
        <tr>
            <td>
                <label>websiteUrl</label>
            </td>
            <td>
                <input type="text" name="websiteUrl">
            </td>
        </tr>
        <tr>
            <td>
                <label>Receive News Letter</label>
            </td>
            <td>
                <input type="checkbox" name="receiveNewsLetter">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name="">
            </td>
        </tr>

    </table>
</form>-->
<jsp:include page="../include/footer.jsp" />