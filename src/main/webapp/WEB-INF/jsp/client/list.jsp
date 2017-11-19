<%--
  Created by IntelliJ IDEA.
  User: Shuxin
  Date: 2017/11/18
  Time: 17:36
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
    <title>Client Listing</title>
</head>
<body>
<h1>Client Listing</h1>
<%--<p><a href="${pageContext.request.contextPath}/person/create">Create New Person</a></p>--%>
<c:choose>
    <c:when test="${fn:length(clients) gt 0}">
        <table>
            <thead>
            <tr>
                <th>Client Name</th>
                <th>Website</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${clients}" var="client">
                <tr>
                    <td>${client.client_name}</td>
                    <td>${client.website_url}</td>
                    <td>${client.phone_number}</td>
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
</body>
</html>

