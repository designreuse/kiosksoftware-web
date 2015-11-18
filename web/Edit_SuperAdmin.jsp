<%-- 
    Document   : Edit_SuperAdmin
    Created on : 13 Oct, 2015, 4:37:20 PM
    Author     : parwez
--%>

<%@page import="com.loyalty.card.db.model.DBModel"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>

<%    //Multipart Request////
    String dir = request.getRealPath("/uploads/");

    MultipartRequest req = new MultipartRequest(request, dir, 5024 * 1024, new FileRenamePolicy() {

        @Override
        public File rename(File f) {
            //Get the parent directory path as in h:/home/user or /home/user
            String parentDir = f.getParent();
            //Get filename without its path location, such as 'index.txt'
            String fname = f.getName();
            //Get the extension if the file has one
            String fileExt = "";
            int i = -1;
            if ((i = fname.indexOf(".")) != -1) {
                fileExt = fname.substring(i);
                fname = fname.substring(0, i);
            }
            //add the timestamp
            fname = fname + ("" + (new java.util.Date().getTime()));
            //piece together the filename
            fname = parentDir + System.getProperty(
                    "file.separator") + fname + fileExt;
            File temp = new File(fname);
            return temp;
        }
    });
%>
<%
    String firstname = req.getParameter("f_nm");
    String lastname = req.getParameter("lnm");
    String website = req.getParameter("wb");
    String organization_type = req.getParameter("org_typ");
    String postal_country = req.getParameter("postal_country");
    String postal_state = req.getParameter("postal_state");
    String postal_city = req.getParameter("postal_city");
    String postal_address = req.getParameter("postal_address");
    String Postal_zip = req.getParameter("postal_zip");
    String physical_country = req.getParameter("physical_country");
    String physical_state = req.getParameter("physical_state");
    String physical_city = req.getParameter("physical_city");
    String physical_address = req.getParameter("physical_address");
    String physical_zip = req.getParameter("physical_zip");
    String contact_no = req.getParameter("cno");
    String email_id = req.getParameter("email_id");
    String fax = req.getParameter("fax");
    String sales_ph_no = req.getParameter("sales_ph_no");
    String marketing_ph_no = req.getParameter("marketing_ph_no");
    String in_trial_ph_no = req.getParameter("in_trial_ph_no");
    String billing_accounts_no = req.getParameter("bill_acc_no");
    String support_email = req.getParameter("supp_email");
    String sales_email = req.getParameter("sales_email");
    String paypal_email_id = req.getParameter("paypal_email");
    String paypal_display_name = req.getParameter("paydnm");
    String paypal_client_name = req.getParameter("pay_client_nm");
    String paypal_secret_token = req.getParameter("pay_sec_nm");
    String logo = req.getFilesystemName("imga");
    String user_code = req.getParameter("u_code");
    out.print(logo);
    int c = 0;
    int updatee = 0;
    DBModel db = new DBModel();
    PreparedStatement pst = null;
    java.sql.Statement st = conn.createStatement();
    java.sql.ResultSet rse = st.executeQuery("SELECT * FROM loyalty_superadmin_all_details WHERE user_code='" + user_code + "'");
    if (rse.next()) {
        java.sql.Statement st1 = conn.createStatement();
        st1.executeUpdate("UPDATE loyalty_superadmin_all_details SET firstname='" + firstname + "',lastname='" + lastname + "',website='" + website + "',organization_type='" + organization_type + "',postal_country='" + postal_country + "',postal_state='" + postal_state + "',postal_city='" + postal_city + "',postal_address='" + postal_address + "',Postal_zip='" + Postal_zip + "',physical_country='" + physical_country + "',physical_state='" + physical_state + "',physical_city='" + physical_city + "',physical_address='" + physical_address + "',physical_zip='" + physical_zip + "',contact_no='" + contact_no + "',email_id='" + email_id + "',fax='" + fax + "',sales_ph_no='" + sales_ph_no + "',marketing_ph_no='" + marketing_ph_no + "',in_trial_ph_no='" + in_trial_ph_no + "',billing_accounts_no='" + billing_accounts_no + "',support_email='" + support_email + "',sales_email='" + sales_email + "',paypal_email_id='" + paypal_email_id + "',paypal_display_name='" + paypal_display_name + "',paypal_client_name='" + paypal_client_name + "',paypal_secret_token='" + paypal_secret_token + "',logo='" + logo + "' WHERE user_code='" + user_code + "'");
        session.setAttribute("image", logo);
        response.sendRedirect("superadmin_details.jsp?status=1&opt=" + session.getId());
    }else{
        pst = conn.prepareStatement(db.getSuperAdminDetails());
                pst.setString(1, firstname);
                pst.setString(2, lastname);
                pst.setString(3, website);
                pst.setString(4, organization_type);
                pst.setString(5, postal_country);
                pst.setString(6, postal_state);
                pst.setString(7, postal_city);
                pst.setString(8, postal_address);
                pst.setString(9, Postal_zip);
                pst.setString(10, physical_country);
                pst.setString(11, physical_state);
                pst.setString(12, physical_city);
                pst.setString(13, physical_address);
                pst.setString(14, physical_zip);
                pst.setString(15, contact_no);
                pst.setString(16, email_id);
                pst.setString(17, fax);
                pst.setString(18, sales_ph_no);
                pst.setString(19, marketing_ph_no);
                pst.setString(20, in_trial_ph_no);
                pst.setString(21, billing_accounts_no);
                pst.setString(22, support_email);
                pst.setString(23, sales_email);
                pst.setString(24, paypal_email_id);
                pst.setString(25, paypal_display_name);
                pst.setString(26, paypal_client_name);
                pst.setString(27, paypal_secret_token);
                pst.setString(28, logo);
                pst.setString(29, user_code);
                updatee = pst.executeUpdate();
                if (updatee != 0) {
                    response.sendRedirect("superadmin_details.jsp?status=1&type=success&opt=" + session.getId());
                } else {
                    response.sendRedirect("superdashboard.jsp?status=2&type=failed&opt=" + session.getId());
                }
    }


%>
