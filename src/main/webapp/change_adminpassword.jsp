<%-- 
    Document   : change_adminpassword
    Created on : 15 Sep, 2015, 5:46:18 PM
    Author     : parwez
--%>



<%    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    String cus_id = (String) session.getAttribute("cus_id");
    if (user_name != null) {

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title><%=config.getServletContext().getInitParameter("projectname")%> |Change Password</title>
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
        <script type="text/javascript">
            function subfunc()
            {

                var old_pass = $("#old_pass").val();
                var actual = $("#paa").val();
               // alert(actual);
//               if (old_pass != actual){
//                        $("#pss").html("Current Password id wrong");
//                         return false;
//                     }else{
//                        $("#pss").html("");
//                    return true;
//                     }


                var newpass = $("#newpass").val();
                var confirm_new = $("#confirm_new").val();

                if (newpass == confirm_new)
                {
                    $("#pss").html("");
                    return true;

                }
                else {
                    $("#pss").html("Password Doesn't match");
                    return false;
                }
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
                        Change Password     
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Change Password</a></li>

                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <%
                            try {
                                if (request.getParameter("status").equals("1")) {
                        %>
                        <div style=" background: green; padding: 3px 3px 3px 3px; width: 97% ; margin-left: 15px; margin-bottom: 5px;color: #ffffff; ">
                            Password Updated Successfully
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                           Incorrect Current Password.
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                    <form role="form" id="form" name="form" action="change_adminpassword_action.jsp" method="POST" onsubmit="return subfunc(this.form)">
                        <input type="hidden" name="adminid" value="<%=cus_id%>"/>
                        <input type="hidden" name="paa" id="paa" value=""/>
                        <div class="col-md-6">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title"></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->

                                <div class="box-body">

                                    <div class="form-group">

                                        <div class="parvj"><label>Enter Current Password</label><div id="pss" class="awsm"></div></div> 

                                        <input type="text" class="form-control" id="old_pass" name="old_pass" placeholder="Old Password" onchange="myFocusFunction();" required="" >
                                    </div>
                                    <div class="form-group">

                                        <div class="parvj"><label>Enter New Password</label></div> 

                                        <input type="text" class="form-control" id="newpass" name="newpass" placeholder="Enter New Password"  required="" >
                                    </div>
                                    <div class="form-group">

                                        <div class="parvj"><label>Enter Confirm Password</label></div> 

                                        <input type="text" class="form-control" id="confirm_new" name="confirm_new" placeholder="Confirm Password" onchange="checknewmatched();"  required="" >
                                    </div>



                                    <button type="submit" class="btn btn-primary">Submit</button>



                                </div><!-- /.box-body -->



                            </div><!-- /.box -->


                        </div>

                        <!-- /.box-body -->
                    </form>


                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
            <%@include file="footer/footer.jsp" %>

            <!-- Control Sidebar -->      





        </div><!-- /.tab-pane -->
        <!-- Stats tab content -->


        <!-- jQuery 2.1.4 -->

        <!-- Bootstrap 3.3.2 JS -->
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
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
        <script type="text/javascript">

            function myFocusFunction()
            {
                //alert("sss");
            <%
                String password = "";

                Statement smt1 = conn.createStatement();
                ResultSet res1 = smt1.executeQuery("SELECT * from loyalty_customer_reg_details where cus_id='" + cus_id + "'");
                while (res1.next()) {
                    password = res1.getString("password");
                }

            %>
                var pass = <%=password%>
                $("#paa").val(pass);
                

            }



        </script>
        <script
            type="text/javascript">
                function checknewmatched()
                {
                    var newpass = $("#newpass").val();
                    var confirm_new = $("#confirm_new").val();

                    if (newpass != confirm_new)
                        $("#pss").html("Confirm Password Doesn't match");
                    else
                        $("#pss").html("");
                }
        </script>
        <script
            type="text/javascript">
                if (document.form.onsubmit())
                {//this check triggers the validations
                    //   alert("ss");
                    //document.myform.submit();
                }

        </script>

    </body>
</html>
<%} else {
        response.sendRedirect("super_admin_login.jsp");
    }%>


