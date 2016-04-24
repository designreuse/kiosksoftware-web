<%-- 
    Document   : permit_promotion
    Created on : 24 Sep, 2015, 3:36:13 PM
    Author     : parwez
--%>
<%@include file="conn.jsp" %>
<%    String status = request.getParameter("status");
    String id = request.getParameter("id");

    try {
        Statement st = conn.createStatement();
        int update = st.executeUpdate("UPDATE loyalty_promotion SET status='" + status + "' WHERE id=" + id);
        if (update != 0) {
            response.sendRedirect("create_promotion.jsp");
        } else {
            response.sendRedirect("create_promotion.jsp");
        }

    } catch (Exception e) {
    }

%>

