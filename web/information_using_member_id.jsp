<%-- 
    Document   : information_using_member_id
    Created on : 27 Nov, 2015, 1:36:00 PM
    Author     : surajit
--%>

<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%
String member_id = request.getParameter("member_id");
try{
    JSONObject jObj = new JSONObject();
    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rs = st.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE member_id='"+member_id+"'");
    if(rs.next()){
        jObj.put("fullname", rs.getString("fullname"));
        jObj.put("present_address", rs.getString("present_address"));
        jObj.put("email", rs.getString("email"));
        jObj.put("phone_no", rs.getString("phone_no"));
        jObj.put("points", rs.getString("points"));
        jObj.put("loyalty_card_nos", rs.getString("loyalty_card_nos"));
    }
    out.println(jObj);
}catch(Exception ex){}
finally{
    conn.close();
}

%>