<%-- 
    Document   : Edit_Company_Action
    Created on : 17 Sep, 2015, 4:43:50 PM
    Author     : parwez
--%>

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
    String status = req.getParameter("status");
    String country = req.getParameter("country");
    String userid = req.getParameter("adminid");

    
    String email = req.getParameter("email");
    String contact_no = req.getParameter("mobile");
    String address = req.getParameter("address");
    String sex = req.getParameter("sex");
    String apartment = req.getParameter("apartment");
    String city = req.getParameter("city");
    String zip = req.getParameter("zip");
    String phone = req.getParameter("pno");
    String mobile_no = req.getParameter("mno");
    // String pass = req.getParameter("pass");
    String img = req.getFilesystemName("imga");
    String state = req.getParameter("state");

    
    String storename = req.getParameter("storename");
    String storedispname = req.getParameter("storedispname");
    String website = req.getParameter("website");
    String org_type = req.getParameter("org_type");
    String date_format = req.getParameter("date_format");
    String base_currency = req.getParameter("base_currency");
    String fax = req.getParameter("fax");

    int c = 0;

    java.sql.Statement st = conn.createStatement();
    st.executeUpdate("update loyalty_customer_reg_details set storename='" + storename + "',  storedispname='" + storedispname + "', email='" + email + "', country='" + country + "', address='" + address + "',  city='" + city + "', state='" + state + "', zip='" + zip + "', phone='" + phone + "', mobile_no='" + mobile_no + "', image='" + img + "', website='" + website + "', org_type='" + org_type + "', date_format='" + date_format + "', base_currency='" + base_currency + "', fax='" + fax + "' where cus_id='" + userid + "'");
    session.setAttribute("image", img);
    response.sendRedirect("company_details.jsp?status=1&opt=" + session.getId());


%>
