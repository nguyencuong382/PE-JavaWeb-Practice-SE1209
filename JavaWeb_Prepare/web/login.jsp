<%-- 
    Document   : login.jsp
    Created on : Nov 8, 2018, 8:33:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="/JavaWeb_Prepare/login" method="POST">
            
            <p>Username</p>
            <input type="text" name="userName">
            <p>Pass</p>
            <input type="text" name="password">
            <input type="submit" value="Login">
        </form>
        
    </body>
</html>
