<%-- 
    Document   : member_reg_form
    Created on : 1 Jul, 2015, 1:20:17 PM
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
        <form action="<%=request.getContextPath()%>/mem_reg_api" class="form-control" enctype="multipart/form-data" method="Post">
            <input name="fullname" id="fullname" type="text" placeholder="fullname"/>
            <input name="username" id="username" type="text" placeholder="username"/>
            <input name="password" id="password" type="text" placeholder="password"/>
            <input name="member_id" id="member_id" type="text" placeholder="member_id"/>
            <input name="card_no" id="card_no" type="text" placeholder="card_no"/>
            <input name="bonus_point" id="bonus_point" type="text" placeholder="bonus_point"/>
            <input name="admin_code" id="admin_code" type="text" placeholder="admin_code"/>
            <input name="present_city" id="present_city" type="text" placeholder="present_city"/>
            <input name="present_state" id="present_state" type="text" placeholder="present_state"/>
            <input name="present_district" id="present_district" type="text" placeholder="present_district"/>
            <input name="present_address" id="present_address" type="text" placeholder="present_address"/>
            <input name="user_type" id="user_type" type="text" placeholder="user_type"/>
            <input name="gender" id="gender" type="text" placeholder="gender"/>
            <input name="terms_n_cond" id="terms_n_cond" type="text" placeholder="terms_n_cond"/>
            <input name="mobile_no" id="mobile_no" type="text" placeholder="mobile_no"/>
            <input name="email" id="email" type="text" placeholder="email"/>
            <input name="status" id="status" type="text" placeholder="status"/>
            <input name="user_code" id="user_code" type="text" placeholder="user_code"/>
            <input name="pin_code" id="pin_code" type="text" placeholder="pin_code"/>
            <input name="permanent_city" id="permanent_city" type="text" placeholder="permanent_city"/>
            <input name="permanent_state" id="permanent_state" type="text" placeholder="permanent_state"/>
            <input name="permanent_district" id="permanent_district" type="text" placeholder="permanent_district"/>
            <input name="permanent_address" id="permanent_address" type="text" placeholder="permanent_address"/>
            <input name="image" id="image" type="file" placeholder=""/>
            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
