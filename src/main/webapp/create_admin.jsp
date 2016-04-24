<%-- 
    Document   : create_admin
    Created on : 29 Jun, 2015, 12:19:26 PM
    Author     : sukanya

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
                        Create Admin

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
                            try {
                                if (request.getParameter("status").equals("1")) {
                        %>
                        <div style=" background: green; padding: 3px 3px 3px 3px; width: 97% ; margin-left: 15px; margin-bottom: 5px;color: #ffffff; ">
                            Admin Created
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                            There Goes Something Wrong 
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                        <form role="form" action="<%=request.getContextPath()%>/cust_reg" method="POST" enctype="multipart/form-data">
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
                                            <label>First Name</label>
                                            <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label> Store Name </label>
                                            <input type="text" class="form-control" name="storename" id="storename" placeholder="Enter Your Store Name" required="">
                                        </div>

                                        <div>
                                            <label> User Name</label>
                                            <input type="text" class="form-control" name="uname" id="uname" placeholder="User Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label> Country</label>
                                            <input type="text" class="form-control" name="country" id="country" placeholder="Country" required="">

                                        </div>
                                        <div class="form-group">
                                            <label>City</label>
                                            <input type="text" id="city" name="city" placeholder="city" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Zip</label>
                                            <input type="text" id="zip" name="zip" placeholder="Zip" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Website</label>
                                            <input type="text" id="website" name="website" placeholder="Website" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Date Format</label>
                                            <input type="text" id="date_format" name="date_format" placeholder="Date Format" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone No</label>
                                            <input type="text" id="pno" name="pno" placeholder="Phone No" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Fax</label>
                                            <input type="text" id="fax" name="fax" placeholder="Fax" class="form-control" required="">
                                        </div>


                                        <div class="form-group">
                                            <label> Image</label>
                                            <input type="file" class="form-control" name="img" id="img" placeholder="Select Image" required="">

                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
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
                                            <label>Last Name</label>
                                            <input type="text" class="form-control" name="lname" id="lname" placeholder="Last Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label> Store Display Name </label>
                                            <input type="text" class="form-control" name="storedispname" id="storedispname" placeholder="Enter Store Displayed Name" required="">
                                        </div>
                                        <div>
                                            <label>Password</label>
                                            <input type="password" class="form-control" name="password" id="password" placeholder="Password" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>State</label>
                                            <input type="text" id="state" name="state" placeholder="State" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label> Address </label>
                                            <input type="text" class="form-control" name="address" id="address" placeholder="Address" required="">

                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="email" id="email" placeholder="Email" required="">
                                        </div> 
                                        <div class="form-group">
                                            <label class="black_txt_010">
                                                Organization Type:</label>
                                            <select class="form-control" id="org_type" name="org_type"><option selected="selected" value="Company">Company</option>
                                                <option value="Personal">Personal</option>
                                                <option value="Partnership">Partnership</option>
                                                <option value="SoleTrader">SoleTrader</option>
                                                <option value="Trust">Trust</option>
                                                <option value="Partnership">Partnership</option>
                                                <option value="Charity">Charity</option>
                                                <option value="Club">Club</option>
                                                <option value="Society">Society</option>
                                            </select>

                                        </div>
                                        <div class="form-group">
                                            <label>Base Currency</label>
                                            <input type="text" id="base_currency" name="base_currency" placeholder="Base Currency" class="form-control" required="">
                                        </div>

                                        <div class="form-group">
                                            <label>Mobile No</label>
                                            <input type="text" id="mno" name="mno" placeholder="Mobile No" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label> Gender</label>
                                            <select name="gen" id="gen" class="form-control" >

                                                <option value="male"> Male </option>
                                                <option value="female"> Female</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label> Status</label>
                                            <select name="status" id="status" class="form-control" >
                                                <option value="active"> Active</option>
                                                <option value="De-active"> De-Active </option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- /.box-body -->
                                </div><!-- /.box -->
                            </div>
                            <!--/.col (right) -
                            <!-- /.box-body -->
                        </form>

                    </div><!-- /.box -->
                </section>
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
