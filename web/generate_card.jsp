<%-- 
    Document   : print_card
    Created on : 19 Aug, 2015, 11:38:31 AM
    Author     : surajit
--%>


<%@page import="com.businessrefinery.barcode.Barcode"%>

<%    String user_name = (String) session.getAttribute("user_name");
    String user_code = (String) session.getAttribute("user_code");
    String mobile_no = (String) session.getAttribute("mobile_no");
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
    String email = (String) session.getAttribute("email");
    String cus_id = (String) session.getAttribute("cus_id");
    if (user_name != null) {

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Generate Card</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.4 -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <!-- Mobile Specific Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- css -->
        <link href="css/card_style.css" type="text/css" rel="stylesheet">
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
        <!-- css -->

        <!-- js -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">

            function printContent(el) {
                var restorepage = document.body.innerHTML;
                var printcontent = document.getElementById(el).innerHTML;
                document.body.innerHTML = printcontent;
                window.print();
                document.body.innerHTML = restorepage;
            }

        </script>
        <script type="text/javascript">

            function PrintElem(elem)
            {
                Popup();
            }

            function Popup(data)
            {
                var div_content = $('#print_div').html();
                //alert(div_content);
                var mywindow = window.open('Print Card', 'Print Card', 'height=400,width=600');
                mywindow.document.write('<html>');
                mywindow.document.write('<html><title>Print Card</title>');
                mywindow.document.write('<body>');
                mywindow.document.write(div_content);
                mywindow.document.write('</body></html>');

                mywindow.print();
                mywindow.close();

                return true;
            }

        </script>

    </head>
    <body class="skin-blue sidebar-mini">
        <div class="wrapper">

            <%@include file="header/dashboard_header.jsp" %>
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="menu/admin_menu.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Generate Card

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <%      try {
                                if (request.getParameter("status").equals("1")) {
                        %>
                        <div style=" background: green; padding: 3px 3px 3px 3px; width: 97% ; margin-left: 15px; margin-bottom: 5px;color: #ffffff; ">
                            Card Generated.
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                            There Goes Something Wrong 
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                        <form role="form" action="generate_card.jsp" method="get" >
                            <div class="col-md-6">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Member ID / Mobile No / Email-id</label>
                                            <input type="text" class="form-control" required="" id="member_id" name="member_id" placeholder="Enter Member ID or Mobile No or Email id">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>

                                    <%
                        try{
                                        String member_id = request.getParameter("member_id");
                                        java.sql.Statement stCHKKK = conn.createStatement();
                                        java.sql.ResultSet rsstCHKKK = stCHKKK.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE member_id='" + member_id + "' or phone_no='" + member_id + "' or email='" + member_id + "'");
                                        if (rsstCHKKK.next()) {

                                            if (request.getParameter("member_id") != null) {

                                                java.sql.Statement st = conn.createStatement();
                                                java.sql.ResultSet rs = st.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE member_id='" + member_id + "' or phone_no='" + member_id + "' or email='" + member_id + "'");
                                                if (rs.next()) {

                                                    //out.print("pk");
                                                    System.out.print("pk");
                                                    int random_code = (int) (Math.random() * 1000000);
                                                    String dir = request.getRealPath("/uploads/");
                                                    //out.print(dir+"path");
                                                    Barcode barcode = new Barcode();
                                                    barcode.setSymbology(Barcode.CODE128A);
                                                    barcode.setCode(Integer.toString(random_code));
                                                    String image_name = rs.getString("member_id") + ".png";

                                                 //out.print(image_name+".png");

                                    %>
                                    <div class="home-bg">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12 text-center" id="print">
                                                    <div class="card_bgr" >
                                                        <div class="card_left clearfix">
                                                            <h3>Loyalty card name</h3>
                                                            <h4>Member ID: <%=rs.getString("member_id")%></h4>
                                                            <h4>Name: <%=rs.getString("fullname")%></h4>

                                                            <h4>Email: <%=rs.getString("email")%></h4>
                                                            <h4>Phone No: <%=rs.getString("phone_no")%></h4>

                                                            <h4><%=rs.getString("present_address")%></h4>

                                                        </div>
                                                        <div class="card_right"><img src="images/rt_pic.jpg" alt=""></div>
                                                        <div class="clear"></div>
                                                        <div class="bar_code" id="print_div"><img src="uploads/<%=image_name%>" alt=""></div>
                                                    </div>
                                                    <div class="clear"></div>
                                                    <input type="button" class="prnt btn btn-warning" value="PRINT" onclick="PrintElem()">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                                    barcode.drawImage2File(dir + "/" + image_name);
                                                    java.sql.Statement st_ge = conn.createStatement();
                                                    int update = st_ge.executeUpdate("UPDATE sengroup_new_member_reg_details SET loyalty_card_nos='" + Integer.toString(random_code) + "',images='" + image_name + "' WHERE member_id='" + member_id + "' or phone_no='" + member_id + "' or email='" + member_id + "'");

                                                } else {
                                                    response.sendRedirect("generate_card.jsp?staus=2&opt=" + session.getId());
                                                }
                                            }
                                        } else {
                                            response.sendRedirect("generate_card.jsp?staus=2&opt=" + session.getId());
                                        }
                                        }catch(Exception e){}
                                    %>



                                </div><!-- /.box -->


                            </div>
                            <!--/.col (right) -
                            <!-- /.box-body -->
                        </form>

                    </div><!-- /.box -->
            </div><!--/.col (left) -->
            <!-- right column -->

        </div>   <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<%@include file="footer/footer.jsp" %>

<!-- Control Sidebar -->

<!-- Add the sidebar's background. This div must be placed
     immediately after the control sidebar -->


<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js" type="text/javascript"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js" type="text/javascript"></script>
</body>
</html>

<%  
                        } else {
        response.sendRedirect("index.jsp");
    }
%>
