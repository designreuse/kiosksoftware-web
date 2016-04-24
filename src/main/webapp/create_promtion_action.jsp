<%-- 
    Document   : create_promtion_action
    Created on : 3 Sep, 2015, 6:40:30 PM
    Author     : parwez
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%  String promotion_name = request.getParameter("promotion_name");
    String adminid = request.getParameter("adminid");
    String desc = request.getParameter("desc");
    String vaidupto = request.getParameter("vaidupto");
    String status = request.getParameter("status");
    String offerfrom = request.getParameter("offerfrom");
    Connection con = null;
    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("select * from loyalty_promotion where promotionname='" + promotion_name + "' && adminid='"+adminid+"'");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {

        /* TODO output your page here. You may use following sample code. */
        String sql = "INSERT INTO loyalty_promotion (promotionname,description,offerfrom,valid,status,adminid) VALUES (?,?,?,?,?,?)";

        pst = conn.prepareStatement(sql);
        pst.setString(1, promotion_name);
        pst.setString(2, desc);
        pst.setString(3, offerfrom);
        pst.setString(4, vaidupto);
        pst.setString(5, status);
        pst.setString(6, adminid);

        updateQuery = pst.executeUpdate();
        if (updateQuery != 0) {
            response.sendRedirect("create_promotion.jsp?status=1&opt=" + session.getId());
        }
    } else {

        response.sendRedirect("create_promotion.jsp?status=2&opt=" + session.getId());

    }
%>>
