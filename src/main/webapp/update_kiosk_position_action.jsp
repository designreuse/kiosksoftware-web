<%-- 
    Document   : update_kiosk_position_action
    Created on : 19 Aug, 2015, 2:43:38 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%    String Kiosk_ip = request.getParameter("Kiosk_ip");
    String positions = request.getParameter("positions");
    try {
        Statement st = conn.createStatement();
        int update = st.executeUpdate("UPDATE loyalty_kiosk_reg_info SET positions='"+positions+"' WHERE kiosk_id='"+Kiosk_ip+"'");
        if(update != 0){
            response.sendRedirect("view_list_of_kiosk.jsp?staus=1&opt="+session.getId());
        }else{
            
        }
        

    } catch (Exception ex) {
    }
%>
