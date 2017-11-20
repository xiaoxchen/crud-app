<%--
  Created by IntelliJ IDEA.
  User: Shuxin
  Date: 2017/11/18
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="/resources/css/tableStyle.css">
    <link href="/resources/css/business-casual.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        label, input { display:block; }
        input.text { margin-bottom:12px; width:95%; padding: .4em; }
        fieldset { padding:0; border:0; margin-top:25px; }
        h1 { font-size: 1.2em; margin: .6em 0; }
        div#users-contain { width: 350px; margin: 20px 0; }
        div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
        div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
        .ui-dialog .ui-state-error { padding: .3em; }
        .validateTips { border: 1px solid transparent; padding: 0.3em; }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Person Listing</title>
    <script>
        $( function() {
            var dialog, form;

            dialog = $( "#dialog-form" ).dialog({
                autoOpen: false,
                height: 400,
                width: 350,
                modal: true,
                buttons: {
                    Cancel: function() {
                        dialog.dialog( "close" );
                    }
                },
                close: function() {
                    $('.test').text("");
                }
            });

            form = dialog.find( "form" ).on( "submit", function( event ) {
                event.preventDefault();
            });

            $('.details').click(function(){
                var $this = $(this);
                var para1 = $this.attr('data-para1');
                $('.test').text("");
                for (i = 0; i < para1.length; ++i){
                    $('.test').append(para1[i]);
                }
                dialog.dialog("open");
            });
        } );
    </script>
</head>
<body class="bgpic">
<div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Business Casual</div>
<div class="tagline-lower text-center text-expanded text-uppercase text-color mb-5 d-none d-lg-block">480 Main Street |
    Malden, MA 90210
</div>
<!-- Navgation -->
<nav class="navbar navbar-expand-lg navbar-light bg-faded py-lg-4">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item px-lg-4">
                    <a class="nav-link text-uppercase text-expanded" href="/person/list">Person
                    </a>
                </li>
                <li class="nav-item active px-lg-4">
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
<div class="table-users">
    <div class="header">Person Listing</div>
    <a href="${pageContext.request.contextPath}/client/create">Create New Client</a>
    <c:choose>
        <c:when test="${fn:length(clients) gt 0}">
            <table>
                <thead>
                <tr>
                    <th>Client Name</th>
                    <th>Website</th>
                    <th>Phone</th>
                    <th>Contacts</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${clients}" var="client">
                    <tr>
                        <td>${client.client_name}</td>
                        <td>${client.website_url}</td>
                        <td>${client.phone_number}</td>
                        <td><button class="details" data-para1="${employeeName[client.id.intValue()]}">
                                ${employee[client.id.intValue()]}</button></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/client/edit/${client.id}">Edit Client</a>
                            <a href="${pageContext.request.contextPath}/client/delete/${client.id}">Delete Client</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>No results found.</p>
        </c:otherwise>
    </c:choose>
</div>
<div id="dialog-form" title="Create new user">
    <p><strong>Employee Name:</strong></p>
    <p class="test"></p>
</div>
</body>
</html>

