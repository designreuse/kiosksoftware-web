<%-- 
    Document   : view_member
    Created on : 3 Jul, 2015, 3:41:55 PM
    Author     :sukanya
--%>
<%@include file="conn.jsp" %>

<%           String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    if (user_name != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%=config.getServletContext().getInitParameter("projectname")%> | View Member</title>
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
                        Member Details

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
                            String id = request.getParameter("id");
                            try {
                                java.sql.Statement st = conn.createStatement();
                                java.sql.ResultSet rs = st.executeQuery("SELECT * FROM loyalty_member_reg_details WHERE id='" + id + "' ");
                                while (rs.next()) {%>
                        <form role="form" action="#" method="POST" >
                            <div class="col-md-6">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div><!-- /.box-header -->
                                    <!-- form start -->

                                    <div class="box-body">


                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <input type="text" class="form-control" readonly="" id="full_nm" name="full_nm" value="<%= rs.getString("fullname")%>">
                                        </div>
                                        <div class="form-group">
                                            <label>User Name</label>
                                            <input type="text" class="form-control" readonly="" name="unm" id="unm" value="<%= rs.getString("username")%>">
                                        </div>
                                        <div>
                                            <label> Password </label>
                                            <input type="password" readonly="" class="form-control" name="pwd" id="pwd" value="<%= rs.getString("password")%>">
                                        </div>

                                        <div class="form-group">
                                            <label> Member Id</label>
                                            <input type="text" class="form-control" name="md" readonly="" id="md" value="<%= rs.getString("member_id")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> Card No</label>
                                            <input type="text" class="form-control" name="card_no" readonly="" id="card_no" value="<%= rs.getString("card_no")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> Bonus Point</label>
                                            <input type="text" class="form-control" name="bp" id="bp"  readonly=""value="<%= rs.getString("bonus_point")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> Admin Code</label>
                                            <input type="text" class="form-control" name="acd" id="acd"  readonly=""value="<%= rs.getString("admin_code")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> Present City</label>
                                            <input type="text" class="form-control" name="pct" id="pct" readonly="" value="<%= rs.getString("present_city")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> Present State</label>
                                            <input type="text" class="form-control" name="ps" readonly="" id="ps" value="<%= rs.getString("present_state")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> User Code</label>
                                            <input type="text" class="form-control" name="u_code" readonly="" id="u_code" value="<%= rs.getString("user_code")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> pin_code</label>
                                            <input type="text" class="form-control" name="pin_code" readonly="" id="pin_code" value="<%= rs.getString("pin_code")%>">

                                        </div>

                                        <button type="submit" class="btn btn-primary">Submit</button>
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
                                            <label> Permanent City</label>
                                            <input type="text" class="form-control" name="permanent_city" readonly="" id="permanent_city" value="<%= rs.getString("permanent_city")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> permanent state</label>
                                            <input type="text" class="form-control" name="permanent_state"  readonly=""id="permanent_state" value="<%= rs.getString("permanent_state")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> permanent District</label>
                                            <input type="text" class="form-control" name="pdis" id="pdis" readonly="" value="<%= rs.getString("permanent_district")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> permanent Address</label>
                                            <input type="text" class="form-control" name="permanent_address" id="permanent_address" value="<%= rs.getString("permanent_address")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> Image</label>
                                            <input type="text" class="form-control" readonly="" name="permanent_state" id="permanent_state" value="<%= rs.getString("image")%>">

                                        </div>
                                        <div class="form-group">
                                            <label> Present District</label>
                                            <input type="text" class="form-control" readonly="" name="pdis" id="pdis" value="<%= rs.getString("present_district")%>">

                                        </div>


                                        <div class="form-group">
                                            <label> Present Address</label>
                                            <input type="text" class="form-control" readonly="" name="padd" id="padd" value="<%= rs.getString("present_address")%>">

                                        </div>

                                        <div class="form-group">
                                            <label>User Type</label>
                                            <input type="text" id="u_type" name="u_type"  readonly=""value="<%=rs.getString("user_type")%>" class="form-control" />
                                        </div>

                                        <div>
                                            <label>Gender</label>
                                            <input type="text" class="form-control" name="gender" readonly="" id="gender" value="<%= rs.getString("gender")%>">
                                        </div>

                                        <div>
                                            <label>Mobile No</label>
                                            <input type="text" class="form-control" name="mobile_no" readonly="" id="mobile_no" value="<%= rs.getString("mobile_no")%>">
                                        </div>
                                        <div>
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="email" id="email" readonly="" value="<%= rs.getString("email")%>">
                                        </div>

                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (right) -
                            <!-- /.box-body -->
                        </form>
                        <%}
    } catch (Exception e) {
    }%>
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




