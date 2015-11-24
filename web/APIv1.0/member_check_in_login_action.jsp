<%-- 
    Document   : member_check_in_login_action
    Created on : 25 Jul, 2015, 6:55:20 PM
    Author     : surajit
--%>

<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../conn.jsp" %>
<%    JSONObject jobj = new JSONObject();
    String status = request.getParameter("status");
    String mem_id = request.getParameter("mem_id");
    String kiosk_id = request.getParameter("kiosk_id");
    String points = request.getParameter("points");
    String member_id = null;
    int count = 0;
    String total_ponits = null;

    try {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        Calendar cal = Calendar.getInstance();
        String currentDateTimeString = dateFormat.format(date);
        
        java.sql.Statement st = conn.createStatement();
        java.sql.ResultSet rs = st.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE member_id='" + mem_id + "' OR phone_no='" + mem_id + "' OR loyalty_card_nos='" + mem_id + "'");
        if (rs.next()) {
            member_id = rs.getString("member_id");
            total_ponits = rs.getString("points");
        }

        if (status.equals("Check In")) {

            PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_member_login_info_datewise(member_id,kiosk_id,status,flag,points,create_date) VALUES(?,?,?,?,?,?)");
            pst.setString(1, member_id);
            pst.setString(2, kiosk_id);
            pst.setString(3, status);
            pst.setString(4, "1");
            pst.setString(5, points);
            pst.setString(6, currentDateTimeString);
            int update = pst.executeUpdate();

            int totl_points = Integer.parseInt(total_ponits) + Integer.parseInt(points);
            java.sql.Statement stg = conn.createStatement();
            int updatee = stg.executeUpdate("UPDATE sengroup_new_member_reg_details SET points='" + Integer.toString(totl_points) + "' WHERE member_id='" + member_id + "'");

            if (update != 0) {
                jobj.put("msg", "1");
                out.println(jobj);
            } else {
                jobj.put("msg", "0");
                out.println(jobj);
            }

        } else if (status.equals("Check Out")) {
            java.sql.Statement stu = conn.createStatement();
            stu.executeUpdate("UPDATE loyalty_member_login_info_datewise SET flag='0' WHERE member_id='" + member_id + "'");

            PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_member_login_info_datewise(member_id,kiosk_id,status,flag,create_date) VALUES(?,?,?,?,?)");
            pst.setString(1, member_id);
            pst.setString(2, kiosk_id);
            pst.setString(3, status);
            pst.setString(4, "0");
            pst.setString(5, currentDateTimeString);
            int update = pst.executeUpdate();
            if (update != 0) {
                jobj.put("msg", "1");
                out.println(jobj);
            } else {
                jobj.put("msg", "0");
                out.println(jobj);
            }
        }

    } catch (Exception ex) {

    } finally {
        conn.close();
    }
%>
