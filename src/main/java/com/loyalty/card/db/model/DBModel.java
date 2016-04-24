/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.db.model;

/**
 *
 * @author mrinal
 */
public class DBModel {
    String user_reg="INSERT INTO loyalty_user_reg_details(admin_code,fullname,username,password,contact_no,current_location,email,phone_no,toll_free_no,address,user_type,fax_no,alternet_email_id,user_image,flag,status,user_code) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String super_details="INSERT INTO loyalty_superadmin_all_details(firstname,lastname,website,organization_type,postal_country,postal_state,postal_city,postal_address,Postal_zip,physical_country,physical_state,physical_city,physical_address,physical_zip,contact_no,email_id,fax,sales_ph_no,marketing_ph_no,in_trial_ph_no,billing_accounts_no,support_email,sales_email,paypal_email_id,paypal_display_name,paypal_client_name,paypal_secret_token,logo,user_code) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String subscription_details="INSERT INTO loyalty_subscription_details(subscription_plan_name,price,pricing_type,plan_description,discount,status,offer_from,offer_to,user_code,user_name,user_type,subscription_order) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    String cust_reg_details="INSERT INTO loyalty_customer_reg_details(firstname,lastname,email,gender,country,address,apartment,city,state,user_type,zip,phone,mobile_no,flag,status,user_code,user_name,password,image,storename,storedispname,website,org_type,date_format,base_currency,fax) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String user_reg_details="INSERT INTO loyalty_user_reg_details(fullname,contact_no,present_state,present_dist,present_pin_code,present_address,designation,permanent_state,permanent_district,permanent_pincode,permanent_address,user_type,admin_code,status,user_code,user_name,password) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    public DBModel(){}
    public String getUserRegistrationDetails(){
        return user_reg;
    }
    public String getSuperAdminDetails(){
        return super_details;
    }
    public String getSubscriptionDetails(){
        return subscription_details;
    }
    public String getCustDetails(){
        return cust_reg_details;
    }
    public String getUserDetails(){
        return user_reg_details;
    }
    }
    
