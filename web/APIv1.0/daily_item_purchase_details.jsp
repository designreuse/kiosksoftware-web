<%-- 
    Document   : daily_item_purchase_details
    Created on : 1 Jul, 2015, 4:28:57 PM
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
         <form action="daily_item_purchase_action.jsp" class="form-control"  method="Post">
            <input name="member_id" id="member_id" type="text" placeholder="member_id"/>
             <input name="item_name" id="item_name" type="text" placeholder="item_name"/>
              <input name="unit_price" id="unit_price" type="text" placeholder="unit_price"/>
               <input name="points" id="points" type="text" placeholder="points"/>
                <input name="total_points" id="total_points" type="text" placeholder="total_points"/>
                 <input name="quantity" id="quantity" type="text" placeholder="quantity"/>
                  <input name="date" id="date" type="text" placeholder="date"/>
                  
                  
                  <input type="submit" value="submit"/>
                  
            
        </form>
    </body>
</html>
