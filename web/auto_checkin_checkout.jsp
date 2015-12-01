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
        int check_in_count = 0;
        int check_out_count = 0;
        int count_1 = 0;
        int count_2 = 0;
        String member_id_c_in = null;
        String member_id_c_out = null;
        ArrayList<String> check_in_array = new ArrayList<String>();
        ArrayList<String> check_out_array = new ArrayList<String>();

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        String currentDateTimeString = dateFormat.format(date);

        java.sql.Statement st_all_l = conn.createStatement();
        java.sql.ResultSet rs_all_l = st_all_l.executeQuery("SELECT * FROM loyalty_member_login_info_datewise WHERE create_date='" + currentDateTimeString + "'");
        while (rs_all_l.next()) {
            String member_id = rs_all_l.getString("member_id");
            String status = rs_all_l.getString("status");
            java.sql.Statement st_u = conn.createStatement();
            java.sql.ResultSet rs_u = st_u.executeQuery("SELECT * FROM loyalty_member_login_info_datewise WHERE member_id='" + member_id + "' AND status='Check In'");
            while (rs_u.next()) {
                count_1++;
                //check_in_array.add(rs_u.getString("member_id"));
            }
            java.sql.Statement st_u_c = conn.createStatement();
            java.sql.ResultSet rs_u_c = st_u_c.executeQuery("SELECT * FROM loyalty_member_login_info_datewise WHERE member_id='" + member_id + "' AND status='Check Out'");
            while (rs_u_c.next()) {
                count_2++;
                //check_out_array.add(rs_u_c.getString("member_id"));
            }
        }

        //out.println(check_in_count + " " + check_in_array.toString());
        //out.println(check_out_count + " " + check_out_array.toString());
        if (count_1 != count_2) {
            java.sql.Statement st_all = conn.createStatement();
            java.sql.ResultSet rs_all = st_all.executeQuery("SELECT * FROM loyalty_member_login_info_datewise WHERE create_date='" + currentDateTimeString + "' AND status='Check In'");
            while (rs_all.next()) {
                check_in_count++;
                check_in_array.add(rs_all.getString("member_id"));
                kiosk_id = rs_all.getString("kiosk_id");
            }
            java.sql.Statement st_check_out = conn.createStatement();
            java.sql.ResultSet rs_all_checkout = st_check_out.executeQuery("SELECT * FROM loyalty_member_login_info_datewise WHERE create_date='" + currentDateTimeString + "' AND status='Check Out'");
            while (rs_all_checkout.next()) {
                check_out_count++;
                check_out_array.add(rs_all_checkout.getString("member_id"));
            }
            out.println("IN-:" + check_in_count);
            out.println("OUT-:" + check_out_count);

            for (int i = 0; i < check_in_array.size(); i++) {
                for (int j = 0; j < check_out_array.size(); j++) {
                    if (!check_in_array.get(i).equals(check_out_array.get(j))) {
                        //out.println(check_in_array.get(i));
                        PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_member_login_info_datewise(member_id,kiosk_id,status,flag,create_date) VALUES(?,?,?,?,?)");
                        pst.setString(1, check_in_array.get(i));
                        pst.setString(2, kiosk_id);
                        pst.setString(3, "Check Out");
                        pst.setString(4, "0");
                        pst.setString(5, currentDateTimeString);
                        int update = pst.executeUpdate();
                    }
                }
            }
            response.sendRedirect("create_auto_timer.jsp?opt=" + session.getId());
        } else {
            response.sendRedirect("create_auto_timer.jsp?opt=" + session.getId());
        }
        //response.sendRedirect("setting.jsp?status=3&opt=" + session.getId());
        /*java.sql.Statement stch = conn.createStatement();
         java.sql.ResultSet rsch = stch.executeQuery("");
         java.sql.Statement stu = conn.createStatement();
         stu.executeUpdate("UPDATE loyalty_member_login_info_datewise SET flag='0' WHERE member_id='" + rs_all.getString("member_id") + "'");
             
         PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_member_login_info_datewise(member_id,kiosk_id,status,flag,create_date) VALUES(?,?,?,?,?)");
         pst.setString(1, rs_all.getString("member_id"));
         pst.setString(2, rs_all.getString("kiosk_id"));
         pst.setString(3, "Check Out");
         pst.setString(4, "0");
         pst.setString(5, currentDateTimeString);
         int update = pst.executeUpdate();*/
    } catch (Exception ex) {
    } finally {
        conn.close();
    }
%>
