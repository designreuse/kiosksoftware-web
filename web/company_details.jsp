<%-- 
    Document   : company_details
    Created on : 15 Sep, 2015, 5:45:43 PM
    Author     : parwez
--%>



<%    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    String cus_id = (String) session.getAttribute("cus_id");
    String image = (String) session.getAttribute("image");
    //out.println(image);
    if (user_name != null) {

%>

<!DOCTYPE html>
<html>
    <head>

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

            <%@include file="header/dashboard_header.jsp" %>
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="menu/admin_menu.jsp" %>

            <!-- Content Wrapper. Contains page content -->
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
                            <ul class="nav nav-tabs">

                                <li class="active"><a href="#home" data-toggle="tab" aria-expanded="true">Details</a></li>
                                <li class=""><a href="#menu1" data-toggle="tab" aria-expanded="false">Address</a></li>
                                <li class=""><a href="#menu2" data-toggle="tab" aria-expanded="false">Contact</a></li>
                                <li><a href="#menu3" data-toggle="tab">Logo</a></li>

                            </ul>
                            <form role="form" action="Edit_Company_Action.jsp" method="POST" enctype="multipart/form-data">
                                <div class="tab-content">
                                    <%

                                        //try{
                                        int countaa = 0;
                                        java.sql.Statement stadm = conn.createStatement();
                                        java.sql.ResultSet rsadm = stadm.executeQuery("SELECT * FROM loyalty_customer_reg_details WHERE cus_id='" + cus_id + "'");
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


                                                    <div class="form-group">
                                                        <label> Store Name </label>
                                                        <input type="text" class="form-control" name="storename" id="storename" value="<%=rsadm.getString("storename")%>" placeholder="Enter Your Store Name" required="">
                                                    </div>


                                                    <div class="form-group">
                                                        <label> Store Display Name </label>
                                                        <input type="text" class="form-control" name="storedispname" id="storedispname" value="<%=rsadm.getString("storedispname")%>" placeholder="Enter Store Displayed Name" required="">
                                                    </div>



                                                    <div class="form-group">
                                                        <label>Organization Type:</label>

                                                        <input type="text" class="form-control" name="org_type" id="org_type" value="<%=rsadm.getString("org_type")%>" placeholder="Enter Org type" required="">

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
                                                        <label>Base Currency</label>
                                                        <input type="text" id="base_currency" name="base_currency" placeholder="Base Currency" value="<%=rsadm.getString("base_currency")%>" class="form-control" required="">
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Website</label>
                                                        <input type="text" id="website" name="website" placeholder="Website" class="form-control" value="<%=rsadm.getString("website")%>" required="">
                                                    </div>


                                                    <div class="form-group">
                                                        <label>Date Format</label>
                                                        <input type="text" id="date_format" name="date_format" placeholder="Date Format" value="<%=rsadm.getString("date_format")%>" class="form-control" required="">
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
                                                        <input type="text" class="form-control" name="country" id="country" placeholder="Country" value="<%=rsadm.getString("country")%>" required="">

                                                    </div>
                                                    <div class="form-group">
                                                        <label>State</label>
                                                        <input type="text" id="state" name="state" placeholder="State" class="form-control" value="<%=rsadm.getString("state")%>" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <input type="text" id="city" name="city" placeholder="city" class="form-control" value="<%=rsadm.getString("city")%>" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label> Address </label>
                                                        <input type="text" class="form-control" name="address" id="address" placeholder="Address" value="<%=rsadm.getString("address")%>" required="">

                                                    </div>
                                                    <div class="form-group">
                                                        <label>Zip</label>
                                                        <input type="text" id="zip" name="zip" placeholder="Zip" class="form-control" value="<%=rsadm.getString("zip")%>" required="">
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
                                                        <label>Mobile No</label>
                                                        <input type="text" id="mno" name="mno" placeholder="Mobile No" class="form-control" value="<%=rsadm.getString("mobile_no")%>" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Phone No</label>
                                                        <input type="text" id="pno" name="pno" placeholder="Phone No" class="form-control" value="<%=rsadm.getString("phone")%>" required="">
                                                    </div>


                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" class="form-control" name="email" id="email" placeholder="Email" value="<%=rsadm.getString("email")%>" required="">
                                                    </div> 
                                                    <div class="form-group">
                                                        <label>Fax</label>
                                                        <input type="text" id="fax" name="fax" placeholder="Fax" class="form-control" value="<%=rsadm.getString("fax")%>" required="">
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
                                                         <input type="submit" value="Submit">
                                    <%}%>                      
                                </div>
                               
                            </form>
                        </div>
                    </div><!-- /.row -->
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
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

