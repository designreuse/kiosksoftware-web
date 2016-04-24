<%-- 
    Document   : create_user_action
    Created on : 1 Sep, 2015, 12:25:36 PM
    Author     : parwez
--%>

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
<%    String rolename = request.getParameter("roleid");
    String status = request.getParameter("status");
    String first_nm = request.getParameter("first_nm");
    String last_nm = request.getParameter("last_nm");
    String contact_no = request.getParameter("mobile");
    String state = request.getParameter("state");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String user_type = request.getParameter("u_type");
    String admin_code = request.getParameter("a_code");
    String adminid = request.getParameter("adminid");

    String user_name = request.getParameter("unm");
    String password = request.getParameter("pwd");
    Connection con = null;
    PreparedStatement pst = null;
    int updateQuery = 0;
    int c = 0;

    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("SELECT * FROM loyalty_user_reg_details WHERE user_name='" + user_name + "' OR contact_no='" + contact_no + "' ");
    while (rse.next()) {
        c++;
    }
    if (c == 0) {
        String user_code = "user" + random_string_s();
        /* TODO output your page here. You may use following sample code. */
        String sql = "INSERT INTO loyalty_user_reg_details(firstname,lastname,contact_no,state,designation,user_type,admin_code,status,user_code,user_name,password,adminid,email) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        pst = conn.prepareStatement(sql);
        pst.setString(1, first_nm);
        pst.setString(2, last_nm);
        pst.setString(3, contact_no);
        pst.setString(4, state);
        pst.setString(5, rolename);

        pst.setString(6, "EMP");
        pst.setString(7, admin_code);
        pst.setString(8, status);
        pst.setString(9, user_code);
        pst.setString(10, user_name);
        pst.setString(11, password);
        pst.setString(12, adminid);
        pst.setString(13, email);

        updateQuery = pst.executeUpdate();
        if (updateQuery != 0) {
            response.sendRedirect("create_user.jsp?status=1&opt=" + session.getId());
        }
    } else {

        response.sendRedirect("create_user.jsp?status=2&opt=" + session.getId());

    }
%>