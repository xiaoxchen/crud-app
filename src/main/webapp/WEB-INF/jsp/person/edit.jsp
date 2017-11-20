<%-- 
    Document   : edit
    Created on : Apr 22, 2011, 3:04:46 PM
    Author     : FMilens
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
        <title>Edit Person</title>
    </head>
    <body>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>

        <form id="validationForm" action="${pageContext.request.contextPath}/person/edit" method="POST">
            <h1>Edit Person</h1>
            <input type="hidden" name="personId" value="${person.personId}"/>
            <%--left--%>
            <div class="contentform">
                <div class="leftcontact">
                <div class="form-group">
                    <p for="firstName">First Name<span>*</span></p>
                    <span class="icon-case"><i class="fa fa-male" style="line-height: 40px"></i></span>
                    <input type="text" name="firstName" value="${person.firstName}" data-rule-required="true" data-rule-maxlength="50"
                           data-msg-required=" Required."/>
                </div>

                <div class="form-group">
                    <p for="lastName">Last Name:<span>*</span></p>
                    <span class="icon-case"><i class="icon-case fa fa-user" style="line-height: 40px"></i></span>
                    <input type="text" name="lastName" value="${person.lastName}" data-rule-required="true"  data-rule-maxlength="50"
                           data-msg-required=" Required."/>
                </div>

                <div class="form-group">
                    <p for="emailAddress">Email Address:<span>*</span></p>
                    <span class="icon-case"><i class="fa fa-envelope-o" style="line-height: 40px"></i></span>
                    <input type="text" name="emailAddress" value="${person.emailAddress}" data-rule-email="ture" data-msg-required=" Required."/>
                </div>

                <div class="form-group">
                    <p for="streetAddress">Street Address:<span>*</span></p>
                    <span class="icon-case"><i class="fa fa-location-arrow" style="line-height: 40px"></i></span>
                    <input type="text" name="streetAddress" value="${person.streetAddress}" data-rule-required="true" data-msg-required=" Required."/>
                </div>
            </div>
                <%--right--%>
                <div class="rightcontact">
                    <div class="form-group">
                        <p for="city">City:<span>*</span></p>
                        <span class="icon-case"><i class="fa fa-building-o" style="line-height: 40px"></i></span>
                        <input type="text" name="city" value="${person.city}" data-rule-required="true" data-msg-required=" Required."/>
                    </div>

                    <div class="form-group">
                        <p for="state">State:<span>*</span></p>
                        <span class="icon-case"><i class="fa fa-building" style="line-height: 40px"></i></span>
                        <input type="text" name="state" value="${person.state}" data-rule-required="true" data-rule-rangelength="2,2"
                               data-msg-required=" Required."/>
                    </div>

                    <div class="form-group">
                        <p for="zipCode">Zip Code:<span>*</span></p>
                        <span class="icon-case"><i class="fa fa-map-marker" style="line-height: 40px"></i></span>
                        <input type="text" name="zipCode" value="${person.zipCode}" data-rule-digits="true" data-rule-rangelength="5,5"
                               data-rule-required="true" data-msg-required=" Required."/>
                    </div>

                    <div class="form-group">
                        <p for="client_id">Client ID:</p>
                        <span class="icon-case"><i class="fa fa-home" style="line-height: 40px"></i></span>
                        <select name="client_id">
                            <c:forEach var='item' items='${clientList}'>
                                <option value="<c:out value='${item.key}'/>"><c:out value='${item.value}'/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

            </div>
            <button type="submit" class="bouton-contact">Send</button>

        </form>
        <script type="text/javascript">
            $('#validationForm').validate();
        </script>
    </body>
</html>
