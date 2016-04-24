<%-- 
    Document   : offerdetail
    Created on : 24 Sep, 2015, 5:18:47 PM
    Author     : parwez
--%>

<%@include file="../conn.jsp" %>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%    JSONArray jarray = new JSONArray();
    try {

        int chkpromooffer1 = 0, chkpromo1 = 0;
        java.sql.Statement stadmincheckchk1 = conn.createStatement();
        java.sql.ResultSet rsadminstadmichk1 = stadmincheckchk1.executeQuery("select * from loyalty_promotionoffer");
        while (rsadminstadmichk1.next()) {
            chkpromooffer1++;
        }

        if (chkpromooffer1 != 0) {

            java.sql.Statement stadmincheckpointvalue = conn.createStatement();
            java.sql.ResultSet rsadminstadmincheckpointstadmincheckpointvalue = stadmincheckpointvalue.executeQuery("select * from loyalty_promotionoffer");
            while (rsadminstadmincheckpointstadmincheckpointvalue.next()) {
                JSONObject jobj = new JSONObject();
                java.sql.Statement stadmincheckpointvalueforpromotion = conn.createStatement();
                java.sql.ResultSet rsadminstadmincheckpointstadminpromotionvalue = stadmincheckpointvalueforpromotion.executeQuery("select * from loyalty_promotion where id='" + rsadminstadmincheckpointstadmincheckpointvalue.getString("promotionid") + "' && status='active'");
                while (rsadminstadmincheckpointstadminpromotionvalue.next()) {

                    jobj.put("promotionname", rsadminstadmincheckpointstadminpromotionvalue.getString("promotionname"));
                    jobj.put("offername", rsadminstadmincheckpointstadmincheckpointvalue.getString("offername"));
                    jobj.put("description", rsadminstadmincheckpointstadminpromotionvalue.getString("description"));
                    jobj.put("creationdate", rsadminstadmincheckpointstadminpromotionvalue.getString("offerfrom"));
                    jobj.put("expire", rsadminstadmincheckpointstadminpromotionvalue.getString("valid"));
                    jarray.put(jobj);

                }
            }
            out.println(jarray);

        } else {
            out.println(jarray);
        }
    } catch (Exception e) {
    }

%>