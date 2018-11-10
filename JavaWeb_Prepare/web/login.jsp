<%-- 
    Document   : login.jsp
    Created on : Nov 8, 2018, 8:33:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        
        <h1>Login Page</h1>
        
        <p class="error">${sessionScope.error}</p>
        
        <form action="${pageContext.request.contextPath}/login" method="POST">
            
            <table border="1">
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td>
                            <input type="text" name="userName">
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="text" name="password"></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" value="Login"></td>
                        <td><input type="reset" value="Cancel"></td>
                    </tr>
                </tbody>
            </table>
        </form>
        
    </body>
</html>
