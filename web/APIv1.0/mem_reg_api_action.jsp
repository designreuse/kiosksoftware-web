<%-- 
    Document   : mem_reg_api_action
    Created on : 22 Jul, 2015, 11:56:09 AM
    Author     : surajit
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="com.loyalty.card.db.connect.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../conn.jsp" %>
<%    JSONObject jobj = new JSONObject();
    String mem_name = request.getParameter("mem_name");
    String phone_no = request.getParameter("phone_no");
    String email_id = request.getParameter("email_id");
    String address = request.getParameter("address");
    String kiosk_ip = request.getParameter("kiosk_ip");

    PreparedStatement pst = null;
    ResultSet rs = null;
    Statement st = null;
    int update = 0;
    try {
        pst = conn.prepareStatement("INSERT INTO sengroup_new_member_reg_details(fullname,member_id,present_address,user_type,email,phone_no,points,status,kiosk_ip) VALUES(?,?,?,?,?,?,?,?,?)");
        pst.setString(1, mem_name);
        pst.setString(2, "MEM-" + Integer.toString((int) (Math.random() * 10000)));
        pst.setString(3, address);
        pst.setString(4, "MEM");
        pst.setString(5, email_id);
        pst.setString(6, phone_no);
        pst.setString(7, "200");
        pst.setString(8, "active");
        pst.setString(9, kiosk_ip);

        update = pst.executeUpdate();
        if (update != 0) {
            jobj.put("msg", "1");
            out.println(jobj);
        } else {
            jobj.put("msg", "0");
            out.println(jobj);
        }

    } catch (Exception e) {
    } finally {
        out.close();
    }
%>
