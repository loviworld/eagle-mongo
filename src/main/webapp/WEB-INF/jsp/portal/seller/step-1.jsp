<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="seller.new_seller.step_1.h1" var="h1" scope="page"/>
<spring:message code="seller.new_seller.step_1.h2" var="h2" scope="page"/>
<spring:message code="seller.new_seller.step_1.business_category" var="business_category" scope="page"/>
<spring:message code="seller.new_seller.step_1.deals" var="deals" scope="page"/>
<spring:message code="seller.new_seller.step_1.business_type" var="business_type" scope="page"/>

<div ng-controller="StepOneCtrl">
<h1>${h1}</h1>
<h3>${h2}</h3>

<table>
	<tr>
		<td align="center">
			<span>${business_category}</span>
			<table>
				<tbody>
					<tr>
						<td ng-repeat="business_cat in business_categories">
							<input type="button" id="{{business_cat.key}}" ng-click="toggleBusinessCategory(business_cat.key,$index)" value="{{business_cat.text}}" style="{{changeCSSBusinessCategory(business_cat.key,$index)}}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	
	</tr>


	<tr>
		<td align="center">
			<span>${deals}</span>
			<table>
				<tbody >
					<tr>
						<td ng-repeat="deal in deals">
							<input type="button" id="{{deal.key}}" ng-click="toggleDeal(deal.key,$index)" value="{{deal.text}}" style="{{changeCSSDeal(deal.key,$index)}}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	
	</tr>
	
	<tr>
		<td align="center">
			<span>${business_type}</span>
			<table>
				<tbody >
					<tr>
						<td ng-repeat="bt in business_types">
							<input type="button" id="{{bt.key}}" ng-click="toggleBusinessTypes(bt.key,$index)" value="{{bt.text}}" style="{{changeCSSSelectedBusinessType(bt.key)}}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	
	</tr>
	
</table>


<a href="#/step-2">next</a>
</div>