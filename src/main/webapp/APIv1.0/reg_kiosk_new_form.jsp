<%-- 
    Document   : reg_kiosk_new_form
    Created on : 25 Jul, 2015, 7:20:15 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="reg_kiosk_new_action.jsp" method="post">
            <input type="text" name="ip" id="ip" placeholder="ip" />
            <input type="text" name="status" id="status" placeholder="status" />

            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
