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
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author surajit
 */
public class Daily_Purchase_Entry extends HttpServlet {

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
     /*   String member_id = request.getParameter("member_id");
        String item_name = request.getParameter("item_name");
        String unit_price = request.getParameter("unit_price");
        String points = request.getParameter("points");
        String total_points = request.getParameter("total_points");
        String quantity = request.getParameter("quantity");
        String adminid = request.getParameter("adminid");
        String date = request.getParameter("date");
        
        Connection con = null;
        Statement st = null;
        Statement stsearch = null;
        Statement stsearchkiosk = null;
        Statement stsearchkioskmain = null;
        ResultSet rs = null;
        ResultSet rssearch = null;
        ResultSet rssearchkiosk = null;
        ResultSet rssearchkioskmain = null;
        Connection conn = null;
        Connection connn = null;
        Connection connnsear = null;
        Connection connnsearkiosk = null;
        Connection connnsearkioskmain = null;
        
        String available_point = null;
        int totalpoint = 0;
        int countee = 0, counter = 0;
        
        try {
            /*
            TODO output your page here. You may use following sample code.
            */
        /*    connnsearkioskmain=DBConnect.getConnect();
            stsearchkioskmain=connnsearkioskmain.createStatement();
            rssearchkioskmain=stsearchkioskmain.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan WHERE admin_id='" + adminid + "' && status='active'");
            while (rssearchkioskmain.next()) 
            {
                counter++;
                
            }
            connnsearkiosk = DBConnect.getConnect();
            stsearchkiosk = connnsearkiosk.createStatement();
            rssearchkiosk = stsearchkiosk.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan WHERE admin_id='" + adminid + "' && status='active'");
            while (rssearchkiosk.next()) 
            {
                 out.print("admin"+countee+"before");
                connnsear = DBConnect.getConnect();
                stsearch = connnsear.createStatement();
                rssearch = stsearch.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE kiosk_ip='" + rssearchkiosk.getString("allocate_ip") + "'");
                while (rssearch.next()) 
                {
                    countee++;
                    out.print(countee);
                }
            }
            
            if (countee != 0 && counter!=0) {
               // out.print("Parwez");
                conn = DBConnect.getConnect();
                st = conn.createStatement();
                rs = st.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE member_id='" + member_id + "'");
                while (rs.next()) {
                    available_point = rs.getString("points");
                }
                totalpoint = Integer.parseInt(available_point) + Integer.parseInt(points);
                int update = 0;
                con = DBConnect.getConnect();
                PreparedStatement pst = con.prepareStatement("INSERT INTO loyalty_daily_purchase_details(member_id,item_name,unit_price,points,total_price,quantity,date,adminid) VALUES(?,?,?,?,?,?,?,?)");
                pst.setString(1, member_id);
                pst.setString(2, item_name);
                pst.setString(3, unit_price);
                pst.setString(4, points);
                pst.setString(5, total_points);
                pst.setString(6, quantity);
                pst.setString(7, date);
                pst.setString(8, adminid);
                update = pst.executeUpdate();
                
                connn = DBConnect.getConnect();
                Statement stup = connn.createStatement();
                stup.executeUpdate("UPDATE sengroup_new_member_reg_details SET points='" + totalpoint + "' WHERE member_id='" + member_id + "'");
                if (update != 0) {
                    response.sendRedirect("daily_purchase_entry.jsp?status=1&opt=" + session.getId());
                } else {
                    response.sendRedirect("daily_purchase_entry.jsp?status=2&opt=" + session.getId());
                }
            } else {
                response.sendRedirect("daily_purchase_entry.jsp?status=2&opt=" + session.getId());
            }
        } catch (SQLException ex) {
            Logger.getLogger(Daily_Purchase_Entry.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }*/
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        try{
            String memId = request.getParameter("memId");
            String item_id = request.getParameter("item_name");
            String p_offer_id = request.getParameter("promo_offer");
            DateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
            Date dt = new Date();
            String curdt = dft.format(dt);
            con = DBConnect.getConnect();
            String item_name="";
            ps = con.prepareStatement("SELECT item_name FROM loyalty_item_details WHERE id='"+item_id+"'");
            rs = ps.executeQuery();
            if(rs.next()){
                item_name = rs.getString("item_name");
            }
            
            ps = con.prepareStatement("INSERT INTO member_item_promotionoffer (member_id,item_id,item_name,promotion_offer_id,create_date) VALUES ('"+memId+"','"+item_id+"','"+item_name+"','"+p_offer_id+"','"+curdt+"')");
            int updt = ps.executeUpdate();
            if(updt!=0)
                response.sendRedirect("daily_purchase_entry.jsp?status=1&opt=" + session.getId());
            else
                response.sendRedirect("daily_purchase_entry.jsp?status=2&opt=" + session.getId());
            
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
