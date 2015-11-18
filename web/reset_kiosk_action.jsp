<%-- 
    Document   : reset_kiosk_action
    Created on : 5 Sep, 2015, 11:48:34 AM
    Author     : parwez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp"%>
<%  String kiosk_ip = request.getParameter("kiosk_ip").toUpperCase();
    String code = request.getParameter("code");

    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("select * from loyalty_kiosk_reg_info where kiosk_id='" + kiosk_ip + "'");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {

        /* TODO output your page here. You may use following sample code. */
        java.sql.Statement stupdate = conn.createStatement();

        stupdate.executeUpdate("update loyalty_kiosk_reg_info set kiosk_id='" + kiosk_ip + "' where kiosk_id='" + code + "'");

        response.sendRedirect("reset_kiosk.jsp?status=1&opt=" + session.getId());

    } else {

        response.sendRedirect("reset_kiosk.jsp?status=2&opt=" + session.getId());

    }
%>
