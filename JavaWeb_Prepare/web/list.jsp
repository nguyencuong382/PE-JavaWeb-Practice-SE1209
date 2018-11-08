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
            <table border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Pass word</th>
                        <th>Role</th>
                        <th>Features</th>
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
                                <ul>
                                    <c:forEach var="role" items="${user.roles}">
                                        <li>${role.roleName}</li>
                                        </c:forEach>
                                </ul>

                            </td>

                            <td>
                                <ul>
                                    <c:forEach var="feature" items="${user.features}">
                                        <li>${feature.url}</li>
                                        </c:forEach>
                                </ul>

                            </td>
                            <td>

                                <input type="checkbox" ${user.admin ? 'checked' : ''}/>
                                <c:if test="${user.admin}">
                                    <p>Admin</p>
                                </c:if>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${not empty users}">
            <table border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Pass word</th>
                        <th>Role</th>
                        <th>Features</th>
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
                                <ul>
                                    <c:forEach var="role" items="${user.roles}">
                                        <li>${role.roleName} (${role.roleId})
                                            <ul>
                                                <c:forEach var="feature" items="${role.features}">
                                                    <li>${feature.url} (${feature.featureId})</li>
                                                </c:forEach>

                                            </ul>
                                        </li>
                                        </c:forEach>
                                </ul>

                            </td>

                            <td>
                                <ul>
                                    <c:forEach var="feature" items="${user.features}">
                                        <li>${feature.url}</li>
                                        </c:forEach>
                                </ul>

                            </td>
                            <td>

                                <input type="checkbox" ${user.admin ? 'checked' : ''}/>
                                <c:if test="${user.admin}">
                                    <p>Admin</p>
                                </c:if>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${not empty currentUser}">
            <table border="1" cellspacing="0">
                <tr>
                    <th>Role Id</th>
                    <th>Role Name</th>
                    <th>Features</th>
                </tr>

                <c:forEach var="role" items="${user.roles}">
                    <tr>
                        <td>${role.roleId}</td>
                        <td>${role.roleName}</td>
                        <td>
                            <ul>
                                <c:forEach var="feature" items="${role.features}">
                                    <c:url value="${feature.url}" var="url">
                                        <%--<c:param name="trainCode" value="${trainStop.trainCode}"/>--%>
                                    </c:url>
                                    <li>
                                        <a href="${url}">
                                            ${feature.url}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

    </body>
</html>
