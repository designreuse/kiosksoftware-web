<%-- 
    Document   : create_membergroup_action
    Created on : 3 Sep, 2015, 4:15:36 PM
    Author     : parwez
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%  String membergrp_name = request.getParameter("membergrp_name").toUpperCase();
    String adminid = request.getParameter("adminid");
    String desc = request.getParameter("desc");
    String status = request.getParameter("status");
    String member_point = request.getParameter("member_point");
    Connection con = null;
    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("select * from loyalty_membergroup where groupname='" + membergrp_name + "' && membershippoint='"+member_point+"' && adminid='" + adminid + "'");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {

        /* TODO output your page here. You may use following sample code. */
        String sql = "INSERT INTO loyalty_membergroup (groupname,description,membershippoint,status,adminid) VALUES (?,?,?,?,?)";

        pst = conn.prepareStatement(sql);
        pst.setString(1, membergrp_name);
        pst.setString(2, desc);
        pst.setString(3, member_point);
        pst.setString(4, status);
        pst.setString(5, adminid);

        updateQuery = pst.executeUpdate();
        if (updateQuery != 0) {
            response.sendRedirect("creategroup.jsp?status=1&opt=" + session.getId());
        }
    } else {

        response.sendRedirect("creategroup.jsp?status=2&opt=" + session.getId());

    }
%>
