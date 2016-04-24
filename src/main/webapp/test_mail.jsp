<%-- 
    Document   : test_mail
    Created on : 7 Mar, 2016, 11:43:30 AM
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
        <form action="<%=request.getContextPath()%>/SendEmailAuth" method="post">
            <input type="text" name="emailto" placeholder="To"/>
            <input type="text" name="subject" placeholder="subject"/>
            <input type="text" name="message" placeholder="message"/>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
