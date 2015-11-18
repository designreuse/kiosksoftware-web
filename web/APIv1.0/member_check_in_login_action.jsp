<%-- 
    Document   : member_check_in_login_action
    Created on : 25 Jul, 2015, 6:55:20 PM
    Author     : surajit
--%>

<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../conn.jsp" %>
<%
    JSONObject jobj = new JSONObject();
    String status = request.getParameter("status");
    String mem_id = request.getParameter("mem_id");
    String kiosk_id = request.getParameter("kiosk_id");
    
    try{
        PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_member_login_info_datewise(member_id,kiosk_id,status) VALUES(?,?,?)");
        pst.setString(1, mem_id);
        pst.setString(2, kiosk_id);
        pst.setString(3, status);
        int update = pst.executeUpdate();
        if(update != 0){
            jobj.put("msg", "1");
            out.println(jobj);
        }else{
            jobj.put("msg", "0");
            out.println(jobj);
        }
    }catch(Exception ex){
        
    }
%>
