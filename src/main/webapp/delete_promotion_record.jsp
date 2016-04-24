<%-- 
    Document   : delete_promotion_record
    Created on : 17 Feb, 2016, 4:14:12 PM
    Author     : xent30
--%>

<%@include file="conn.jsp" %>
<%
try{
    String tabid = request.getParameter("tabid");
    java.sql.PreparedStatement ps = null;
    ps = conn.prepareStatement("DELETE FROM loyalty_promotion WHERE id='"+tabid+"'");
    int updt = ps.executeUpdate();
    if(updt!=0){
       ps = conn.prepareStatement("DELETE FROM loyalty_promotionoffer WHERE promotionid='"+tabid+"'"); 
       ps.executeUpdate();
       response.getWriter().print(1);
    }

}catch(Exception e){e.printStackTrace();}
%>
