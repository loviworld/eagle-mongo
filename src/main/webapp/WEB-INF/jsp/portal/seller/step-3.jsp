<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="seller.new_seller.step_3.title" var="title" scope="page"/>
<spring:message code="seller.new_seller.step_3.email_lbl" var="email_lbl" scope="page"/>
<spring:message code="seller.new_seller.step_3.password_lbl" var="password_lbl" scope="page"/>
<spring:message code="seller.new_seller.step_3.retype_password_lbl" var="retype_password_lbl" scope="page"/>
<spring:message code="seller.new_seller.step_3.retype_password_lbl_error" var="retype_password_lbl_error" scope="page"/>

<div ng-controller="StepThreeCtrl">
<h1>${title}</h1>
<style type="text/css">
	input.ng-invalid ng-touched ng-not-empty ng-dirty ng-invalid-email ng-valid-required {background-color: red;}
</style>

<form name="stepThreeForm" id="stepThreeForm">
<table>
	<tr>
		<td align="center">
			<table>
				<tbody>
					<tr>
						<td>
							${email_lbl}
						</td>
						<td>
							<input type="email" ng-model="email" required="required" readonly="readonly"/>
						</td>
						<td>
							<span></span>
						</td>
					</tr>
					
					<tr>
						<td>
							${password_lbl}
						</td>
						<td>
							<input type="password" ng-model="password" required="required"/>
						</td>
						<td>
							<span></span>
						</td>
					</tr>
					
					<tr>
						<td>
							${retype_password_lbl}
						</td>
						<td>
							<input type="password" ng-model="reTypePassword" ng-change="checkReTypePassword($event)" required="required"/>
						</td>
						<td>
							<span ng-show="reTypePasswordNotMatch" style="color: red;">${retype_password_lbl_error}</span>
						</td>
					</tr>
					
					<tr>
						<td>
						</td>
						<td>
							<input type="button" value="GO" ng-click="submitData($event,emailVerifyForm)" ng-disabled="stepThreeForm.$invalid"/>
						</td>
					</tr>
					
				</tbody>
			</table>
		</td>
	</tr>
</table>
</form>
<a href="#/step-2">back</a>
<a href="#/step-4">next</a>
</div>
