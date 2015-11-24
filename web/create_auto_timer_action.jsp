<%-- 
    Document   : create_role_action
    Created on : 1 Sep, 2015, 11:57:33 AM
    Author     : parwez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%  String set_timer = request.getParameter("set_timer");
    String adminid = request.getParameter("adminid");
    String status = request.getParameter("status");
    Connection con = null;
    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("select * from loyalty_auto_timer_details where set_timer='" + set_timer + "' && adminid='"+adminid+"'");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {

        /* TODO output your page here. You may use following sample code. */
       
        String sql = "INSERT INTO loyalty_auto_timer_details (set_timer,status,adminid) VALUES (?,?,?)";

        pst = conn.prepareStatement(sql);
        pst.setString(1, set_timer);
        pst.setString(2, status);
        pst.setString(3, adminid);
        
        updateQuery = pst.executeUpdate();
        if (updateQuery != 0) {
             response.sendRedirect("create_auto_timer.jsp?status=1&opt="+session.getId());
        }
    } else {

        response.sendRedirect("create_auto_timer.jsp?status=2&opt="+session.getId());

    }
%>