<%-- 
    Document   : auto_checkin_checkout
    Created on : 24 Nov, 2015, 6:35:57 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%    //response.setIntHeader("Refresh", 10);
    try {
        String kiosk_id = null;
        String cus_id = (String) session.getAttribute("cus_id");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        String currentDateTimeString = dateFormat.format(date);
        int count_check_in = 0;
        int count_check_out = 0;
        java.sql.Statement st_all_a = conn.createStatement();
        java.sql.ResultSet rs_all_a = st_all_a.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE admin_id='" + cus_id + "'");
        while (rs_all_a.next()) {
            String member_id = rs_all_a.getString("member_id");
            String status = rs_all_a.getString("status");
            kiosk_id = rs_all_a.getString("kiosk_ip");
            java.sql.Statement st_u_u = conn.createStatement();
            java.sql.ResultSet rs_u_u = st_u_u.executeQuery("SELECT * FROM loyalty_member_login_info_datewise WHERE member_id='" + member_id + "' AND status='Check In' AND create_date='" + currentDateTimeString + "' AND isActive='active'");
            while (rs_u_u.next()) {
                count_check_in++;
                //check_in_array.add(rs_u_u.getString("member_id"));
                PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_member_login_info__checkoutdatewise(member_id,kiosk_id,status,flag,create_date) VALUES(?,?,?,?,?)");
                pst.setString(1, rs_u_u.getString("member_id"));
                pst.setString(2, kiosk_id);
                pst.setString(3, "Check Out");
                pst.setString(4, "0");
                pst.setString(5, currentDateTimeString);
                int update = pst.executeUpdate();
                Statement st = conn.createStatement();
                int update_login = st.executeUpdate("UPDATE loyalty_member_login_info_datewise SET isActive='deactive' WHERE member_id='" + rs_u_u.getString("member_id") + "'");
            }
        }
        response.sendRedirect("create_auto_timer.jsp?opt="+session.getId());
    } catch (Exception ex) {
    } finally {
        conn.close();
    }
%>
