<%-- 
    Document   : Edit_Member
    Created on : 8 Sep, 2015, 12:06:54 PM
    Author     : parwez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<% 
        String status = request.getParameter("status");
        String first_nm = request.getParameter("first_nm");
        String member_id = request.getParameter("member_id");
        String contact_no = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String admin_code = request.getParameter("a_code");
        String userid = request.getParameter("userid");
        String adminid = request.getParameter("adminid");
        String point = request.getParameter("point");
        
    
        
        int c = 0;

            java.sql.Statement st = conn.createStatement();
            st.executeUpdate("update sengroup_new_member_reg_details set fullname='" + first_nm + "',  phone_no='"+contact_no+"', present_address='"+address+"', status='"+status+"', email='"+email+"', points='"+point+"' where id='" + userid + "'");
           
            response.sendRedirect("view_list_of_members.jsp?status=1&opt=" + session.getId());
    
        

    
%>
