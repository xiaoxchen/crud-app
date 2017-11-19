<%-- 
    Document   : create
    Created on : Apr 22, 2011, 3:24:13 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Person</title>
    </head>
    <body>
        <h1>Create Person</h1>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>
        <form action="${pageContext.request.contextPath}/person/create" method="POST">
            <br/>
            <label for="firstName">First Name:</label>
            <input type="text" name="firstName" value="${person.firstName}"/>
            <br/>
            <label for="lastName">Last Name:</label>
            <input type="text" name="lastName" value="${person.lastName}"/>
            <br/>
            <label for="emailAddress">Email Address:</label>
            <input type="text" name="emailAddress" value="${person.emailAddress}"/>
            <br/>
            <label for="streetAddress">Street Address:</label>
            <input type="text" name="streetAddress" value="${person.streetAddress}"/>
            <br/>
            <label for="city">City:</label>
            <input type="text" name="city" value="${person.city}"/>
            <br/>
            <label for="state">State:</label>
            <input type="text" name="state" value="${person.state}"/>
            <br/>
            <label for="zipCode">Zip Code:</label>
            <input type="text" name="zipCode" value="${person.zipCode}"/>
            <br/>
            <label for="client_id">Client ID:</label>
            <select name="client_id">
                <c:forEach var='item' items='${clientList}'>
                    <option value="<c:out value='${item.key}'/>"><c:out value='${item.value}'/></option>
                </c:forEach>
            </select>
            <br/>
            <input type="submit" name="Submit" value="Submit"/>
        </form>
    </body>
</html>
