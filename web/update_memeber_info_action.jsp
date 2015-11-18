<%-- 
    Document   : update_memeber_info_action
    Created on : 19 Aug, 2015, 1:23:13 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%    String member_id = request.getParameter("member_id");

    String fname = request.getParameter("fname");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String ph_no = request.getParameter("ph_no");
    String status = request.getParameter("status");
    String points = request.getParameter("points");
    try {
        Statement st = conn.createStatement();
        int update = st.executeUpdate("UPDATE sengroup_new_member_reg_details SET fullname='"+fname+"',present_address='"+address+"',email='"+email+"',phone_no='"+ph_no+"',points='"+points+"' WHERE member_id='"+member_id+"'");
        //if(update != 0){
            response.sendRedirect("view_list_of_kiosk.jsp?staus=1&opt="+session.getId());
        
    } catch (Exception ex) {
    }
%>
