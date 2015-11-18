<%-- 
    Document   : Create_Promotionoffer_action
    Created on : 3 Sep, 2015, 7:12:33 PM
    Author     : parwez
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%!
    public String random_string_s() {
        java.util.Random r = new java.util.Random();
        int i = 1, n = 0;
        char c;
        String str = "";
        for (int t = 0; t < 2; t++) {
            while (true) {
                i = r.nextInt(10);
                if (i > 5 && i < 10) {
                    if (i == 9) {
                        i = 90;
                        n = 90;
                        break;
                    }
                    if (i != 90) {
                        n = i * 10 + r.nextInt(10);
                        while (n < 65) {
                            n = i * 10 + r.nextInt(10);
                        }
                    }

                    break;
                }
            }
            c = (char) n;
            str = String.valueOf(c) + str;
        }
        while (true) {
            i = r.nextInt(1000);
            if (i > 99) {
                break;
            }
        }
        str = str + i;
        return (str);
    }


%>
<%  String promotion_name = request.getParameter("promotion_name");
    String status = request.getParameter("status");
    String offername = request.getParameter("offername");
    String desc = request.getParameter("desc");

    String adminid = request.getParameter("adminid");

    Connection con = null;
    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("select * from loyalty_promotionoffer where offername='" + offername + "' && adminid='" + adminid + "'");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {
        String rcode = random_string_s();
        /* TODO output your page here. You may use following sample code. */
        String sql = "INSERT INTO loyalty_promotionoffer(promotionid,description,offername,promocode,status,adminid) VALUES(?,?,?,?,?,?)";

        pst = conn.prepareStatement(sql);
        pst.setString(1, promotion_name);
        pst.setString(2, desc);
        pst.setString(3, offername);
        pst.setString(4, rcode);
        pst.setString(5, status);

        pst.setString(6, adminid);

        updateQuery = pst.executeUpdate();
        if (updateQuery != 0) {
            response.sendRedirect("Create_Promotionoffer.jsp?status=1&opt=" + session.getId());
        }
    } else {

        response.sendRedirect("Create_Promotionoffer.jsp?status=2&opt=" + session.getId());

    }
%>