/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.superadmin.master;

import com.loyalty.card.db.connect.DBConnect;
import com.loyalty.card.db.model.DBModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class log_in extends HttpServlet {

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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String user_name = request.getParameter("unm");
            String password = request.getParameter("pwd");
            Connection con = null;
            ResultSet rs = null;
            Statement st = null;
            DBModel db = new DBModel();
            con = DBConnect.getConnect();
            int update = 0;
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM loyalty_superadmin_login_details WHERE username='" + user_name + "' AND password='" + password + "'");
            if (rs.next()) {
                session.setAttribute("user_name", rs.getString("username"));
                session.setAttribute("user_type", rs.getString("user_type"));
                session.setAttribute("user_code", rs.getString("user_code"));
                java.sql.Statement stall = con.createStatement();
                java.sql.ResultSet rsall = stall.executeQuery("SELECT * FROM loyalty_superadmin_all_details WHERE user_code='" + rs.getString("user_code") + "'");
                while (rsall.next()) {
                    session.setAttribute("image", rsall.getString("logo"));
                    session.setAttribute("firstname", rsall.getString("firstname"));
                    session.setAttribute("lastname", rsall.getString("lastname"));
                    session.setAttribute("contact_no", rsall.getString("contact_no"));
                    session.setAttribute("email_id", rsall.getString("email_id"));
                    //session.setAttribute("user_code", rsall.getString("user_code"));

                }

                response.sendRedirect("superdashboard.jsp?status=1&type=success&opt=" + session.getId());
            } else {
                response.sendRedirect("super_admin_login.jsp?status=2&type=failure&opt=" + session.getId());
            }

        } catch (Exception e) {
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
