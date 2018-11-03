<%-- 
    Document   : add
    Created on : Nov 2, 2018, 9:25:24 PM
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

        <form action="/JavaWeb_Prepare/UserRole/Add" method="POST">
            <p>Select User
                <select name="userName" id="" onchange="this.form.submit()">
                    <c:forEach var="user" items="${users}">
                        <option value="${user.userName}" ${user.userName == param.userName ? 'selected' : ''}>${user.userName}</option>
                    </c:forEach>
                </select>
            </p>

            <p>Select available role
                <select name="roleId">
                    <c:forEach var="role" items="${rolesAvailable}">
                        <option value="${role.roleId}">${role.roleName}</option>
                    </c:forEach>
                </select>
            </p>
            
            <input type="submit" value="Save" name="save">
        </form>



        <table border="1" cellspacing="0">
            <thead>
                <tr>
                    <th>Role ID</th>
                    <th>Role Name</th>
                    <th>Features</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="role" items="${rolesAdded}">
                    <tr>
                        <td>${role.roleId}</td>
                        <td>${role.roleName}</td>
                        <td>
                            <ul>
                                <c:forEach var="feature" items="${role.features}">
                                    <li>${feature.url}</li>
                                    </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
