<%-- 
    Document   : loyalty_nos_update_action
    Created on : 27 Nov, 2015, 2:00:34 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%

try{
   String member_id = request.getParameter("member_id");
   String loyalty_no = request.getParameter("loyalty_no");
   
   java.sql.Statement st = conn.createStatement();
   int update = st.executeUpdate("UPDATE sengroup_new_member_reg_details SET loyalty_card_nos='"+loyalty_no+"' WHERE member_id='"+member_id+"'");
   if(update != 0){
       response.sendRedirect("member_details.jsp?status=1&opt="+session.getId());
   }else{
       response.sendRedirect("member_details.jsp?status=2&opt="+session.getId());
   }
}catch(Exception ex){}
finally{
    conn.close();
}

%>
