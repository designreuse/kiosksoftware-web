<%-- 
    Document   : alert_subscription
    Created on : 15 Sep, 2015, 5:45:57 PM
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
        <title><%=config.getServletContext().getInitParameter("projectname")%> |Alert Subscription</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.4 -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        

        <link href="css/bootstrap-switch.css" rel="stylesheet">
        
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
                        Alert Subscription
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Alert Subscription</a></li>

                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title"></h3>
                                </div><!-- /.box-header -->

                                <div class="box-body">


                                    <table class="table">
                                        <tbody><tr>
                                                <th>Alert For</th>
                                                <th>Alert Through</th>
                                                <th>Sending Duration</th>
                                                <th>Text Type</th>
                                                <th>Mail Type</th>
                                                <th>Receiver 1</th>
                                                <th>Receiver 2</th>
                                                <th>Is Active</th>

                                            </tr>
                                            <tr>
                                                <td>Shift Sales Alert  <input id="alertList_0__AlertName" name="alertList[0].AlertName" type="hidden" value="Shift Sales Alert">
                                                    <input data-val="true" data-val-number="The field Id must be a number." data-val-required="The Id field is required." id="alertList_0__Id" name="alertList[0].Id" type="hidden" value="1">
                                                </td>


                                                <td> <select class="form-control" id="alertList_0__AlertPath" name="alertList[0].AlertPath"><option value="Email">Email</option>
                                                        <option value="SMS">SMS</option>
                                                        <option selected="selected" value="SMS &amp; Email">SMS &amp; Email</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_0__Period" name="alertList[0].Period"><option selected="selected" value="Daily">Daily</option>
                                                        <option value="Weekly">Weekly</option>
                                                        <option value="Daily &amp; Weekly">Daily &amp; Weekly</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_0__Message" name="alertList[0].Message"><option selected="selected" value="Sort Text">Sort Text</option>
                                                        <option value="Long Text">Long Text</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_0__Mail" name="alertList[0].Mail"><option value="Sort Mail">Sort Mail</option>
                                                        <option selected="selected" value="Long Mail">Long Mail</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_0__Receiver" name="alertList[0].Receiver"><option value="">----Select----</option>
                                                        <option value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option selected="selected" value="Accountant">Accountant</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_0__Receiver2" name="alertList[0].Receiver2"><option value="">----Select----</option>
                                                        <option selected="selected" value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option value="Accountant">Accountant</option>
                                                    </select></td>

                                                <td>

                                                    <div>  <input type="checkbox" ></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Fuel Alert  <input id="alertList_1__AlertName" name="alertList[1].AlertName" type="hidden" value="Fuel Alert">
                                                    <input data-val="true" data-val-number="The field Id must be a number." data-val-required="The Id field is required." id="alertList_1__Id" name="alertList[1].Id" type="hidden" value="2">
                                                </td>


                                                <td> <select class="form-control" id="alertList_1__AlertPath" name="alertList[1].AlertPath"><option value="Email">Email</option>
                                                        <option value="SMS">SMS</option>
                                                        <option selected="selected" value="SMS &amp; Email">SMS &amp; Email</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_1__Period" name="alertList[1].Period"><option selected="selected" value="Daily">Daily</option>
                                                        <option value="Weekly">Weekly</option>
                                                        <option value="Daily &amp; Weekly">Daily &amp; Weekly</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_1__Message" name="alertList[1].Message"><option selected="selected" value="Sort Text">Sort Text</option>
                                                        <option value="Long Text">Long Text</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_1__Mail" name="alertList[1].Mail"><option value="Sort Mail">Sort Mail</option>
                                                        <option selected="selected" value="Long Mail">Long Mail</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_1__Receiver" name="alertList[1].Receiver"><option value="">----Select----</option>
                                                        <option value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option selected="selected" value="Accountant">Accountant</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_1__Receiver2" name="alertList[1].Receiver2"><option value="">----Select----</option>
                                                        <option selected="selected" value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option value="Accountant">Accountant</option>
                                                    </select></td>

                                                <td>

                                                    <div>  <input type="checkbox" ></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Lottery Alert  <input id="alertList_2__AlertName" name="alertList[2].AlertName" type="hidden" value="Lottery Alert">
                                                    <input data-val="true" data-val-number="The field Id must be a number." data-val-required="The Id field is required." id="alertList_2__Id" name="alertList[2].Id" type="hidden" value="3">
                                                </td>


                                                <td> <select class="form-control" id="alertList_2__AlertPath" name="alertList[2].AlertPath"><option value="Email">Email</option>
                                                        <option value="SMS">SMS</option>
                                                        <option selected="selected" value="SMS &amp; Email">SMS &amp; Email</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_2__Period" name="alertList[2].Period"><option selected="selected" value="Daily">Daily</option>
                                                        <option value="Weekly">Weekly</option>
                                                        <option value="Daily &amp; Weekly">Daily &amp; Weekly</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_2__Message" name="alertList[2].Message"><option selected="selected" value="Sort Text">Sort Text</option>
                                                        <option value="Long Text">Long Text</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_2__Mail" name="alertList[2].Mail"><option value="Sort Mail">Sort Mail</option>
                                                        <option selected="selected" value="Long Mail">Long Mail</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_2__Receiver" name="alertList[2].Receiver"><option value="">----Select----</option>
                                                        <option value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option selected="selected" value="Accountant">Accountant</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_2__Receiver2" name="alertList[2].Receiver2"><option value="">----Select----</option>
                                                        <option selected="selected" value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option value="Accountant">Accountant</option>
                                                    </select></td>

                                                <td>

                                                    <div>  <input type="checkbox" ></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Charge Account Alert  <input id="alertList_3__AlertName" name="alertList[3].AlertName" type="hidden" value="Charge Account Alert">
                                                    <input data-val="true" data-val-number="The field Id must be a number." data-val-required="The Id field is required." id="alertList_3__Id" name="alertList[3].Id" type="hidden" value="4">
                                                </td>


                                                <td> <select class="form-control" id="alertList_3__AlertPath" name="alertList[3].AlertPath"><option value="Email">Email</option>
                                                        <option value="SMS">SMS</option>
                                                        <option selected="selected" value="SMS &amp; Email">SMS &amp; Email</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_3__Period" name="alertList[3].Period"><option selected="selected" value="Daily">Daily</option>
                                                        <option value="Weekly">Weekly</option>
                                                        <option value="Daily &amp; Weekly">Daily &amp; Weekly</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_3__Message" name="alertList[3].Message"><option selected="selected" value="Sort Text">Sort Text</option>
                                                        <option value="Long Text">Long Text</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_3__Mail" name="alertList[3].Mail"><option value="Sort Mail">Sort Mail</option>
                                                        <option selected="selected" value="Long Mail">Long Mail</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_3__Receiver" name="alertList[3].Receiver"><option value="">----Select----</option>
                                                        <option value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option selected="selected" value="Accountant">Accountant</option>
                                                    </select></td>
                                                <td> <select class="form-control" id="alertList_3__Receiver2" name="alertList[3].Receiver2"><option value="">----Select----</option>
                                                        <option value="Store Keeper">Store Keeper</option>
                                                        <option value="Cash Counter Manager">Cash Counter Manager</option>
                                                        <option selected="selected" value="Accountant">Accountant</option>
                                                    </select></td>

                                                <td>

                                                    <div>  <input type="checkbox" ></div>
                                                </td>
                                            </tr>

                                        </tbody></table>



                                </div><!-- /.box-body -->
                            </div><!-- /.box -->


                        </div><!-- /.col -->
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
       
        <script src="js/highlight.js"></script>
        <script src="js/bootstrap-switch.js"></script>
        <script src="js/main.js"></script>
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

