<%-- 
    Document   : test_barcode
    Created on : 4 Aug, 2015, 6:21:42 PM
    Author     : surajit
--%>

<%@page import="com.keepautomation.barcode.IBarCode"%>
<%@page import="com.keepautomation.barcode.BarCode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    BarCode barcode = new BarCode();
    barcode.setCodeToEncode("123456789");
    barcode.setSymbology(IBarCode.CODE128);
    barcode.setX(2);
    barcode.setY(50);
    barcode.setRightMargin(0);
    barcode.setLeftMargin(0);
    barcode.setTopMargin(0);
    barcode.setBottomMargin(0);
    barcode.setChecksumEnabled(false);
    barcode.setFnc1(IBarCode.FNC1_NONE);
    try {
        barcode.draw(request.getContextPath()+"code128.gif");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>