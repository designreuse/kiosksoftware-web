<%-- 
    Document   : user_login_api_form
    Created on : 2 Jul, 2015, 11:38:26 AM
    Author     : sukanya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="user_login_api.jsp" class="form-control" method="post">
            <input name="user_name" id="user_name" type="text" placeholder="user_name"/>
            <input name="password" id="password" type="password" placeholder="password"/>
            <input type="submit" value="submit"/>
            
        </form>
            
    </body>
</html>
