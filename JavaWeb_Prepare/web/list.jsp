<%-- 
    Document   : list
    Created on : Nov 1, 2018, 8:33:38 PM
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
        <c:if test="${not empty users}">
            <table border="0" cellspacing="1">
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Pass word</th>
                        <th>is Admin</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>
                                ${user.userName}</td>
                            <td>${user.passWord}</td>
                            <td>
                                <c:forEach var="role" items="${user.roles}">
                                    <c:if test="${role.roleName == 'admin'}">
                                        <p>Admin</p>
                                    </c:if>
                                </c:forEach>
                                
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
