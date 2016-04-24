<%-- 
    Document   : view_free_subscriber_list
    Created on : 19 Aug, 2015, 1:25:55 PM
    Author     : parwez
--%>
<%@include file="conn.jsp" %>
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
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Subscription Plane</title>
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
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Free Subscriber List Details

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Tables</a></li>
                        <li class="active">Data tables</li>
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
                                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                        <div class="row">
                                            <div class="col-sm-6"></div>
                                            <div class="col-sm-6"></div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table id="example2" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="example2_info">
                                                    <thead>
                                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SL No: activate to sort column descending">SL No</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Full Name: activate to sort column ascending">Promotion Name</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Member Id: activate to sort column ascending">Offer Name</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Address: activate to sort column ascending">Offer Desciption</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Bonus Point: activate to sort column ascending">Expired on</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Mobile No: activate to sort column ascending">Status</th>
                                                    </thead>

                                                    <tbody>
                                                        <%
                                                            java.sql.Statement stadmincheckpointvalue = conn.createStatement();
                                                            java.sql.ResultSet rsadminstadmincheckpointstadmincheckpointvalue = stadmincheckpointvalue.executeQuery("select * from loyalty_promotionoffer where adminid='" + cus_id + "'");
                                                            while (rsadminstadmincheckpointstadmincheckpointvalue.next()) {
                                                        %>

                                                        <%
                                                            java.sql.Statement stadmincheckpointvalueforpromotion = conn.createStatement();
                                                            java.sql.ResultSet rsadminstadmincheckpointstadminpromotionvalue = stadmincheckpointvalueforpromotion.executeQuery("select * from loyalty_promotion where id='" + rsadminstadmincheckpointstadmincheckpointvalue.getString("promotionid") + "' && status='active'");
                                                            while (rsadminstadmincheckpointstadminpromotionvalue.next()) {

                                                        %>
                                                        <tr role="row" class="odd">
                                                            <td class="sorting_1">1</td> 
                                                            <td><%=rsadminstadmincheckpointstadminpromotionvalue.getString("promotionname")%></td>     
                                                            <td><%=rsadminstadmincheckpointstadmincheckpointvalue.getString("offername")%></td>     
                                                            <td><%=rsadminstadmincheckpointstadminpromotionvalue.getString("description")%></td> 
                                                            <td><%=rsadminstadmincheckpointstadminpromotionvalue.getString("valid")%></td> 

                                                            <%
                                                                if (rsadminstadmincheckpointstadmincheckpointvalue.getString("status").equals("deactive")) {
                                                            %>
                                                            <td> In-Active <a href="permit_promotionoffer.jsp?id=<%= rsadminstadmincheckpointstadmincheckpointvalue.getInt("id")%>&status=active"></a> </td>
                                                            <%
                                                            } else if (rsadminstadmincheckpointstadmincheckpointvalue.getString("status").equals("active")) {

                                                            %>
                                                            <td>Active <a href="permit_promotionoffer.jsp?id=<%= rsadminstadmincheckpointstadmincheckpointvalue.getInt("id")%>&status=deactive"></a></td>

                                                            <%
                                                                }
                                                            %>
                                                        </tr>
                                                        <%}%>


                                                        <%
                                                            }%>

                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                </div>
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
