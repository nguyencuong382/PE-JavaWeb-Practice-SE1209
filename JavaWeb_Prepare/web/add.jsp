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
        <p>Select User</p>
        <form action="/JavaWeb_Prepare/UserRole/Add" method="POST">
            <select name="userName" id="" onchange="this.form.submit()">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
        </form>
    </body>
</html>
