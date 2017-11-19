<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Shuxin
  Date: 2017/11/18
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Client</title>
</head>
<body>
<h1>Delete Client</h1>
<p>You are about to delete the client ${client.client_name} :  Are you sure?</p>
<c:if test="${error}">
    <c:choose>
        <c:when test="${count eq 1}">
            <script>
            alert("Cannot delete! " + ${count} + " person in this company");
            </script>
        </c:when>
        <c:otherwise>
            <script>
            alert("Cannot delete! " + ${count} + " people in this company");
            </script>
        </c:otherwise>
    </c:choose>
</c:if>
<form action="${pageContext.request.contextPath}/client/delete" method="post">
    <input type="hidden" name="clientId" value="${client.id}"/>
    <input type="submit" name="command" value="Cancel"/>
    <input type="submit" name="command" value="Delete"/>
</form>
</body>
</html>
