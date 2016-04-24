<%-- 
    Document   : reg_kiosk_new_action
    Created on : 31 Jul, 2015, 2:22:16 PM
    Author     : surajit
--%>

<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../conn.jsp" %>
<%
    JSONObject  jobj = new JSONObject();
    String ip = request.getParameter("ip");
    try{
        int count = 0;
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM loyalty_kiosk_reg_info WHERE kiosk_id='"+ip+"'");
        while(rs.next()){
            count++;
        }
        if(count == 0){
            PreparedStatement pst = conn.prepareStatement("INSERT INTO loyalty_kiosk_reg_info(kiosk_id,status) VALUES(?,?)");
            pst.setString(1, ip);
            pst.setString(2, "active");
            int update = pst.executeUpdate();
            if(update != 0){
                jobj.put("msg", "1");
                out.println(jobj);
            }else{
                jobj.put("msg", "1");
                out.println(jobj);
            }
        }else{
            jobj.put("msg", "2");
            out.println(jobj);
        }
    }catch(Exception e){}

%>
