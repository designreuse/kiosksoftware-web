<%-- 
    Document   : permit_member
    Created on : 2 Jul, 2015, 6:31:26 PM
    Author     : sukanya
--%>
<%@include file="conn.jsp" %>
<%    String id = request.getParameter("id");
    String status = request.getParameter("status");
    int update = 0;
    try {

        java.sql.Statement st = conn.createStatement();
        update = st.executeUpdate("UPDATE sengroup_new_member_reg_details SET status='" + status + "' WHERE id='" + id + "' ");
        if (update != 0) {
            response.sendRedirect("view_list_of_members.jsp?status=1");
        } else {
            response.sendRedirect("view_list_of_members.jsp?status=2");
        }

    } catch (Exception e) {
    }
%>