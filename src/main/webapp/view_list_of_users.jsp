<%-- 
    Document   : view_list_of_users
    Created on : 1 Jul, 2015, 6:23:29 PM
    Author     : sukanya
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
        <title><%=config.getServletContext().getInitParameter("projectname")%> |Users List</title>
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
                        Block Users            
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
                                    <table id="example2" class="table table-bordered table-hover">
                                        <thead>


                                            <tr>
                                                <th>SL No</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Contact No</th>
                                                <th>Role Assigned</th>
                                                <th>User Type</th>
                                                <th> Admin Code</th>
                                                <th>Status</th>
                                                <th>User Code</th>
                                                <th>User Name</th>
                                                <th>Password</th>
                                                <th>Action</th>
                                                <th>Option</th>
                                            </tr>
                                        </thead>
                                        <%                        try {
                                        %>
                                        <tbody>
                                            <%
                                                //try{
                                                int count = 0;
                                                java.sql.Statement st = conn.createStatement();
                                                java.sql.ResultSet rs = st.executeQuery("SELECT * FROM loyalty_user_reg_details WHERE adminid='" + cus_id + "'");
                                                while (rs.next()) {
                                                    count++;
                                                    java.sql.Statement stdeg=conn.createStatement();
                                                    java.sql.ResultSet rsdeg=stdeg.executeQuery("select * from loyalty_create_role where id='"+rs.getString("designation")+"'");
                                                    while (rsdeg.next())
                                                        {
                                                    
                                                    
                                            %>
                                            <tr>
                                                <td> <%=count%></td>
                                                <td> <%=rs.getString("firstname")%></td>     
                                                <td> <%=rs.getString("lastname")%></td>     
                                                <td> <%=rs.getString("contact_no")%></td>     
                                                <td> <%=rsdeg.getString("rolename")%></td>
                                                <td> <%=rs.getString("user_type")%></td>
                                                <td> <%=rs.getString("admin_code")%></td>
                                                <td> <%=rs.getString("status")%></td>
                                                <td> <%=rs.getString("user_code")%></td>
                                                <td> <%=rs.getString("user_name")%></td>
                                                <td> <%=rs.getString("password")%></td>
                                                <%
                                                    if (rs.getString("status").equals("deactive")) {
                                                %>
                                                <td> <a href="permit.jsp?id=<%= rs.getInt("id")%>&status=active"> Un-block</a></td>
                                                <%
                                                } else if (rs.getString("status").equals("active")) {

                                                %>
                                                <td> <a href="permit.jsp?id=<%= rs.getInt("id")%>&status=deactive"> Block</a></td>

                                                <%
                                                    }
                                                %>
                                                <td><a href="edituser.jsp?id=<%= rs.getInt("id")%>">Edit</a></td>
                                            </tr>
                                            <%
                                                }}
                                            %>




                                        </tbody>
                                        <%} catch (Exception e) {
                                            }%>
                                    </table>
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

