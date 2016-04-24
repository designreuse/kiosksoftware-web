<%-- 
    Document   : permit_kiosksubscription
    Created on : 3 Sep, 2015, 7:26:42 PM
    Author     : parwez
--%>

<%@page import="java.sql.Statement"%>
<%@include file="conn.jsp" %>
<%    String status = request.getParameter("status");
    String id = request.getParameter("id");

    try {
        Statement st = conn.createStatement();
        int update = st.executeUpdate("UPDATE loyalty_allocate_subscription_plan SET status='" + status + "' WHERE id=" + id);
        if (update != 0) {
            response.sendRedirect("kiosk_management.jsp?status=1");
        } else {
            response.sendRedirect("kiosk_management.jsp?status=2");
        }

    } catch (Exception e) {
    }

%>