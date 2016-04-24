/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.db.connect;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mrinal
 */
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 *
 * @author trcs
 */
public class DBConnect {
   public static Connection getConnect()
	{
		Connection con=null;
		try
		{

			Properties prop=new Properties();
                        InputStream in=DBConnect.class.getResourceAsStream("/com/loyalty/card/db/properties/MySqlDatabase.properties");
                        prop.load(in);
                        final String driver=prop.getProperty("MYSQL.DRIVER");
                        final String dburl = prop.getProperty("MYSQL.DBURL");
                        final String host=prop.getProperty("MYSQL.HOSTIP");
                        final String dbname = prop.getProperty("MYSQL.DBNAMENEW");
                        final String uname = prop.getProperty("MYSQL.UNAME");
                        final String pass = prop.getProperty("MYSQL.PASSWORD");
			Class.forName(driver);
			con=(Connection)DriverManager.getConnection(dburl+host+"/"+dbname,uname,pass);
                        System.out.print("Successfull");
                        System.out.println(con);
		}
		catch(Exception e){System.out.print("Failed......."+e);}
		return con;
	}
    public static void main(String args[])
    {
              Connection con;
              System.out.println(DBConnect.getConnect());
    }
}

