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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<form action="${pageContext.request.contextPath}/client/edit" method="POST">
    <input type="hidden" name="id" value="${client.id}"/>
    <br/>
    <label for="client_name">Client Name:</label>
    <input type="text" name="client_name" value="${client.client_name}"/>
    <br/>
    <label for="website_url">Website URL:</label>
    <input type="text" name="website_url" value="${client.website_url}"/>
    <br/>
    <label for="phone_number">Phone Number:</label>
    <input type="text" name="phone_number" value="${client.phone_number}"/>
    <br/>
    <label for="line_1">Street Address1:</label>
    <input type="text" name="line_1" value="${client.line_1}"/>
    <br/>
    <label for="line_2">Street Address2:</label>
    <input type="text" name="line_2" value="${client.line_2}"/>
    <br/>
    <label for="line_3">Street Address3:</label>
    <input type="text" name="line_3" value="${client.line_3}"/>
    <br/>
    <label for="city">City:</label>
    <input type="text" name="city" value="${client.city}"/>
    <br/>
    <label for="state">State:</label>
    <input type="text" name="state" value="${client.state}"/>
    <br/>
    <label for="zipcode">Zip Code:</label>
    <input type="text" name="zipcode" value="${client.zipcode}"/>
    <br/>
    <label for="client_id">Client ID:</label>
        <c:forEach var='item' items='${people}'>
            <input type="checkbox" name="checkbox" value="<c:out value='${item.key}'/>" ${item.value.bool eq true ? 'checked' : ''}>
                <c:out value='${item.value.str}'/>
            </input>
        </c:forEach>
    <br/>
    <input type="submit" name="Submit" value="Submit"/>
</form>
</body>
</html>

