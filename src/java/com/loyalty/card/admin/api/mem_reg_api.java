/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.admin.api;

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
import org.json.JSONObject;

/**
 *
 * @author mrinal
 */
public class mem_reg_api extends HttpServlet {
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        JSONObject jobj=new JSONObject();
        try {
            String dir=request.getRealPath("/uploads/");
            MultipartRequest req = new MultipartRequest(request, dir,5024 * 1024, new FileRenamePolicy() {
           
               @Override
               public File rename(File f) {
               //Get the parent directory path as in h:/home/user or /home/user
               String parentDir = f.getParent( );
               //Get filename without its path location, such as 'index.txt'
               String fname = f.getName( );
                //Get the extension if the file has one
                String fileExt = "";
                int i = -1;
                if(( i = fname.indexOf(".")) != -1){
                    fileExt = fname.substring(i);
                    fname = fname.substring(0,i);
                }
                //add the timestamp
                fname = fname + (""+( new java.util.Date( ).getTime( )));
                //piece together the filename
                fname = parentDir + System.getProperty(
                    "file.separator") + fname + fileExt;
                File temp = new File(fname);
                return temp;
              }
          });
            /* TODO output your page here. You may use following sample code. */
            
    String fullname= req.getParameter("fullname");
    String username= req.getParameter("username");
    String password= req.getParameter("password");
    String member_id= req.getParameter("member_id");
    String card_no= req.getParameter("card_no");
    String bonus_point= req.getParameter("bonus_point");
    String admin_code= req.getParameter("admin_code");
    String present_city= req.getParameter("present_city");
    String present_state= req.getParameter("present_state");
    String present_district= req.getParameter("present_district");
    String present_address= req.getParameter("present_address");
    String user_type= req.getParameter("user_type");
    String gender= req.getParameter("gender");
    String terms_n_cond= req.getParameter("terms_n_cond");
    String mobile_no= req.getParameter("mobile_no");
    String email= req.getParameter("email");
    String status= req.getParameter("status");
    String user_code= req.getParameter("user_code");
    String pin_code= req.getParameter("pin_code");
    String permanent_city= req.getParameter("permanent_city");
    String permanent_state= req.getParameter("permanent_state");
    String permanent_district= req.getParameter("permanent_district");
    String permanent_address= req.getParameter("permanent_address");
    String image= req.getFilesystemName("image");
    
    Connection con=null;
    PreparedStatement pst= null;
    ResultSet rs= null;
    Statement st =null;
    int update=0;
    DBModel db= new DBModel();
    con=DBConnect.getConnect();
    pst= con.prepareStatement("INSERT INTO loyalty_member_reg_details(fullname,username,password,member_id,card_no,bonus_point,admin_code,present_city,present_state,present_district,present_address,user_type,gender,terms_n_cond,mobile_no,email,status,user_code,pin_code,permanent_city,permanent_state,permanent_district,permanent_address,image) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    pst.setString(1,fullname);
    pst.setString(2,username);
    pst.setString(3,password);
    pst.setString(4,"MEM-"+random_string_s());
    pst.setString(5,card_no);
    pst.setString(6,bonus_point);
    pst.setString(7,admin_code);
    pst.setString(8,present_city);
    pst.setString(9,present_state);
    pst.setString(10,present_district);
    pst.setString(11,present_address);
    pst.setString(12,user_type);
    pst.setString(13,gender);
    pst.setString(14,terms_n_cond);
    pst.setString(15,mobile_no);
    pst.setString(16,email);
    pst.setString(17,status);
    pst.setString(18,user_code);
    pst.setString(19,pin_code);
    pst.setString(20,permanent_city);
    pst.setString(21,permanent_state);
    pst.setString(22,permanent_district);
    pst.setString(23,permanent_address);
    pst.setString(24,image);
    update=pst.executeUpdate();
    if(update!=0){
        jobj.put("msg","1");
        out.println(jobj);
    }
    else
    {
        jobj.put("msg","0");
        out.println(jobj);
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
