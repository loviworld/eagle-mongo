<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="seller.new_seller.step_4.title" var="title" scope="page"/>
<spring:message code="seller.new_seller.step_4.business_name" var="business_name" scope="page"/>
<spring:message code="seller.new_seller.step_4.business_address_line_1" var="business_address_line_1" scope="page"/>
<spring:message code="seller.new_seller.step_4.business_address_line_2" var="business_address_line_2" scope="page"/>
<spring:message code="seller.new_seller.step_4.city" var="city" scope="page"/>
<spring:message code="seller.new_seller.step_4.state" var="state" scope="page"/>
<spring:message code="seller.new_seller.step_4.postal_code" var="postal_code" scope="page"/>
<spring:message code="seller.new_seller.step_4.country" var="country" scope="page"/>
<spring:message code="seller.new_seller.step_4.phone" var="phone" scope="page"/>
<spring:message code="seller.new_seller.step_4.fax" var="fax" scope="page"/>
<spring:message code="seller.new_seller.step_4.business_email" var="business_email" scope="page"/>
<spring:message code="seller.new_seller.step_4.business_url" var="business_url" scope="page"/>
<spring:message code="seller.new_seller.step_4.payment_policy" var="payment_policy" scope="page"/>
<spring:message code="seller.new_seller.step_4.about" var="about" scope="page"/>


<div ng-controller="StepFourCtrl">
<h1>${title}</h1>
<style type="text/css">
	input.ng-invalid ng-touched ng-not-empty ng-dirty ng-invalid-email ng-valid-required {background-color: red;}
</style>

<form name="stepFourForm" id="stepFourForm">
<input type="hidden" ng-model="id" name="id" value="{{getId()}}" />

<table>
	<tr>
		<td align="center">
			<table>
				<tbody>
					
					<tr>
						<td>
							${business_name}
						</td>
						<td>
							<input type="text" ng-model="bizName" name="bizName" required="required" />
						</td>
						<td>
							<span></span>
						</td>
						<td>
							<span></span>
						</td>
					</tr>
					
					<tr>
						<td>
							${business_address_line_1}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.address1" name="contactInfo.address1" required="required" />
						</td>
						<td>
							${business_address_line_2}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.address2" name="contactInfo.address2" required="required" />
						</td>
					</tr>
					
					<tr>
						<td>
							${city}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.city" name="contactInfo.city" required="required" />
						</td>
						<td>
							${state}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.stateProvince" name="contactInfo.stateProvince" required="required" />
						</td>
					</tr>
					
					<tr>
						<td>
							${postal_code}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.postalCode" name="contactInfo.postalCode" required="required" />
						</td>
						<td>
							${country}
						</td>
						<td>
							<!--  <input type="text" ng-model="contactInfo.country.name" name="contactInfo.country.name" required="required" />-->
							<select ng-model="contactInfo.country.id" name="contactInfo.country.id" required="required">
								<option value="" disabled="disabled" selected="selected">select a country</option>
								<option ng-repeat="country in countriesArray" value="{{country[0]}}">
									{{country[1]}}
								</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>
							${phone}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.phone" name="contactInfo.phone" required="required" />
						</td>
						<td>
							${fax}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.fax" name="contactInfo.fax" required="required" />
						</td>
					</tr>
					
					<tr>
						<td>
							${business_email}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.email" name="contactInfo.email" required="required" />
						</td>
						<td>
							${business_url}
						</td>
						<td>
							<input type="text" ng-model="contactInfo.websiteUrl" name="contactInfo.websiteUrl" required="required" />
						</td>
					</tr>
					
					<tr>
						<td>
							${payment_policy}
						</td>
						<td>
							<input type="text" ng-model="payment_policy" required="required" name=""/>
						</td>
						<td>
							<span></span>
						</td>
						<td>
							<span></span>
						</td>
					</tr>
					
					<tr>
						<td>
							${about}
						</td>
						<td>
							<textarea rows="4" cols="" required="required" ng-model="about" name=""></textarea>
						</td>
						<td>
							<span></span>
						</td>
						<td>
							<span></span>
						</td>
					</tr>
					
					<tr>
						<td>
							<span></span>
						</td>
						<td>
							<span></span>
						</td>
						<td>
							<span></span>
						</td>
						<td>
							<input type="button" value="Save" ng-click="submitData($event,emailVerifyForm)" ng-disabled="stepFourForm.$invalid"/>
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
