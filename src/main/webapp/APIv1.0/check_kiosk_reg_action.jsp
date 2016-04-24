<%-- 
    Document   : check_kiosk_reg_action
    Created on : 23 Dec, 2015, 12:11:01 PM
    Author     : surajit
--%>

<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../conn.jsp" %>
<%
String ip = request.getParameter("ip");
try{
    int count = 0;
    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rs = st.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan WHERE allocate_ip='"+ip+"'");
    if(rs.next()){
        count++;
        JSONObject jobj = new JSONObject();
        jobj.put("msg", "1");
        out.println(jobj);
    }else{
        JSONObject jobj = new JSONObject();
        jobj.put("msg", "0");
        out.println(jobj);
    }
}catch(Exception ex){}
finally{conn.close();}
%>