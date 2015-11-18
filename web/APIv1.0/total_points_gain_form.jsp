<%-- 
    Document   : total_points_gain_form
    Created on : 6 Jul, 2015, 4:13:39 PM
    Author     : sukanya
--%>
<%@include file="../conn.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        
        
        
    <body>
        <form  action="total_points_gain_action.jsp" class="form-control">
            <input name="Member_Id" class="form-control" id="Member_Id" type="text" placeholder="Member_Id" />
            
            <input name="date" class="form-control" id="date" type="text" placeholder="date" />
            <input name="submit" type="submit" value="Submit"/>
            
        </form>
         
    </body>
</html>
