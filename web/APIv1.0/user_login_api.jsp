<%-- 
    Document   : user_login_api
    Created on : 2 Jul, 2015, 11:30:59 AM
    Author     : sukanya
--%>
<%@include file="../conn.jsp" %>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%
    JSONArray jarr=new JSONArray();
   
   try{
       JSONObject jobj=new JSONObject();
       String user_name=request.getParameter("user_name");
       String password=request.getParameter("password");
       String status=request.getParameter("status");
       java.sql.Statement st=conn.createStatement();
       java.sql.ResultSet rs= st.executeQuery("SELECT * FROM loyalty_user_reg_details WHERE user_name='"+user_name+"'AND password='"+password+"'AND status='active' ");
       if(rs.next()){
           
           jobj.put("msg","1");
           jobj.put("fullname",rs.getString("fullname"));
           jobj.put("contact_no",rs.getString("contact_no"));
           jobj.put("present_state",rs.getString("present_state"));
           jobj.put("present_dist",rs.getString("present_dist"));
           jobj.put("present_pin_code",rs.getString("present_pin_code"));
           jobj.put("present_address",rs.getString("present_address"));
           jobj.put("designation",rs.getString("designation"));
           jobj.put("permanent_state",rs.getString("permanent_state"));
           jobj.put("permanent_district",rs.getString("permanent_district"));
           jobj.put("permanent_pincode",rs.getString("permanent_pincode"));
           jobj.put("permanent_address",rs.getString("permanent_address"));
           jobj.put("user_type",rs.getString("user_type"));
           jobj.put("admin_code",rs.getString("admin_code"));
           jobj.put("status",rs.getString("status"));
           jobj.put("user_code",rs.getString("user_code"));
           jobj.put("user_name",rs.getString("user_name"));
           jobj.put("password",rs.getString("password"));
           out.println(jobj);
       }
       else
       {
          jobj.put("msg","0");
          out.println(jobj); 
       }
   }
   catch(Exception e){
       
   }
   
    
%>
