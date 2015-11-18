<%-- 
    Document   : superadmin_details
    Created on : 25 Jun, 2015, 12:42:59 PM
    Author     :Parwez
--%>
<%    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    String cus_id = (String) session.getAttribute("cus_id");
    String image = (String) session.getAttribute("image");
    //out.println(user_code);
    if (user_name != null) {

%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="conn.jsp" %>

        <meta charset="UTF-8">
        <title><%=config.getServletContext().getInitParameter("projectname")%> |Company Details</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.4 -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
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
            <form role="form" action="Edit_SuperAdmin.jsp" method="POST" enctype="multipart/form-data">
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Company Profile         
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Company Details</a></li>

                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <%                        try {
                            if (request.getParameter("status").equals("1")) {
                    %>
                    <div style=" background: green; padding: 3px 3px 3px 3px; width: 97% ; margin-left: 15px; margin-bottom: 5px;color: #ffffff; ">
                        Successfully Updated.
                    </div>
                    <%} else {%>
                    <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                        There Goes Something Wrong 
                    </div>
                    <%}
                        } catch (Exception e) {
                        }%>
                    <div class="row">
                        <div class="col-lg-12 tab-section">
                            <input class="btn btn-danger btton_rd" type="submit" value="Submit">
                            <ul class="nav nav-tabs">

                                <li class="active"><a href="#home" data-toggle="tab" aria-expanded="true">Details</a></li>
                                <li class=""><a href="#menu1" data-toggle="tab" aria-expanded="false">Address</a></li>
                                <li class=""><a href="#menu2" data-toggle="tab" aria-expanded="false">Contact</a></li>
                                <li><a href="#menu3" data-toggle="tab">Logo</a></li>

                            </ul>
                            
                                <div class="tab-content">
                                    <%

                                        //try{
                                        int countaa = 0;
                                        java.sql.Statement stadm = conn.createStatement();
                                        java.sql.ResultSet rsadm = stadm.executeQuery("SELECT * FROM loyalty_superadmin_all_details");
                                        while (rsadm.next()) {

                                            countaa++;


                                    %>

                                    <div class="tab-pane fade active in" id="home">
                                        <input type="hidden" name="adminid" value="<%=cus_id%>"/>
                                        <div class="col-md-6">
                                            <div class="box box-primary">
                                                <div class="box-header">

                                                </div>
                                                <div class="box-body">
                                                    <input type="hidden" name="u_code" id="u_code" value="<%=user_code%>" />
                                                    <div class="form-group">
                                                        <label >First Name</label>
                                                        <input type="text" class="form-control" value="<%=rsadm.getString("firstname")%>" id="f_nm" name="f_nm" placeholder="Enter First Name" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <input type="text" class="form-control" value="<%=rsadm.getString("lastname")%>" name="lnm" id="lnm" placeholder="Enter Last Name" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Paypal Display Name</label>
                                                        <input type="text" id="paydnm" name="paydnm" value="<%=rsadm.getString("paypal_display_name")%>" placeholder="Paypal Display Name"class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Paypal Client Name</label>
                                                        <input type="text" id="pay_client_nm" name="pay_client_nm" value="<%=rsadm.getString("paypal_client_name")%>" placeholder="Paypal Client Name"class="form-control" required="">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>  

                                        <div class="col-md-6">
                                            <div class="box box-primary">
                                                <div class="box-header">

                                                </div>
                                                <div class="box-body">

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
                                                        <label>Website</label>
                                                        <input type="text" id="wb" value="<%=rsadm.getString("website")%>" name="wb" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing Accounts No</label>
                                                        <input type="number" id="bill_acc_no" name="bill_acc_no" value="<%=rsadm.getString("billing_accounts_no")%>" placeholder="bill_acc_no" class="form-control" required="">
                                                    </div>                                                  

                                                    <div class="form-group">
                                                        <label>Paypal Secret Token</label>
                                                        <input type="text" id="pay_sec_nm" name="pay_sec_nm" value="<%=rsadm.getString("paypal_secret_token")%>" placeholder="Paypal Secret Name"class="form-control" required="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="menu1">

                                        <div class="col-md-6">
                                            <div class="box box-primary">
                                                <div class="box-header">

                                                </div>

                                                <div class="box-body">
                                                    <h4>Postal Address </h4>

                                                    <div class="form-group">
                                                        <label> Country</label>
                                                        <input type="text" id="postal_country" value="<%=rsadm.getString("postal_country")%>" name="postal_country" placeholder="Country"class="form-control" required="">

                                                    </div>
                                                    <div class="form-group">
                                                        <label>State</label>
                                                        <input type="text" id="postal_state" value="<%=rsadm.getString("postal_state")%>" name="postal_state" placeholder="State" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <input type="text" id="postal_city" value="<%=rsadm.getString("postal_city")%>" name="postal_city" placeholder="City" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label> Address </label>
                                                        <input type="text" id="postal_address" name="postal_address" value="<%=rsadm.getString("postal_address")%>" placeholder="address" class="form-control" required="">
                                                        

                                                    </div>
                                                    <div class="form-group">
                                                        <label>Zip</label>
                                                        <input type="text" id="postal_zip" value="<%=rsadm.getString("Postal_zip")%>" name="postal_zip" placeholder="postal_zip" class="form-control" required="">
                                                    </div>


                                                    <!-- /.tab-pane -->
                                                </div>


                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="box box-primary">
                                                <div class="box-header">

                                                </div>
                                                <div class="box-body">
                                                    <h4>Physical Address</h4>

                                                    <div class="form-group">
                                                        <label> Country</label>
                                                        <input type="text" id="postal_country" value="<%=rsadm.getString("physical_country")%>" name="physical_country" placeholder="Country"class="form-control" required="">

                                                    </div>
                                                    <div class="form-group">
                                                        <label>State</label>
                                                        <input type="text" id="postal_state" value="<%=rsadm.getString("physical_state")%>" name="physical_state" placeholder="State" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <input type="text" id="postal_city" value="<%=rsadm.getString("physical_city")%>" name="physical_city" placeholder="City" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label> Address </label>
                                                        <input type="text" id="postal_address" value="<%=rsadm.getString("physical_address")%>" name="physical_address" placeholder="address" class="form-control" required="">

                                                    </div>
                                                    <div class="form-group">
                                                        <label>Zip</label>
                                                        <input type="text" id="postal_zip" value="<%=rsadm.getString("physical_zip")%>" name="physical_zip" placeholder="postal_zip" class="form-control" required="">
                                                    </div>


                                                    <!-- /.tab-pane -->
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="tab-pane fade" id="menu2">

                                        <div class="col-md-6">
                                            <div class="box box-primary">
                                                <div class="box-header">

                                                </div>
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label>contact no</label>
                                                        <input type="text" id="cno" name="cno" placeholder="contact no" value="<%=rsadm.getString("contact_no")%>" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Fax</label>
                                                        <input type="text" id="fax" name="fax" placeholder="fax" value="<%=rsadm.getString("fax")%>" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Marketing Phone No</label>
                                                        <input type="text" id="marketing_ph_no" name="marketing_ph_no" value="<%=rsadm.getString("marketing_ph_no")%>" placeholder="Marketing Ph No"class="form-control" required="">
                                                    </div>                                         

                                                    <div class="form-group">
                                                        <label>Support Email</label>
                                                        <input type="text" id="supp_email" name="supp_email" value="<%=rsadm.getString("support_email")%>" placeholder="supp_email"class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Paypal Email</label>
                                                        <input type="text" id="paypal_email" name="paypal_email" value="<%=rsadm.getString("paypal_email_id")%>" placeholder="paypal_email"class="form-control" required="">
                                                    </div>
                                                    <!-- /.tab-pane -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="box box-primary">
                                                <div class="box-header">

                                                </div>
                                                <div class="box-body">

                                                    <div class="form-group">
                                                        <label>Email id</label>
                                                        <input type="text" id="email_id" name="email_id" placeholder="email" value="<%=rsadm.getString("email_id")%>" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Sales Phone No</label>
                                                        <input type="text" id="sales_ph_no" name="sales_ph_no" value="<%=rsadm.getString("sales_ph_no")%>" placeholder="sales ph no"class="form-control" required="">
                                                    </div>   
                                                    <div class="form-group">
                                                        <label>In Trial Phone No</label>
                                                        <input type="text" id="in_trial_ph_no" name="in_trial_ph_no" value="<%=rsadm.getString("in_trial_ph_no")%>" placeholder="In Trial No"class="form-control" required="">
                                                    </div>


                                                    <div class="form-group">
                                                        <label>Sales Email</label>
                                                        <input type="text" id="supp_email" name="sales_email" value="<%=rsadm.getString("sales_email")%>" placeholder="sales_email"class="form-control" required="">
                                                    </div>

                                                    <!-- /.tab-pane -->
                                                </div>
                                            </div>
                                        </div>



                                    </div>



                                    <div class="tab-pane fade" id="menu3">

                                        <div class="col-md-6">
                                            <div class="box box-primary">
                                                <div class="box-header">

                                                </div>
                                                <div class="box-body">




                                                    <div class="form-group">
                                                        <label class="black_txt_010">
                                                            Logo :</label>
                                                        <input type="file" class="form-control" name="imga" id="imga" required="" />


                                                        <img class="nmprvg_lgo" id="blahh" src="<%=request.getContextPath()%>/uploads/<%=session.getAttribute("image")%>"> 
                                                        <br>
                                                        <span class="image-text" style="color:Red;">Supported image formats are: .jpg, .jpeg, .png, .gif, .bmp</span><br>
                                                        <span class="image-text" style="color:Red;">Image Size are:Width:215px and Height:215px</span>



                                                    </div>


                                                    <!-- /.tab-pane -->
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                                        
                                    <%}%>                      
                                </div>

                        
                        </div>
                    </div><!-- /.row -->
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
            </form>
            <%@include file="footer/footer.jsp" %>

            <!-- Control Sidebar -->      





        </div><!-- /.tab-pane -->
        <!-- Stats tab content -->


        <!-- jQuery 2.1.4 -->
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <!-- SlimScroll -->
        <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- FastClick -->
        <script src='plugins/fastclick/fastclick.min.js'></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js" type="text/javascript"></script>
        <!-- page script -->
        <script type="text/javascript">
            $(function () {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>

    </body>
</html>
<%} else {
        response.sendRedirect("super_admin_login.jsp");
    }%>