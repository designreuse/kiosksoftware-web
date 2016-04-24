<%-- 
    Document   : daily_item_purchase_action
    Created on : 1 Jul, 2015, 4:42:10 PM
    Author     :sukanya
--%>
<%@include file="../conn.jsp" %>
<%@page import="org.json.JSONObject"%>
<%
    JSONObject jobj = new JSONObject();
    String member_id=request.getParameter("member_id");
    String item_name=request.getParameter("item_name");
    String unit_price=request.getParameter("unit_price");
    String points=request.getParameter("points");
    String total_points=request.getParameter("total_points");
    String quantity=request.getParameter("quantity");
     String date=request.getParameter("date");
     try{
         int update=0;
        PreparedStatement pst=conn.prepareStatement("INSERT INTO loyalty_daily_purchase_details(member_id,item_name,unit_price,points,total_price,quantity,date) VALUES(?,?,?,?,?,?,?)");
         pst.setString(1,member_id);
         pst.setString(2,item_name);
         pst.setString(3,unit_price);
         pst.setString(4,points);
         pst.setString(5,total_points);
         pst.setString(6,quantity);
         pst.setString(7,date);
         update=pst.executeUpdate();
         if(update!=0){
             jobj.put("msg", "1");
             out.println(jobj);
         }else{
             jobj.put("msg", "0");
             out.println(jobj);
         }
         
     }catch(Exception e){}
    
%>
