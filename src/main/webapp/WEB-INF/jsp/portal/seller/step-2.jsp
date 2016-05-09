<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="seller.new_seller.step_2.h1" var="h1" scope="page"/>

<div ng-controller="StepTwoCtrl">
<h1>${h1}</h1>
<form name="emailVerifyForm" id="emailVerifyForm">

<style type="text/css">
	input.ng-invalid ng-touched ng-not-empty ng-dirty ng-invalid-email ng-valid-required {background-color: red;}
</style>

<table>
	<tr>
		<td align="center">
			<table>
				<tbody>
					<tr>
						<td>
							<input type="email" ng-model="email" name="email" required="required" />
						</td>
						<td>
							<input type="button" value="GO" ng-click="verifyEmail($event,emailVerifyForm)" ng-disabled="emailVerifyForm.$invalid"/>
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	</tr>
</table>
</form>
<a href="#/step-1">back</a>
</div>
