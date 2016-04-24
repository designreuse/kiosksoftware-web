<%-- 
    Document   : change_status_promotion
    Created on : 19 Sep, 2015, 5:16:15 PM
    Author     : parwez
--%>
<%@include file="conn.jsp" %>
<%    String status = request.getParameter("status");
    String id = request.getParameter("id");

    try {
        Statement st = conn.createStatement();
        int update = st.executeUpdate("UPDATE loyalty_promotion SET status='" + status + "' WHERE id=" + id);
        if (update != 0) {
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("dashboard.jsp");
        }

    } catch (Exception e) {
    }

%>
