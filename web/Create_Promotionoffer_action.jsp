<%-- 
    Document   : Create_Promotionoffer_action
    Created on : 3 Sep, 2015, 7:12:33 PM
    Author     : parwez
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%!
    public String random_string_s() {
        java.util.Random r = new java.util.Random();
        int i = 1, n = 0;
        char c;
        String str = "";
        for (int t = 0; t < 2; t++) {
            while (true) {
                i = r.nextInt(10);
                if (i > 5 && i < 10) {
                    if (i == 9) {
                        i = 90;
                        n = 90;
                        break;
                    }
                    if (i != 90) {
                        n = i * 10 + r.nextInt(10);
                        while (n < 65) {
                            n = i * 10 + r.nextInt(10);
                        }
                    }

                    break;
                }
            }
            c = (char) n;
            str = String.valueOf(c) + str;
        }
        while (true) {
            i = r.nextInt(1000);
            if (i > 99) {
                break;
            }
        }
        str = str + i;
        return (str);
    }


%>
<%  String promotion_name = request.getParameter("promotion_name");
    String status = request.getParameter("status");
    String offername = request.getParameter("offername");
    String desc = request.getParameter("desc");
    String adminid = request.getParameter("adminid");

    String group_cat = request.getParameter("group_cat");
    String trig_day = request.getParameter("trig_day");
    String sms_date = request.getParameter("sms_date");
    String sms_time_hr = request.getParameter("sms_time_hr");
    String sms_time_min = request.getParameter("sms_time_min");
    String sms_msg = request.getParameter("sms_msg");

    Connection con = null;
    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;
    String c_date;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("select * from loyalty_promotionoffer where offername='" + offername + "' && adminid='" + adminid + "'");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        //get current date time with Date()
        java.util.Date datee = new java.util.Date();
        String crrnt_date_time[] = dateFormat.format(datee).split("\\s+");
        c_date = crrnt_date_time[0];
        String rcode = random_string_s();
        /* TODO output your page here. You may use following sample code. */
        String sql = "INSERT INTO loyalty_promotionoffer(promotionid,description,offername,promocode,status,adminid,mem_grp_id,email_alert_create_date,when_email_alert,sms_alert_create_date,sms_message,sms_what_time) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

        pst = conn.prepareStatement(sql);
        pst.setString(1, promotion_name);
        pst.setString(2, desc);
        pst.setString(3, offername);
        pst.setString(4, rcode);
        pst.setString(5, status);
        pst.setString(6, adminid);
        pst.setString(7, group_cat);
        pst.setString(8, c_date);
        pst.setString(9, trig_day);
        pst.setString(10, sms_date);
        pst.setString(11, sms_msg);
        pst.setString(12, sms_time_hr + ":" + sms_time_min);

        updateQuery = pst.executeUpdate();
        if (updateQuery != 0) {
            response.sendRedirect("Create_Promotionoffer.jsp?status=1&opt=" + session.getId());
        }
    } else {

        response.sendRedirect("Create_Promotionoffer.jsp?status=2&opt=" + session.getId());

    }
%>