<%-- 
    Document   : edituser
    Created on : 3 Sep, 2015, 2:50:57 PM
    Author     : parwez
--%>
<%
    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    String cus_id = (String) session.getAttribute("cus_id");
    if (user_name != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="UTF-8">
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Create User</title>
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
                        Edit User

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Edit User</li>
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
                            User Created
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                            There Goes Something Wrong 
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                        <form role="form" action="EditUserAction.jsp" name="form" method="post" >
                            <div class="col-md-6">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div><!-- /.box-header -->
                                    <!-- form start -->

                                    <div class="box-body">
                                        <input type="hidden" name="a_code" id="a_code" value="<%=user_code%>" />
                                        <input type="hidden" name="adminid" id="adminid" value="<%=cus_id%>" />
                                        <input type="hidden" name="u_type" id="u_type" value="<%=user_type%>" />
                                        <input type="hidden" name="userid" id="userid" value="<%=request.getParameter("id")%>" />
                                        
                                        <%
                                            //out.print(request.getParameter("id"));
                                            java.sql.Statement stuser = conn.createStatement();
                                            java.sql.ResultSet rsuser = stuser.executeQuery("select * from loyalty_user_reg_details where id='" + request.getParameter("id") + "'");
                                            while (rsuser.next()) {
                                                //out.println(rsuser.getString("designation"));
                                        %>
                                        <div class="form-group">
                                            <label>Role</label>
                                         
                                                <%
                                                    java.sql.Statement stadmin = conn.createStatement();
                                                    java.sql.ResultSet rsadmin = stadmin.executeQuery("select * from loyalty_create_role where id='" + rsuser.getString("designation") + "'");
                                                    while (rsadmin.next()) {

                                                %>
                                                <input type="text" class="form-control" id="dd" name="sfs" value="<%=rsadmin.getString("rolename")%>" placeholder="First Name" required="" readonly="">
                                                
                                                <%}%>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>First Name</label>
                                            <input type="text" class="form-control" id="first_nm" name="first_nm" value="<%=rsuser.getString("firstname")%>" placeholder="First Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input type="text" class="form-control" id="last_nm" name="last_nm" value="<%=rsuser.getString("lastname")%>" placeholder="Last Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label> User Name </label>
                                            <input type="text" class="form-control" name="unm" id="unm" value="<%=rsuser.getString("user_name")%>" placeholder="User Name" required="">

                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="text" id="pwd" name="pwd" placeholder="Password" value="<%=rsuser.getString("password")%>" class="form-control" required="">
                                        </div>





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


                                        <div>
                                            <label>State</label>

                                            <input type="text" class="form-control" name="state" id="pre_state" value="<%=rsuser.getString("state")%>"  placeholder=" State" required="">

                                        </div>
                                        <div>
                                            <label>Mobile Phone</label>

                                            <input type="text" class="form-control" name="mobile" id="mobile" value="<%=rsuser.getString("contact_no")%>" placeholder=" Mobile" required="">

                                        </div>
                                        <div>
                                            <label>Email Id</label>
                                            <input type="text" class="form-control" name="email" id="email" value="<%=rsuser.getString("email")%>" placeholder="Email id" required="">
                                        </div>
                                        <div class="form-group">
                                            <label> Status</label>
                                            <select name="status" id="status" class="form-control" required="">
                                                <option value="active"> Active</option>
                                                <option value="De_active"> De Active </option>
                                            </select>

                                        </div><%}%>
                                        <button type="submit" class="btn btn-primary">Update</button>


                                    </div>
                                    <!-- /.box-body -->
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
