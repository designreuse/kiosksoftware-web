<%-- 
    Document   : superadmin_details
    Created on : 25 Jun, 2015, 12:42:59 PM
    Author     :Sukanya
--%>
<%
    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
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

            <%@include file="header/super_dashheader.jsp" %>
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="menu/dashboard_menu.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Superadmin Details
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

                        <form role="form" action="<%=request.getContextPath()%>/superadmin_details" method="POST" enctype="multipart/form-data">
                            <div class="col-md-6">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div><!-- /.box-header -->
                                    <!-- form start -->

                                    <div class="box-body">
                                        <input type="hidden" name="u_code" id="u_code" value="<%=user_code%>" />
                                        <div class="form-group">
                                            <label >First Name</label>
                                            <input type="text" class="form-control" id="f_nm" name="f_nm" placeholder="Enter First Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input type="text" class="form-control" name="lnm"id="lnm" placeholder="Enter Last Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Website</label>
                                            <input type="text" id="wb" name="wb" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Organisation type</label>
                                            <select name="org_typ" id="org_typ" class="form-control" required="">
                                                <option value="">
                                                    select
                                                </option>
                                                <option value="company">
                                                    company
                                                </option>
                                                <option value="personal">
                                                    personal
                                                </option>
                                                <option value="partnership">
                                                    partnership
                                                </option>
                                                <option value="Sole_Trader">
                                                    Sole Trader
                                                </option>
                                                <option value="Trust">
                                                    Trust
                                                </option>
                                                <option value="Charity">
                                                    Charity
                                                </option>
                                                <option value="Society">
                                                    Society
                                                </option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Postal Address</label>
                                            <input type="text" id="postal_country" name="postal_country" placeholder="Country"class="form-control" required="">
                                            <input type="text" id="postal_state" name="postal_state" placeholder="State" class="form-control" required="">
                                            <input type="text" id="postal_city" name="postal_city" placeholder="City" class="form-control" required="">
                                            <input type="text" id="postal_address" name="postal_address" placeholder="address" class="form-control" required="">
                                            <input type="text" id="postal_zip" name="postal_zip" placeholder="postal_zip" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Physical Address</label>
                                            <input type="text" id="postal_country" name="physical_country" placeholder="Country"class="form-control" required="">
                                            <input type="text" id="postal_state" name="physical_state" placeholder="State" class="form-control" required="">
                                            <input type="text" id="postal_city" name="physical_city" placeholder="City" class="form-control" required="">
                                            <input type="text" id="postal_address" name="physical_address" placeholder="address" class="form-control" required="">
                                            <input type="text" id="postal_zip" name="physical_zip" placeholder="postal_zip" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>contact no</label>
                                            <input type="text" id="cno" name="cno" placeholder="contact no" class="form-control" required="">
                                        </div>

                                        <div class="form-group">
                                            <label>Email id</label>
                                            <input type="text" id="email_id" name="email_id" placeholder="email" class="form-control" required="">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div><!-- /.box-body -->

                                </div>
                                        <!-- /.box -->


                            </div>
                            <div class="col-md-6">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">

                                        <!-- text input -->

                                        <div class="form-group">
                                            <label>Fax</label>
                                            <input type="text" id="fax" name="fax" placeholder="fax"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Sales Phone No</label>
                                            <input type="text" id="sales_ph_no" name="sales_ph_no" placeholder="sales ph no"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Marketing Phone No</label>
                                            <input type="text" id="marketing_ph_no" name="marketing_ph_no" placeholder="Marketing Ph No"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>In Trial Phone No</label>
                                            <input type="text" id="in_trial_ph_no" name="in_trial_ph_no" placeholder="In Trial No"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Billing Accounts No</label>
                                            <input type="text" id="bill_acc_no" name="bill_acc_no" placeholder="bill_acc_no"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Support Email</label>
                                            <input type="text" id="supp_email" name="supp_email" placeholder="supp_email"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Sales Email</label>
                                            <input type="text" id="supp_email" name="sales_email" placeholder="sales_email"class="form-control" required="">
                                        </div>

                                        <div class="form-group">
                                            <label>Paypal Email</label>
                                            <input type="text" id="paypal_email" name="paypal_email" placeholder="paypal_email"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Paypal Display Name</label>
                                            <input type="text" id="paydnm" name="paydnm" placeholder="Paypal Display Name"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Paypal Client Name</label>
                                            <input type="text" id="pay_client_nm" name="pay_client_nm" placeholder="Paypal Client Name"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Paypal Secret Token</label>
                                            <input type="text" id="pay_sec_nm" name="pay_sec_nm" placeholder="Paypal Secret Name"class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Logo</label>
                                            <input type="file" id="logo" name="logo" placeholder="" required="">
                                        </div>




                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (right) -
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
<%} else {
        response.sendRedirect("super_admin_login.jsp");
    }%>
