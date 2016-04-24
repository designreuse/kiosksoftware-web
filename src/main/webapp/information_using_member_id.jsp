<%-- 
    Document   : information_using_member_id
    Created on : 27 Nov, 2015, 1:36:00 PM
    Author     : xent30
--%>

<%@page import="org.json.JSONObject"%>
<%@include file="conn.jsp" %>
<%
//String member_id = request.getParameter("member_id");
String new_val = request.getParameter("strval");
String []vStr = new_val.split(":");
try{
    String sql="";
    if(vStr[1].equals("1")){
        sql="SELECT * FROM sengroup_new_member_reg_details WHERE fullname='"+vStr[0]+"'";
    }else if(vStr[1].equals("2")){
        sql="SELECT * FROM sengroup_new_member_reg_details WHERE phone_no='"+vStr[0]+"'";
    }else if(vStr[1].equals("3")){
        sql="SELECT * FROM sengroup_new_member_reg_details WHERE email='"+vStr[0]+"'";
    }
//    System.out.println(sql);
    String promo_id = "";
    JSONObject jObj = new JSONObject();
    java.sql.PreparedStatement ps1 = null;
    java.sql.ResultSet rs1 = null;
    java.sql.PreparedStatement pst = conn.prepareStatement(sql);
    java.sql.ResultSet rs = pst.executeQuery();
    if(rs.next()){
        try{promo_id = rs.getString("promotion_id");if(promo_id==null)promo_id="";}catch(Exception e){e.printStackTrace();}
        String promo_name="",startdate="",enddate="";
        if(!promo_id.equals("")){
            ps1 = conn.prepareStatement("SELECT * FROM loyalty_promotion WHERE id='"+promo_id+"'");
            rs1 = ps1.executeQuery();
            if(rs1.next()){
               promo_name = rs1.getString("promotionname");
               startdate = rs1.getString("offerfrom");
               enddate = rs1.getString("valid");
            }
        }
        jObj.put("tab_id",rs.getInt("id"));
        jObj.put("memberid", rs.getString("member_id"));
        jObj.put("fullname", rs.getString("fullname"));
        jObj.put("present_address", rs.getString("present_address"));
        jObj.put("email", rs.getString("email"));
        jObj.put("phone_no", rs.getString("phone_no"));
        jObj.put("points", rs.getString("points"));
        jObj.put("loyalty_card_nos", rs.getString("loyalty_card_nos"));
        jObj.put("promoname", promo_name);
        jObj.put("startdt", startdate);
        jObj.put("enddt", enddate);
    }
  //  out.println(jObj);
    
    response.getWriter().print(jObj);
}catch(Exception ex){ex.printStackTrace();}
finally{
    conn.close();
}

%>