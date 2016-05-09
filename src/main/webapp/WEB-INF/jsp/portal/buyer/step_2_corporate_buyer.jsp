<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:message code="buyer.new_buyer.step_2.corporate_buyer.h1" var="h1" scope="page"/>
<spring:message code="buyer.new_buyer.step_2.corporate_buyer.h2" var="h2" scope="page"/>
<spring:message code="buyer.new_buyer.step_2.buyer_category.corporate_buyer" var="buyer_category" scope="page"/>

<div ng-controller="StepTwoCtrlCorporateBuyer">
    <h1>${h1}</h1>
    <h3>${h2}</h3>

    <table>
        <tr>
            <td align="center">
                <span>${buyer_category}</span>
                <table>
                    <tbody>
                    <tr ng-repeat="fData in corporateBuyerFormData">
                        <td>{{fData.text}}</td>
                        <td ng-if="fData.fieldType == 'text' || fData.fieldType == 'number' || fData.fieldType == 'email' || fData.fieldType =='checkbox' || fData.fieldType == 'password'">
                            <input type="{{fData.fieldType}}" ng-model="submitData[fData.key]"/>
                        </td>
                        <td ng-if="fData.fieldType == 'select'">
                            <select ng-model="submitData['country']"
                                    ng-options="item as item[1] for item in countries"></select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" ng-click="formSubmit()">Submit</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>

        </tr>

    </table>
</div>