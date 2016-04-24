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
public class create_user extends HttpServlet {
    public String random_string_s()
	 {
	 	java.util.Random r = new java.util.Random();
    		int i = 1, n = 0;
    		char c;
    		String str="";
    		for (int t = 0; t < 2; t++)
    		{
        		while (true)
        		{
            		i = r.nextInt(10);
            		if (i > 5 && i < 10)
            		{
                		if (i == 9)
                		{
                    		i = 90;
                    		n = 90;
                    		break;
                		}
                		if (i != 90)
                		{
                    		n = i * 10 + r.nextInt(10);
                    		while (n < 65)
                    		{
                        		n = i * 10 + r.nextInt(10);
                    		}
                		}

                		break;
            		}
        		}
        		c=(char)n;
        		str= String.valueOf(c)+str;
    		}
    		while(true)
    		{
    			i = r.nextInt(1000);
    			if(i>99)
        		break;
    		}
    		str=str+i;
    		return(str);
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
        HttpSession session=request.getSession();
        try {
            /* TODO output your page here. You may use following sample code. */
            String fullname=request.getParameter("full_nm");
            String contact_no=request.getParameter("con_no");
            String present_state=request.getParameter("pre_state");
            String present_dist=request.getParameter("pre_dist");
            String present_pin_code=request.getParameter("pre_pin");
            String present_address=request.getParameter("pre_add");
            String designation=request.getParameter("designation");
            String permanent_state=request.getParameter("per_state");
            String permanent_district=request.getParameter("per_dist");
            String permanent_pincode=request.getParameter("per_pin");
            String permanent_address=request.getParameter("per_add");
            String user_type=request.getParameter("u_type");
            String admin_code=request.getParameter("a_code");
            String status=request.getParameter("status");
            String user_code="user"+random_string_s();
            String user_name=request.getParameter("unm");
            String password=request.getParameter("pwd");
            Connection con=null;
            Connection conn=null;
            PreparedStatement pst=null;
            ResultSet rs=null;
            Statement st =null;
            int update=0;
            int count=0;
            DBModel db = new DBModel();
            con=DBConnect.getConnect();
            conn=DBConnect.getConnect();
            st=conn.createStatement();
            rs=st.executeQuery("SELECT * FROM loyalty_user_reg_details WHERE user_name='"+user_name+"' OR contact_no='"+contact_no+"' ");
            
            while(rs.next())
            {
            count++;
            }
            if(count==0)
            {
            pst=con.prepareStatement(db.getUserDetails());
            pst.setString(1,fullname );
            pst.setString(2, contact_no);
            pst.setString(3,present_state);
            pst.setString(4,present_dist);
            pst.setString(5,present_pin_code);
            pst.setString(6, present_address);
            pst.setString(7,designation);
            pst.setString(8, permanent_state);
            pst.setString(9, permanent_district);
            pst.setString(10,permanent_pincode);
            pst.setString(11,permanent_address);
            pst.setString(12, "EMP");
            pst.setString(13, admin_code);
            pst.setString(14, status);
            pst.setString(15, user_code);
            pst.setString(16, user_name);
            pst.setString(17, password);
           update=pst.executeUpdate();
           if(update!=0){
               response.sendRedirect("create_user.jsp?status=1&type=success&opt=" +session.getId());
           }else{
               response.sendRedirect("create_user.jsp?status=2&type=failed&opt=" +session.getId());
           }
                          
                         
                 
               
            } else{
                response.sendRedirect("create_user.jsp?status=3&type=alrdyexist&opt=" +session.getId());
            }
            
           
            
            
        } catch(Exception e){}
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
