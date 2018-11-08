<%-- 
    Document   : edit
    Created on : Nov 9, 2018, 12:11:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/edit" method="POST">

            <table border="0" cellspacing="1">

                <tbody>
                    <tr>
                        <td>
                            Select User
                        </td>
                        <td>
                            <select name="userName" id="" onchange="this.form.submit()">
                                <c:forEach var="user" items="${users}">
                                    <option value="${user.userName}" ${user.userName == param.userName ? 'selected' : ''}>${user.userName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Select editable role
                        </td>
                        <td>
                            <select name="oldRoleId">
                                <c:forEach var="role" items="${rolesAdded}">
                                    <option value="${role.roleId}">${role.roleName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            New Role
                        </td>

                        <td>
                            <select name="newRoleId">
                                <c:forEach var="role" items="${rolesAvailable}">
                                    <option value="${role.roleId}">${role.roleName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>

            <input type="submit" value="Save" name="save">
            <input type="submit" value="Delete" name="delete">

        </form>
    </body>
</html>
