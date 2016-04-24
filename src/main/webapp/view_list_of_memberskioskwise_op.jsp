<%-- 
    Document   : view_list_of_members
    Created on : 1 Jul, 2015, 6:58:45 PM
    Author     : Parwez
--%>


<%    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    String Kiosk_ip = request.getParameter("Kiosk_ip");
    String cus_id = (String) session.getAttribute("cus_id");
    if (user_name != null) {

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Member List</title>
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
                        Member Details

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
                                                <th>Full Name</th>
                                                <th>Member Id</th>
                                                <th>Loyalty Nos.</th>
                                                <th>Address</th>
                                                <th>Bonus Point</th>
                                                <th>Mobile No</th>
                                                <th>Email</th>
                                                <th>Log Info/Modify</th>

                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                                try {
                                                    java.sql.PreparedStatement ps = null;
                                                    java.sql.ResultSet rst = null;
                                                    int count = 0;
                                                    java.sql.Statement st = conn.createStatement();
                                                    java.sql.ResultSet rs = st.executeQuery("SELECT * FROM sengroup_new_member_reg_details WHERE kiosk_ip='" + Kiosk_ip + "'");
                                                    while (rs.next()) {
                                                        count++;
                                                        int tempid=0;
                                                        ps = conn.prepareStatement("SELECT id FROM loyalty_member_login_info_datewise WHERE member_id='"+rs.getString("member_id")+"' AND kiosk_id='" + Kiosk_ip + "' LIMIT 1");
                                                        rst = ps.executeQuery();
                                                        if(rst.next()){
                                                            try{tempid = rst.getInt("id");if(tempid+""==null)tempid=0;}catch(Exception e){e.printStackTrace();}
                                                        }
                                                        
                                                        if(tempid!=0){
                                            %>
                                            <tr>
                                                <td> <%=count%></td> 
                                                <td> <%=rs.getString("fullname")%></td>     
                                                <td> <%=rs.getString("member_id")%></td>
                                                <td> <%=rs.getString("loyalty_card_nos")%></td>     
                                                <td> <%=rs.getString("present_address")%></td> 
                                                <td> <%=rs.getString("points")%></td> 
                                                <td> <%=rs.getString("phone_no")%></td> 
                                                <td> <%=rs.getString("email")%></td> 
                                                <td><a href="member_login_info_list.jsp?id=<%=rs.getString("member_id")%>&opt=<%=session.getId()%>"> View </a> | <a href="edit_member_reg_info.jsp?member_id=<%=rs.getString("member_id")%>&opt=<%=session.getId()%>"> Edit </a></td>
                                            </tr>


                                            <%}
                                                    }%>
                                        </tbody>
                                        <%
                                            } catch (Exception e) {
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

