<%-- 
    Document   : create
    Created on : Apr 22, 2011, 3:24:13 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="/resources/js/avatar.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.js"></script>
        <!--Validation -->
        <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <!--icon CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="/resources/css/avatar.css">
        <link rel="stylesheet" type="text/css" href="/resources/css/tableStyle.css">
        <link rel="stylesheet" href="/resources/css/business-casual.css" >
        <link rel="stylesheet" href="/resources/css/formStyle.css">

        <title>Create Person</title>
    </head>
    <body class="bgpic">
        <div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Business Casual</div>
        <div class="tagline-lower text-center text-expanded text-uppercase text-color mb-5 d-none d-lg-block">480 Main Street | Malden, MA 90210</div>
        <!-- Navgation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-faded py-lg-4">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item active px-lg-4">
                            <a class="nav-link text-uppercase text-expanded" href="/person/list">Person
                            </a>
                        </li>
                        <li class="nav-item px-lg-4">
                            <a class="nav-link text-uppercase text-expanded" href="/client/list">Client
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item px-lg-4">
                            <a class="nav-link text-uppercase text-expanded" href="/about">about</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <c:if test="${fn:length(errors) gt 0}">
                <p>Please correct the following errors in your submission:</p>
                <ul>
                    <c:forEach items="${errors}" var="error">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
        </c:if>
        <form id="validationForm" action="${pageContext.request.contextPath}/person/create" method="POST">
            <h1>Create Person</h1>
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
                        <input type="text" name="zipCode" value="${person.zipCode}" data-rule-zipcodeUS="true"
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
            <button type="submit" class="bouton-contact">Submit</button>
        </form>
        <script type="text/javascript">
            $('#validationForm').validate();
        </script>
    </body>
</html>
