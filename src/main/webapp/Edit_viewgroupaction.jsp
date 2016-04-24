<%-- 
    Document   : Edit_viewgroupaction
    Created on : 16 Sep, 2015, 6:38:29 PM
    Author     : parwez
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<% 
        String status = request.getParameter("status");
       
        String userid = request.getParameter("userid");
        String adminid = request.getParameter("adminid");
        
         String grname = request.getParameter("grname");
          String desc = request.getParameter("desc");
           String mpoint = request.getParameter("mpoint");
        
        
        
    
        
        int c = 0;

            java.sql.Statement st = conn.createStatement();
            st.executeUpdate("update loyalty_membergroup set groupname='" + grname + "',  description='"+desc+"', membershippoint='"+mpoint+"', status='"+status+"' where id='" + userid + "'");
           
            response.sendRedirect("viewgroup.jsp?status=1&opt=" + session.getId());
    
        

    
%>
