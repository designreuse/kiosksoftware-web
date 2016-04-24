<%-- 
    Document   : create_role_action
    Created on : 1 Sep, 2015, 11:57:33 AM
    Author     : parwez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conn.jsp" %>
<%  
    String edit = request.getParameter("edit");
    Connection con = null;
    PreparedStatement pst = null;
    if(edit.equals("0")){
        String set_timer = request.getParameter("set_timer");
        String adminid = request.getParameter("adminid");
        String status = request.getParameter("status");
        
        int updateQuery = 0;
        int c = 0;

        try{
        pst = conn.prepareStatement("SELECT id FROM loyalty_auto_timer_details WHERE adminid='"+adminid+"'");
        java.sql.ResultSet rse = pst.executeQuery();
        while (rse.next()) {
            try{c = rse.getInt("id");if(c+""==null)c=0;}catch(Exception e){e.printStackTrace();}
        }

        String sql="";

        if(c == 0){
            sql = "INSERT INTO loyalty_auto_timer_details (set_timer,status,adminid) VALUES('"+set_timer+"','"+status+"','"+adminid+"')";
        }else{
            sql = "UPDATE loyalty_auto_timer_details SET set_timer='"+set_timer+"',status='"+status+"' WHERE id="+c;
        }

        pst = conn.prepareStatement(sql);
        int updt = pst.executeUpdate();
        if (updt!= 0) {
            response.sendRedirect("create_auto_timer.jsp?status=1&opt="+session.getId());
        } else {
            response.sendRedirect("create_auto_timer.jsp?status=2&opt="+session.getId());
        }

        }catch(Exception e){e.printStackTrace();}

    }else if(edit.equals("1")){
        
        try{
            String sttimer = request.getParameter("settimer");
            String stat = request.getParameter("status");
            String adminid = request.getParameter("adminid1");
            int tempid=0;
            pst = conn.prepareStatement("SELECT id FROM loyalty_auto_timer_details WHERE adminid='"+adminid+"'");
            java.sql.ResultSet rs = pst.executeQuery();
            while(rs.next()){
                try{tempid = rs.getInt("id");if(tempid+""==null)tempid=0;}catch(Exception e){e.printStackTrace();}
            }
            
            DateFormat dft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date dt = new java.util.Date();
            String curdt = dft.format(dt);
            
            int update=0;
            if(tempid!=0){
                pst = conn.prepareStatement("UPDATE loyalty_auto_timer_details SET set_timer='"+sttimer+"',status='"+stat+"',date_modified='"+curdt+"' WHERE id="+tempid);
                update = pst.executeUpdate();
            }
            
            if(update!=0)
                response.sendRedirect("create_auto_timer.jsp?status=1&opt="+session.getId());
            else
                response.sendRedirect("create_auto_timer.jsp?status=2&opt="+session.getId());
            
        }catch(Exception e){e.printStackTrace();}
    }
    
%>