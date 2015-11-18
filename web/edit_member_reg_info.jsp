<%-- 
    Document   : edit_member_reg_info
    Created on : 29 Jun, 2015, 12:19:26 PM
    Author     : sukanya

--%>

<%
    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    String cus_id = (String) session.getAttribute("cus_id");
    String member_id = request.getParameter("member_id");
    if (user_name != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>AdminLTE 2 | Dashboard</title>
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
                        Update Member Details

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
                        <%
                        java.sql.Statement st = conn.createStatement();
                        java.sql.ResultSet rs = st.executeQuery("SELECT * FROM sengroup_new_member_reg_details  WHERE member_id='"+member_id+"'");
                        while(rs.next()){
                        %>
                        <form role="form" action="update_memeber_info_action.jsp" method="POST" >
                            <div class="col-md-6">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div><!-- /.box-header -->
                                    <!-- form start -->

                                    <div class="box-body">
                                        <input type="hidden" name="member_id" id="member_id" value="<%=member_id%>" />
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" class="form-control" id="fname" value="<%=rs.getString("fullname")%>" name="fname">
                                        </div>
                                        <div class="form-group">
                                            <label> Address </label>
                                            <input type="text" class="form-control" value="<%=rs.getString("present_address")%>" name="address" id="address">

                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" value="<%=rs.getString("email")%>" name="email" id="email">
                                        </div>
                                        <div class="form-group">
                                            <label>Points</label>
                                            <input type="number" class="form-control" value="<%=rs.getString("points")%>" name="points" id="points">
                                        </div>





                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div><!-- /.box-body -->



                                </div><!-- /.box -->


                            </div>
                            <div class="col-md-6">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">

                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Member ID</label>
                                            <input type="text" class="form-control" disabled="" value="<%=rs.getString("member_id")%>" name="member_idd" id="member_idd">
                                        </div>



                                        <div class="form-group">
                                            <label>Phone No</label>
                                            <input type="text" id="ph_no" name="ph_no" value="<%=rs.getString("phone_no")%>"  class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Status</label>
                                            <input type="text" id="status" name="status" value="<%=rs.getString("status")%>"  class="form-control">
                                        </div>



                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (right) -
                            <!-- /.box-body -->
                        </form>
                        <%}%>
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
<%} else {
        response.sendRedirect("super_admin_login.jsp");
    }%>
