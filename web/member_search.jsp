<%-- 
    Document   : member_search
    Created on : 27 Nov, 2015, 1:15:39 PM
    Author     : surajit
--%>

<%@page import="org.json.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%

try{
    JSONArray jArray = new JSONArray();
    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rs = st.executeQuery("SELECT member_id FROM sengroup_new_member_reg_details");
    while(rs.next()){
        jArray.put(rs.getString("member_id"));
    }
    out.println(jArray);
}catch(Exception ex){}
finally{
    conn.close();
}

%>