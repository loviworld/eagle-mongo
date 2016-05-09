<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="buyer.new_buyer.step_1.h1" var="h1" scope="page"/>
<spring:message code="buyer.new_buyer.step_1.h2" var="h2" scope="page"/>
<spring:message code="buyer.new_buyer.step_1.buyer_category" var="buyer_category" scope="page"/>
<spring:message code="seller.new_seller.step_1.deals" var="deals" scope="page"/>
<spring:message code="seller.new_seller.step_1.business_type" var="business_type" scope="page"/>

<div ng-controller="StepOneCtrl">
	<h1>${h1}</h1>
<h3>${h2}</h3>

<table>
	<tr>
		<td align="center">
			<span>${buyer_category}</span>
			<table>
				<tbody>
					<tr>
						<td ng-repeat="buyer_type in buyer_types">
							<input type="button" id="{{buyer_type.key}}"
								   ng-click="toggleBuyerType(buyer_type.key,$index)" value="{{buyer_type.text}}"
								   style="{{changeCSSBuyerType(buyer_type.key,$index)}}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	
	</tr>
	
</table>


<a href="#/step-2">next</a>
</div>