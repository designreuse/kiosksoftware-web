<%-- 
    Document   : change_adminpassword_action
    Created on : 16 Sep, 2015, 7:28:06 PM
    Author     : parwez
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%    
    String newpass = request.getParameter("newpass").trim();
    String old_pass = request.getParameter("old_pass").trim();
    String adminid = request.getParameter("adminid");
    String actual = "";

    int c = 0;
    java.sql.Statement st1 = conn.createStatement();
    java.sql.ResultSet rs = st1.executeQuery("select * from loyalty_customer_reg_details where cus_id='" + adminid + "'");
    while (rs.next()) {
        actual = rs.getString("password").toString().trim();
    }
  
    if (actual.equals(old_pass)) {
       // out.print(actual + "match");
        java.sql.Statement st = conn.createStatement();
        st.executeUpdate("update loyalty_customer_reg_details set password='" + newpass + "' where cus_id='" + adminid + "'");

        response.sendRedirect("change_adminpassword.jsp?status=1&opt=" + session.getId());
    } else {
        //out.print(actual + "not match");
        response.sendRedirect("change_adminpassword.jsp?status=2&opt=" + session.getId());
    }

%>
