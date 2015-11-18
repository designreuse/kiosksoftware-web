<%-- 
    Document   : member_details_action
    Created on : 2 Jul, 2015, 12:20:58 PM
    Author     :sukanya
--%>
<%@include file="../conn.jsp" %>
<%@page import="org.json.JSONObject"%>
<%
    JSONObject jobj=new JSONObject();
    String mem_id = request.getParameter("mem_id");
    String status = request.getParameter("status");
    try{
        java.sql.Statement st= conn.createStatement();
        java.sql.ResultSet rs=st.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE member_id='"+mem_id+"'");
        if(rs.next())
        {
            jobj.put("msg", "1");
            jobj.put("fullname", rs.getString("fullname"));
            jobj.put("present_address", rs.getString("present_address"));
            jobj.put("email", rs.getString("email"));
            jobj.put("phone_no", rs.getString("phone_no"));
            jobj.put("points", rs.getString("points"));
            out.println(jobj);
            
        }
        else{
            jobj.put("msg", "0");
            out.println(jobj);
        }
    }
    catch(Exception e){}
    
%>