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
public class create_subscription_plan extends HttpServlet {

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
        HttpSession session=request.getSession();
        try {
            /* TODO output your page here. You may use following sample code. */
            String subscription_plan_name= request.getParameter("plan_nm");
            String price= request.getParameter("price");
            String pricing_type= request.getParameter("p_type");
            String plan_description= request.getParameter("plan_des");
            String discount= request.getParameter("discount");
            String status= request.getParameter("status");
            String offer_from= request.getParameter("ofr_frm");
            String offer_to= request.getParameter("ofer_to");
            String subscription_order= request.getParameter("sub_order");
            Connection con=null;
            Statement st=null;
            PreparedStatement pst=null;
            ResultSet rs=null;
            int update=0;
            DBModel db=new DBModel();
            con=DBConnect.getConnect();
            pst=con.prepareStatement(db.getSubscriptionDetails());
            pst.setString(1,subscription_plan_name);
            pst.setString(2,price );
            pst.setString(3,pricing_type );
            pst.setString(4,plan_description );
            pst.setString(5,discount );
            pst.setString(6,status );
            pst.setString(7,offer_from );
            pst.setString(8,offer_to );
            pst.setString(9,"");
            pst.setString(10,"" );
            pst.setString(11,"" );
            pst.setString(12,subscription_order );
            update=pst.executeUpdate();
            if(update!=0)
            {
              response.sendRedirect("create_subscription_plan.jsp?status=1&type=success&opt="+session.getId());
            }
            else{
                response.sendRedirect("create_subscription_plan.jsp?status=2&type=failed&opt="+session.getId());
            }
            
            
        }catch(Exception e){} 
        finally {
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
