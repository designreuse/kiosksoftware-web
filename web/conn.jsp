<%-- 
    Document   : conn
    Created on : 25 Jun, 2015, 3:36:24 PM
    Author     : sukanya
--%>

<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*" %> 

<%

//try{
    String connectionURL = "jdbc:mysql://localhost:3306/kiosk_db";
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection(connectionURL, "root", "root");
//}catch(Exception ex){}

%>
