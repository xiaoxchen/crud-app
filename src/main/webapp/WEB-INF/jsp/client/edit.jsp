<%--
  Created by IntelliJ IDEA.
  User: Shuxin
  Date: 2017/11/18
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/formStyle.css">
    <title>Edit Client</title>
</head>
<body>
<h1>Edit Client</h1>
<c:if test="${fn:length(errors) gt 0}">
    <p>Please correct the following errors in your submission:</p>
    <ul>
        <c:forEach items="${errors}" var="error">
            <li>${error}</li>
        </c:forEach>
    </ul>
</c:if>
<form id="validationForm" action="${pageContext.request.contextPath}/client/edit" method="POST">
    <h1>Edit Client</h1>
    <input type="hidden" name="id" value="${client.id}"/>
    <%--left--%>
    <div class="contentform">
        <div class="leftcontact">
            <div class="form-group">
                <p for="client_name">Client Name:<span>*</span></p>
                <span class="icon-case"><i class="fa fa-male" style="line-height: 40px"></i></span>
                <input type="text" name="client_name" value="${client.client_name}" data-rule-required="true" data-rule-maxlength="50"
                       data-msg-required=" Required."/>
            </div>

            <div class="form-group">
                <p for="website_url">Website URL:<span>*</span></p>
                <span class="icon-case"><i class="icon-case fa fa-user" style="line-height: 40px"></i></span>
                <input type="text" name="website_url" value="${client.website_url}" data-rule-required="true"  data-rule-url="true"
                       data-msg-required=" Required."/>
            </div>

            <div class="form-group">
                <p for="phone_number">Phone Number:<span>*</span></p>
                <span class="icon-case"><i class="fa fa-envelope-o" style="line-height: 40px"></i></span>
                <input type="text" name="phone_number" value="${client.phone_number}" data-rule-digits="ture" data-rule-required="true"
                       data-msg-required=" Required."/>
            </div>

            <div class="form-group">
                <p for="line_1">Street Address1:<span>*</span></p>
                <span class="icon-case"><i class="fa fa-location-arrow" style="line-height: 40px"></i></span>
                <input type="text" name="line_1" value="${client.line_1}" data-rule-required="true" data-msg-required=" Required."/>
            </div>
            <div class="form-group">
                <p for="line_2">Street Address2:</p>
                <span class="icon-case"><i class="fa fa-building-o" style="line-height: 40px"></i></span>
                <input type="text" name="line_2" value="${client.line_2}"/>
            </div>

            <div class="form-group">
                <p for="line_3">Street Address3:</p>
                <span class="icon-case"><i class="fa fa-building" style="line-height: 40px"></i></span>
                <input type="text" name="line_3" value="${client.line_3}"/>
            </div>
        </div>
        <%--right--%>
        <div class="rightcontact">

            <div class="form-group">
                <p for="city">City:<span>*</span></p>
                <span class="icon-case"><i class="fa fa-map-marker" style="line-height: 40px"></i></span>
                <input type="text" name="city" value="${client.city}"
                       data-rule-required="true" data-msg-required=" Required."/>
            </div>
            <div class="form-group">
                <p for="state">State:<span>*</span></p>
                <span class="icon-case"><i class="fa fa-map-marker" style="line-height: 40px"></i></span>
                <input type="text" name="state" value="${client.state}" data-rule-required="true" data-rule-rangelength="2,2"
                       data-msg-required=" Required."/>
            </div>
            <div class="form-group">
                <p for="zipcode">Zip Code:<span>*</span></p>
                <span class="icon-case"><i class="fa fa-map-marker" style="line-height: 40px"></i></span>
                <input type="text" name="zipcode" value="${client.zipcode}" data-rule-digits="true" data-rule-rangelength="5,5"
                       data-rule-required="true" data-msg-required=" Required."/>
            </div>
            <div class="form-group">
                <p for="client_id">Contacts:</p>
                <span class="icon-case"><i class="fa fa-home" style="line-height: 40px"></i></span>
                <c:forEach var='item' items='${people}'>
                    <input class="checkbox" type="checkbox" name="checkbox" value="<c:out value='${item.key}'/>" ${item.value.bool eq true ? 'checked' : ''}>
                    <c:out value='${item.value.str}'/>
                    </input>
                </c:forEach>
            </div>
        </div>

    </div>
    <button type="submit" class="bouton-contact">Submit</button>
</form>
<script type="text/javascript">
    $('#validationForm').validate();
</script>
</body>
</html>

