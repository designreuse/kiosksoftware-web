<%-- 
    Document   : permit_promotionoffer
    Created on : 24 Sep, 2015, 2:19:46 PM
    Author     : parwez
--%>

<%@include file="conn.jsp" %>
<%    String status = request.getParameter("status");
    String id = request.getParameter("id");

    try {
        Statement st = conn.createStatement();
        int update = st.executeUpdate("UPDATE loyalty_promotionoffer SET status='" + status + "' WHERE id=" + id);
        if (update != 0) {
            response.sendRedirect("Create_Promotionoffer.jsp");
        } else {
            response.sendRedirect("Create_Promotionoffer.jsp");
        }

    } catch (Exception e) {
    }

%>
