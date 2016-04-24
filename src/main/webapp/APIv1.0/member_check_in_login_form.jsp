<%-- 
    Document   : member_check_in_login_form
    Created on : 25 Jul, 2015, 6:54:29 PM
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
        <form action="member_check_in_login_action.jsp" method="post">
            <input type="text" name="mem_id" id="mem_id" placeholder="mem_id" />
            <input type="text" name="kiosk_id" id="kiosk_id" placeholder="kiosk_id" />
            <input type="text" name="status" id="status" placeholder="status" />

            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
