<%-- 
    Document   : mem_reg_api__new_form
    Created on : 22 Jul, 2015, 11:57:05 AM
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
        <form action="mem_reg_api_action.jsp" method="post">
            <input type="text" name="mem_name" id="mem_name" placeholder="mem_name" />
            <input type="text" name="phone_no" id="phone_no" placeholder="phone_no" />
            <input type="text" name="email_id" id="email_id" placeholder="email_id" />
            <input type="text" name="address" id="address" placeholder="address" />
            <input type="text" name="kiosk_ip" id="kiosk_ip" placeholder="kiosk_ip" />
            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
