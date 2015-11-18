<%-- 
    Document   : total_points_gain_action
    Created on : 6 Jul, 2015, 4:39:07 PM
    Author     : sukanya
--%>
<%@page import="org.json.JSONObject"%>
<%@include file="../conn.jsp" %>
<%      
        String mem_id= request.getParameter("Member_Id");
         String points = request.getParameter("points");
          String date= request.getParameter("date");
        

                   JSONObject jobj=new JSONObject();
                       try{
                           int count=0;
                       int total=0;
                           //out.println("admin code:"+user_code);
                           
                                 //out.println("\nMEMBERID:"+rtt.getString("member_id"));   
                               java.sql.Statement stk = conn.createStatement();
                               java.sql.ResultSet rtk = stk.executeQuery("SELECT * FROM loyalty_daily_purchase_details WHERE member_id='"+mem_id+"' AND date='"+date+"' ");
                               while(rtk.next())
                               {
                                   count++;
                               
                                total=total+ Integer.parseInt(rtk.getString("points"));
                                jobj.put("Total", total);
                                
                               }
                               if(count!=0)
                                {
                                jobj.put("msg", "1");
                                out.println(jobj);
                                }
                                else
                                {
                                    jobj.put("msg", "0");
                                    out.println(jobj);
                                    
                                }
                               
                       }catch(Exception e){} 
    %>                      