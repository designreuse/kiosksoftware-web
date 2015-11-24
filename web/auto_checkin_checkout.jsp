<%-- 
    Document   : auto_checkin_checkout
    Created on : 24 Nov, 2015, 6:35:57 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%        response.setIntHeader("Refresh", 10);
    try {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        Calendar cal = Calendar.getInstance();
        String currentDateTimeString = dateFormat.format(date);
        java.sql.Statement st_all = conn.createStatement();
        java.sql.ResultSet rs_all = st_all.executeQuery("SELECT * FROM loyalty_member_login_info_datewise WHERE create_date='" + currentDateTimeString + "' AND status='Check In'");
        while (rs_all.next()) {
            java.sql.Statement stu = conn.createStatement();
            stu.executeUpdate("UPDATE loyalty_member_login_info_datewise SET flag='0' WHERE member_id='" + rs_all.getString("member_id") + "'");

            PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_member_login_info_datewise(member_id,kiosk_id,status,flag,create_date) VALUES(?,?,?,?,?)");
            pst.setString(1, rs_all.getString("member_id"));
            pst.setString(2, rs_all.getString("kiosk_id"));
            pst.setString(3, "Check Out");
            pst.setString(4, "0");
            pst.setString(5, currentDateTimeString);
            int update = pst.executeUpdate();
        }
    } catch (Exception ex) {
    } finally {
        conn.close();
    }
%>
