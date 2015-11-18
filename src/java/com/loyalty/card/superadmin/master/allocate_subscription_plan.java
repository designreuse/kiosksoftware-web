/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.superadmin.master;

import com.loyalty.card.db.connect.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author parwez
 */
public class allocate_subscription_plan extends HttpServlet {

    public String random_string_s() {
        java.util.Random r = new java.util.Random();
        long i = 1, n = 0;
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
            i = r.nextInt(100000000);
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

        String admin_id = request.getParameter("admin_id");
        String plan = request.getParameter("plan");

        Connection con = null;
        PreparedStatement pst = null;
        int updateQuery = 0;

        Connection conn = null;
        int i = 0;
        int admin_availablechk = 0;
        String suboffer = "";

        Connection conIn = null;
        try {

            con = DBConnect.getConnect();
            Statement st = con.createStatement();
            ResultSet rse = st.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan WHERE admin_id='" + admin_id + "' AND status='active'");
            while (rse.next()) {
                admin_availablechk++;
            }
            if (admin_availablechk != 0) {
                out.println("Already Active");
            } else {

                conn = DBConnect.getConnect();
                Statement st1 = conn.createStatement();
                ResultSet rschk = st1.executeQuery("SELECT * FROM loyalty_subscription_details WHERE id=" + plan);
                while (rschk.next()) {
                    suboffer = rschk.getString("subscription_order");
                }
                out.println(suboffer);

                if (Integer.parseInt(suboffer) != 0) {
                    for (int c = 0; c < Integer.parseInt(suboffer); c++) {
                        out.println(random_string_s() + ",");
                        String sql = "INSERT INTO loyalty_allocate_subscription_plan (admin_id,subscriber_id,license_nos,status) VALUES (?,?,?,?)";
                        conIn = DBConnect.getConnect();
                        pst = conIn.prepareStatement(sql);
                        pst.setString(1, admin_id);
                        pst.setString(2, plan);
                        pst.setString(3, random_string_s());
                        pst.setString(4, "active");

                        updateQuery = pst.executeUpdate();

                    }
                }
                if (updateQuery != 0) {
                    response.sendRedirect("allocate_subscription_plan.jsp?status=1&type=success&opt=" + session.getId());
                }
            }
            //out.println(admin_id + " " + plan);
//            for(int i=0;){
//                
//            }
//            if (admin_availablechk == 0) {
//
//                String sql = "INSERT INTO loyalty_allocate_subscription_plan (admin_id,subscriber_id,license_nos,status) VALUES (?,?,?,?)";
//                con = DBConnect.getConnect();
//                pst = con.prepareStatement(sql);
//                pst.setString(1, admin_id);
//                pst.setString(2, plan);
//                pst.setString(3, "");
//                pst.setString(4, "active");
//
//                updateQuery = pst.executeUpdate();
//                if (updateQuery != 0) {
//                    response.sendRedirect("allocate_subscription_plan.jsp?status=1&type=success&opt=" + session.getId());
//                }
//            } else {
//
//                response.sendRedirect("allocate_subscription_plan.jsp?status=2&type=failed&opt=" + session.getId());
//
//            }
        } catch (SQLException ex) {
            Logger.getLogger(allocate_subscription_plan.class.getName()).log(Level.SEVERE, null, ex);
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
