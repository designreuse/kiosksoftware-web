<%-- 
    Document   : EditUserAction
    Created on : 3 Sep, 2015, 3:45:41 PM
    Author     : parwez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<% 
        String status = request.getParameter("status");
        String first_nm = request.getParameter("first_nm");
        String last_nm = request.getParameter("last_nm");
        String contact_no = request.getParameter("mobile");
        String state = request.getParameter("state");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String user_type = request.getParameter("u_type");
        String admin_code = request.getParameter("a_code");
        String adminid = request.getParameter("adminid");
        String userid = request.getParameter("userid");

        String user_name = request.getParameter("unm");
        String password = request.getParameter("pwd");
        
        int c = 0;

            java.sql.Statement st = conn.createStatement();
            st.executeUpdate("update loyalty_user_reg_details set firstname='" + first_nm + "', lastname='"+last_nm+"', contact_no='"+contact_no+"', state='"+state+"', status='"+status+"', user_name='"+user_name+"', password='"+password+"', email='"+email+"' where id='" + userid + "'");
           
            response.sendRedirect("view_list_of_users.jsp?status=1&opt=" + session.getId());
    
        

    
%>
