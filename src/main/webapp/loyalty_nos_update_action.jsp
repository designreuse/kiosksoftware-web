<%-- 
    Document   : loyalty_nos_update_action
    Created on : 27 Nov, 2015, 2:00:34 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%

try{
    java.sql.PreparedStatement ps = null;
    java.sql.ResultSet rs = null;
    int tabid=0;
    try{tabid = Integer.parseInt(request.getParameter("tabid"));if(tabid+""==null)tabid=0;}catch(Exception e){e.printStackTrace();}
   String member_id = request.getParameter("member_id");
   String loyalty_no = request.getParameter("loyalty_no");
   String edit = request.getParameter("editable");
   String fullname = request.getParameter("full_name");
   String address = "";
   try{address = request.getParameter("address");if(address==null)address="";}catch(Exception e){e.printStackTrace();}
   String points = "";
   try{points = request.getParameter("points");if(points==null)points="0";}catch(Exception e){e.printStackTrace();}
   
   String mob_no = request.getParameter("mobile_no");
   String mailid = request.getParameter("email_id");
   String loyalty = request.getParameter("loyalty_no");
   
   if(edit.equals("1")){
    ps = conn.prepareStatement("UPDATE sengroup_new_member_reg_details SET member_id='"+member_id+"',fullname='"+fullname+"',present_address='"+address+"',phone_no='"+mob_no+"',points='"+points+"',loyalty_card_nos='"+loyalty_no+"' WHERE member_id='"+member_id+"'");
    int update = ps.executeUpdate();
    if(update != 0){
        response.sendRedirect("member_details.jsp?status=1&opt="+session.getId());
    }else{
        response.sendRedirect("member_details.jsp?status=2&opt="+session.getId());
    }
   }else{
        response.sendRedirect("member_details.jsp?status=0&opt="+session.getId());    
            }
}catch(Exception ex){}
finally{
    conn.close();
}

%>
