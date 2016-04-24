<%-- 
    Document   : create_role_action
    Created on : 1 Sep, 2015, 11:57:33 AM
    Author     : parwez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%  String rolename = request.getParameter("role_name");
    String adminid = request.getParameter("adminid");
    String status = request.getParameter("status");
    Connection con = null;
    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("select * from loyalty_create_role where rolename='" + rolename + "' && adminid='"+adminid+"'");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {

        /* TODO output your page here. You may use following sample code. */
       
        String sql = "INSERT INTO loyalty_create_role (rolename,status,adminid) VALUES (?,?,?)";

        pst = conn.prepareStatement(sql);
        pst.setString(1, rolename);
        pst.setString(2, status);
        pst.setString(3, adminid);
        
        updateQuery = pst.executeUpdate();
        if (updateQuery != 0) {
             response.sendRedirect("create_role.jsp?status=1&opt="+session.getId());
        }
    } else {

        response.sendRedirect("create_role.jsp?status=2&opt="+session.getId());

    }
%>