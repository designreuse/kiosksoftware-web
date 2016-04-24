/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.admin.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;

/**
 *
 * @author surajit
 */
public class PaymentAction extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            String NAME = request.getParameter("NAME");
            String ADDR1 = request.getParameter("ADDR1");
            String STATE = request.getParameter("STATE");
            String ZIPCODE = request.getParameter("ZIPCODE");
            String PHONE = request.getParameter("PHONE");
            String CITY = request.getParameter("CITY");
            String COUNTRY = request.getParameter("COUNTRY");
            String EMAIL = request.getParameter("EMAIL");
            String LAST_NAME = request.getParameter("LAST_NAME");
            
            String ACH_ROUTING = request.getParameter("ACH_ROUTING");
            String ACH_ACCOUNT = request.getParameter("ACH_ACCOUNT");
            String AMOUNT = request.getParameter("AMOUNT");
            
            String ACCOUNT_ID = "100287554380";
            String SECRET_KEY = "95GG.8HOMYFKODCYDFRYRDFADDBYHAOA";
            String MODE = "TEST";
            BluePay rebill = new BluePay(
                    ACCOUNT_ID,
                    SECRET_KEY,
                    MODE
            );

            /*out.println(NAME);
             out.println(ADDR1);
             out.println(STATE);
             out.println(ZIPCODE);
             out.println(PHONE);
             out.println(CITY);
             out.println(COUNTRY);
             out.println(EMAIL);
             out.println(LAST_NAME);
             out.println(ACH_ROUTING);
             out.println(ACH_ACCOUNT);
             out.println(AMOUNT);*/
            HashMap<String, String> customerParams = new HashMap<String, String>();
            customerParams.put("firstName", NAME);
            customerParams.put("lastName", LAST_NAME);
            customerParams.put("address1", ADDR1);
            customerParams.put("address2", ADDR1);
            customerParams.put("city", CITY);
            customerParams.put("state", STATE);
            customerParams.put("zip", ZIPCODE);
            customerParams.put("country", COUNTRY);
            customerParams.put("phone", PHONE);
            customerParams.put("email", EMAIL);
            rebill.setCustomerInformation(customerParams);
            
            HashMap<String, String> setACHParams = new HashMap<String, String>();
            setACHParams.put("routingNum", ACH_ROUTING);
            setACHParams.put("accountNum", ACH_ACCOUNT);
            setACHParams.put("accountType", "C");
            setACHParams.put("docType", "WEB");
            rebill.setACHInformation(setACHParams);

            // Set recurring payment
            HashMap<String, String> rebillParams = new HashMap<String, String>();
            rebillParams.put("firstDate", "2015-01-01"); // Rebill Start Date: Jan. 1, 2015
            rebillParams.put("expr", "1 MONTH"); // Rebill Frequency: 1 MONTH
            rebillParams.put("cycles", "12"); // Rebill # of Cycles: 12
            rebillParams.put("amount", AMOUNT); // Rebill Amount: $15.00
            rebill.setRebillingInformation(rebillParams);
            
            HashMap<String, String> authParams = new HashMap<String, String>();
            authParams.put("amount", "0.00");
            rebill.auth(authParams);
            
            rebill.process();
            if (rebill.isSuccessful()) {
                response.sendRedirect("subscription_plans.jsp?trancId=" + rebill.getTransID() + "&rebillId=" + rebill.getRebillingID() + "&transcStatus=" + rebill.getStatus() + "&msg=" + rebill.getMessage() + "&status=1");
                System.out.println("Transaction ID: " + rebill.getTransID());
                System.out.println("Rebill ID: " + rebill.getRebillingID());
                System.out.println("Transaction Status: " + rebill.getStatus());
                System.out.println("Transaction Message: " + rebill.getMessage());
                System.out.println("Masked Payment Account: " + rebill.getMaskedPaymentAccount());
                System.out.println("Bank Name:" + rebill.getBankName());
            } else {
                response.sendRedirect("subscription_plans.jsp?msg=" + rebill.getMessage() + "&status=2");
                System.out.println("Error: " + rebill.getMessage());
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.toString());
            System.exit(1);
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
