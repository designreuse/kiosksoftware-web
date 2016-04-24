/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.admin.masters;

import com.loyalty.card.db.connect.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xent30
 */
public class createItem extends HttpServlet {

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
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        try {
            String it_name = request.getParameter("item_name");
            String uprice = request.getParameter("unit_price");
            String tot_price = request.getParameter("total_price");
            String dt = request.getParameter("date");
            String desc = request.getParameter("item_desc");
            String points = request.getParameter("points");
            String quantity = request.getParameter("quantity");
            
            con = DBConnect.getConnect();
            ps = con.prepareStatement("INSERT INTO loyalty_item_details(item_name,item_desc,quantity,unit_price,total_price,points,create_date) VALUES ('"+it_name+"','"+desc+"','"+quantity+"','"+uprice+"','"+tot_price+"','"+points+"','"+dt+"')");
            int update = ps.executeUpdate();
            if(update!=0)
                response.sendRedirect("create_item.jsp?status=1&opt="+session.getId());
            else
                response.sendRedirect("create_item.jsp?status=2&opt="+session.getId());
            
        }catch(Exception e){e.printStackTrace();}
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
