<%-- 
    Document   : cancel_account_action
    Created on : 18 Sep, 2015, 12:30:51 PM
    Author     : parwez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%   
   //String userid = request.getParameter("userid");
    String adminid = request.getParameter("adminid");
    int c = 0;
    //java.sql.Statement st = conn.createStatement();
    //st.executeUpdate("update sengroup_new_member_reg_details set fullname='" + first_nm + "',  phone_no='" + contact_no + "', present_address='" + address + "', status='" + status + "', email='" + email + "' where id='" + userid + "'");
    HttpSession ss=request.getSession();
    ss.invalidate();
   // response.sendRedirect("view_list_of_members_op.jsp?status=1&opt=" + session.getId());
    response.sendRedirect("index.jsp?status=5&opt=" + session.getId());

%>
