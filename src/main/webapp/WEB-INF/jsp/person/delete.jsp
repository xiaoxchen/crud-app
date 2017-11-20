<%-- 
    Document   : delete
    Created on : Apr 22, 2011, 3:55:55 PM
    Author     : FMilens
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="/resources/css/avatar.css">
        <link rel="stylesheet" href="/resources/css/business-casual.css" >
        <title>Delete Person</title>
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
        <div class="bg-faded p-4 my-4 text-center">
            <hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0">Delete Person</h2>
            <hr class="divider">
            <p>You are about to delete the person <strong>${person.firstName} ${person.lastName}</strong>:  Are you sure?</p>
            <form action="${pageContext.request.contextPath}/person/delete" method="post">
                <input type="hidden" name="personId" value="${person.personId}"/>
                <input type="submit" name="command" value="Cancel"/>
                <input type="submit" name="command" value="Delete"/>
            </form>
        </div>
    </body>
</html>
