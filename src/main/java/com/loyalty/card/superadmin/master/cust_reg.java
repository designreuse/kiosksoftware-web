/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.superadmin.master;

import com.loyalty.card.db.connect.DBConnect;
import com.loyalty.card.db.model.DBModel;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mrinal
 */
public class cust_reg extends HttpServlet {

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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            ///////////////////////
            
            //Multipart Request////
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

            /////////////////////////////
            Connection con = null;
            Connection conn = null;
            ResultSet rs = null;
            Statement st = null;
            PreparedStatement pst = null;
            int update = 0;
            int updatee = 0;
            int count = 0;
            String firstname = req.getParameter("fname");
            String lastname = req.getParameter("lname");
            String email = req.getParameter("email");
            String gender = req.getParameter("gen");
            String country = req.getParameter("country");
            String address = req.getParameter("address");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String user_type = req.getParameter("");
            String zip = req.getParameter("zip");
            String phone = req.getParameter("pno");
            String mobile_no = req.getParameter("mno");
            String status = req.getParameter("status");
            String user_code = req.getParameter("u_code");
            String user_name = firstname + random_string_s();
            String password = req.getParameter("password");
            
            String storename = req.getParameter("storename");
            String storedispname = req.getParameter("storedispname");
            String website = req.getParameter("website");
            String org_type = req.getParameter("org_type");
            String date_format = req.getParameter("date_format");
            String base_currency = req.getParameter("base_currency");
            String fax = req.getParameter("fax");

            String img = req.getFilesystemName("img");

            
            DBModel db = new DBModel();
            out.print(db.getCustDetails());
            con = DBConnect.getConnect();
            conn = DBConnect.getConnect();
            st = conn.createStatement();
            rs = st.executeQuery("SELECT * FROM loyalty_customer_reg_details WHERE user_name='" + user_name + "' OR email='" + email + "' OR mobile_no='" + mobile_no + "' OR phone='" + phone + "' OR storedispname='" + storedispname + "' OR storename='" + storename + "'");
            while (rs.next()) {
                count++;
            }
            out.print(db.getCustDetails());
            if (count == 0) {
                pst = con.prepareStatement(db.getCustDetails());
                pst.setString(1, firstname);
                pst.setString(2, lastname);
                pst.setString(3, email);
                pst.setString(4, gender);
                pst.setString(5, country);
                pst.setString(6, address);
                pst.setString(7, "");
                pst.setString(8, city);
                pst.setString(9, state);
                pst.setString(10, "ADMIN");
                pst.setString(11, zip);
                pst.setString(12, phone);
                pst.setString(13, mobile_no);
                pst.setString(14, "0");
                pst.setString(15, status);
                pst.setString(16, user_code);
                pst.setString(17, user_name);
                pst.setString(18, password);
                pst.setString(19, img);
                pst.setString(20, storename);
                pst.setString(21, storedispname);
                pst.setString(22, website);
                pst.setString(23, org_type);
                pst.setString(24, date_format);
                pst.setString(25, base_currency);
                pst.setString(26, fax);

                update = pst.executeUpdate();
                if (update != 0) {
                    response.sendRedirect("create_admin.jsp?status=1&type=success&opt=" + session.getId());
                } else {
                    response.sendRedirect("create_admin.jsp?status=2&type=failed&opt=" + session.getId());
                }

            } else {
                response.sendRedirect("create_admin.jsp?status=3&type=alrdyexist&opt=" + session.getId());
            }

        } catch (Exception e) {
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
