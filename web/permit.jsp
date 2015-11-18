<%-- 
    Document   : permit
    Created on : 2 Jul, 2015, 2:46:33 PM
    Author     : sukanya

--%>
<%@include file="conn.jsp" %>
<%    String status = request.getParameter("status");
    String id = request.getParameter("id");

    try {
        Statement st = conn.createStatement();
        int update = st.executeUpdate("UPDATE loyalty_user_reg_details SET status='" + status + "' WHERE id=" + id);
        if (update != 0) {
            response.sendRedirect("view_list_of_users.jsp?status=1");
        } else {
            response.sendRedirect("view_list_of_users.jsp?status=2");
        }

    } catch (Exception e) {
    }

%>
