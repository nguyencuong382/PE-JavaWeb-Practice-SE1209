<%-- 
    Document   : AdminPage.jsp
    Created on : Nov 10, 2018, 1:08:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome Admin Panel</h1>
        <c:if test="${not empty sessionScope.user}">
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </c:if>

        <ul>
            <li><a href="#">User Management</a></li>
            <li><a href="#">Contact Management</a></li>
        </ul>

    </body>
</html>
