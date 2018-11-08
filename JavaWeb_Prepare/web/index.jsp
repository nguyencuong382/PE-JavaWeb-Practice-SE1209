<%-- 
    Document   : index
    Created on : Nov 9, 2018, 12:46:42 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a {
                margin: 10px;
            }
        </style>
    </head>
    <body>


        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/list">List</a>
        
        <c:if test="${empty sessionScope.user}">
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </c:if>

        <c:if test="${not empty sessionScope.user}">
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </c:if>
        
        
        <p></p>

    </body>
</html>
