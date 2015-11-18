/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.admin.masters;

import com.loyalty.card.db.connect.DBConnect;
import com.loyalty.card.db.model.DBModel;
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
public class admin_login_auth extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String user_name = request.getParameter("unm");
            String password = request.getParameter("pwd");

            Connection con = null;
            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            Statement st = null;
            Statement stt = null;
            int update = 0;
            DBModel db = new DBModel();
            con = DBConnect.getConnect();
            conn = DBConnect.getConnect();
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM loyalty_customer_reg_details WHERE user_name='" + user_name + "' AND password='" + password + "'");
            if (rs.next()) 
            {
                session.setAttribute("user_name", rs.getString("user_name"));
                session.setAttribute("cus_id", rs.getString("cus_id"));
                session.setAttribute("user_code", rs.getString("user_code"));
                session.setAttribute("mobile_no", rs.getString("mobile_no"));
                session.setAttribute("firstname", rs.getString("firstname"));
                session.setAttribute("lastname", rs.getString("lastname"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("image", rs.getString("image"));
                session.setAttribute("storedisp", rs.getString("storedispname"));
                //out.print(rs.getString("image")+"its a rs value  ");
               // out.print(session.getAttribute("image"));
                stt = conn.createStatement();
                update = stt.executeUpdate("UPDATE loyalty_customer_reg_details SET flag='1' WHERE user_code='" + rs.getString("user_code") + "'");
                response.sendRedirect("dashboard.jsp?status=success_login&otp=" + session.getId());
            } else {
                response.sendRedirect("index.jsp?status=1&otp=" + session.getId());
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
