<%--
    Document   : list
    Created on : Apr 22, 2011, 2:25:22 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
        <link href="/resources/css/business-casual.css" rel="stylesheet">

        <title>Person Listing</title>
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
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item px-lg-4">
                        <a class="nav-link text-uppercase text-expanded" href="/client/list">Client</a>
                    </li>
                    <li class="nav-item px-lg-4">
                        <a class="nav-link text-uppercase text-expanded" href="/about">about</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="table-users">
        <div class="header">Person Listing</div>
        <a href="${pageContext.request.contextPath}/person/create ">Create New Person</a>

        <c:choose>
            <c:when test="${fn:length(persons) gt 0}">
                <table>
                    <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email Address</th>
                        <th>Client</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${persons}" var="person">
                        <tr>
                            <td>${person.firstName}</td>
                            <td>${person.lastName}</td>
                            <td>${person.emailAddress}</td>
                            <td>${person.clientName}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit Person</a>
                                <a href="${pageContext.request.contextPath}/person/delete/${person.personId}">Delete Person</a>
                        </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>No results found.</p >
            </c:otherwise>
        </c:choose>

    </div>
    </body>
</html>
