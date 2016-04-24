/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.admin.api;

/**
 *
 * @author surajit
 */
import java.util.HashMap;

public class PaymentBlue {

    public static void main(String[] args) {

        String ACCOUNT_ID = "100287554380";

        String SECRET_KEY = "95GG.8HOMYFKODCYDFRYRDFADDBYHAOA";

        String MODE = "TEST";

        BluePay rebill = new BluePay(
                ACCOUNT_ID,
                SECRET_KEY,
                MODE
        );

        // Set Customer Information
        HashMap<String, String> customerParams = new HashMap<String, String>();
        customerParams.put("firstName", "Bob");
        customerParams.put("lastName", "Tester");
        customerParams.put("address1", "1234 Test St.");
        customerParams.put("address2", "Apt #500");
        customerParams.put("city", "Testville");
        customerParams.put("state", "IL");
        customerParams.put("zip", "54321");
        customerParams.put("country", "USA");
        customerParams.put("phone", "123-123-12345");
        customerParams.put("email", "test@bluepay.com");
        rebill.setCustomerInformation(customerParams);

        // Set ACH Information
        HashMap<String, String> setACHParams = new HashMap<String, String>();
        setACHParams.put("routingNum", "122105278"); // Routing Number: 123123123
        setACHParams.put("accountNum", "6724301068"); // Account Number: 0523421
        setACHParams.put("accountType", "C"); // Account Type: Checking
        setACHParams.put("docType", "WEB"); // ACH Document Type: WEB
        rebill.setACHInformation(setACHParams);

        // Set recurring payment
        HashMap<String, String> rebillParams = new HashMap<String, String>();
        rebillParams.put("firstDate", "2015-01-01"); // Rebill Start Date: Jan. 1, 2015
        rebillParams.put("expr", "1 MONTH"); // Rebill Frequency: 1 MONTH
        rebillParams.put("cycles", "12"); // Rebill # of Cycles: 12
        rebillParams.put("amount", "15.00"); // Rebill Amount: $15.00
        rebill.setRebillingInformation(rebillParams);

        // Sets a Card Authorization at $0.00
        HashMap<String, String> authParams = new HashMap<String, String>();

        authParams.put("amount", "0.00");

        rebill.auth(authParams);

        // Makes the API Request with BluePay
        try {

            rebill.process();
            //System.out.println("Transaction Message: " + rebill.getMessage());

        } catch (Exception ex) {

            System.out.println("Exception: " + ex.toString());

            System.exit(1);

        }

        // If transaction was successful reads the responses from BluePay
        if (rebill.isSuccessful()) {

            System.out.println("Transaction ID: " + rebill.getTransID());

            System.out.println("Rebill ID: " + rebill.getRebillingID());

            System.out.println("Transaction Status: " + rebill.getStatus());

            System.out.println("Transaction Message: " + rebill.getMessage());

            System.out.println("Masked Payment Account: " + rebill.getMaskedPaymentAccount());

            System.out.println("Bank Name:" + rebill.getBankName());

        } else {

            System.out.println("Error: " + rebill.getMessage());

        }

    }

}
