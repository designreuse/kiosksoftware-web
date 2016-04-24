/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.schedule;

import com.loyalty.card.db.connect.DBConnect;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 *
 * @author surajit
 */
public class ScheduleJob implements Job {

    String c_date, membershippoint, sms_message, sms_alert_create_date;
    Connection con;
    Connection conn;
    Connection connn;
    Connection connnn;
    Statement st;
    ResultSet rs;

    public static final String ACCOUNT_SID = "AC6f0edff72532f2d6969e31dd52ca74d2";
    public static final String AUTH_TOKEN = "57541a7cc331fe7a4b9cd5714db98929";

    public void execute(JobExecutionContext context)
            throws JobExecutionException {

        try {
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            //get current date time with Date()
            java.util.Date datee = new java.util.Date();
            String crrnt_date_time[] = dateFormat.format(datee).split("\\s+");
            c_date = crrnt_date_time[0];
            con = DBConnect.getConnect();
            conn = DBConnect.getConnect();
            connn = DBConnect.getConnect();
            connnn = DBConnect.getConnect();

            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM loyalty_promotionoffer WHERE sms_alert_create_date='" + c_date + "'");
            while (rs.next()) {
                String mem_grp_id = rs.getString("mem_grp_id");
                sms_message = rs.getString("sms_message");
                sms_alert_create_date = rs.getString("sms_alert_create_date");
                Statement st_g = conn.createStatement();
                ResultSet rs_g = st_g.executeQuery("SELECT * FROM loyalty_membergroup WHERE status='active' AND id=" + mem_grp_id);
                if (rs_g.next()) {
                    membershippoint = rs_g.getString("membershippoint");
                }
            }
            if (sms_alert_create_date.equals(c_date)) {
                Statement st_m = connn.createStatement();
                ResultSet rs_m = st_m.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE trigerFlag='0'");
                while (rs_m.next()) {
                    String points = rs_m.getString("points");
                    if (points.equals(membershippoint)) {
                        int member_id = rs_m.getInt("id");
                        String fullname = rs_m.getString("fullname");
                        String phone_no = rs_m.getString("phone_no");
                        System.out.println(fullname + " " + phone_no);

                        Statement st_u = connnn.createStatement();
                        int update = st_u.executeUpdate("UPDATE sengroup_new_member_reg_details SET trigerFlag='1' WHERE id=" + member_id);

                        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

                        // Build the parameters 
                        List<NameValuePair> params_sms = new ArrayList<NameValuePair>();
                        params_sms.add(new BasicNameValuePair("From", "+12028313299"));
                        params_sms.add(new BasicNameValuePair("To", "+91" + phone_no)); // Replace with a valid phone number
                        params_sms.add(new BasicNameValuePair("Body", sms_message));
                        MessageFactory messageFactory = client.getAccount().getMessageFactory();
                        Message message = messageFactory.create(params_sms);

                        System.out.println("SMSResp" + message.getSid());

                    } else {
                        System.out.println("No Record");
                    }
                }
            } else {
                System.out.println("Not current date");
            }

        } catch (Exception ex) {
        } finally {
            try {
                con.close();
                conn.close();
                connn.close();
                connnn.close();

            } catch (SQLException ex) {
                Logger.getLogger(ScheduleJob.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
