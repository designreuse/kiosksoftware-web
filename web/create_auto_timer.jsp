
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
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Create Auto Timer</title>
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
        <script type="text/javascript">
            function subVal(){
                var fl=0;
                var sttime = document.getElementById("settimer").value;
                var stat = document.getElementById("status").value;
                if(sttime==""){
                    alert('Please provide Timer Time !!!');
                    fl=1;
                }
                
                if(fl==0)
                    document.getElementById("editForm").submit();
            }

        </script>

    </head>
    <body class="skin-blue sidebar-mini" onload="myFunction()">
        <div class="wrapper">

            <%@include file="header/dashboard_header.jsp" %>
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="menu/admin_menu.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->



                <section class="content-header">
                    <h1>
                        Auto Timer

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
                        <%                            try {
                                if (request.getParameter("status").equals("1")) {
                        %>
                        <div style=" background: green; padding: 3px 3px 3px 3px; width: 97% ; margin-left: 15px; margin-bottom: 5px;color: #ffffff; ">
                            Auto Timer Created
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                            There Goes Something Wrong 
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                        <form role="form" action="create_auto_timer_action.jsp?edit=0" method="POST" >
                            <input type="hidden" name="adminid" id="adminid" value="<%=cus_id%>"/>
                            <div class="col-md-6">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div><!-- /.box-header -->
                                    <!-- form start -->

                                    <div class="box-body">

                                        <div class="form-group">
                                            <label>Set Time (In Minutes)</label>
                                            <input type="text" class="form-control" id="set_timer" name="set_timer" placeholder="Set Time">
                                        </div>



                                        <button type="submit" class="btn btn-primary">Submit</button>
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
                                        <div class="form-group">
                                            <label> Status</label>
                                            <select name="status" id="status" class="form-control">
                                                <option value="active"> Active</option>
                                                <option value="De_active"> De Active </option>
                                            </select>

                                        </div>



                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (right) -
                            <!-- /.box-body -->
                        </form>
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Timer List</h3>
                                </div><!-- /.box-header -->

                                <div class="box-body">
                                    <form id="editForm" action="create_auto_timer_action.jsp?edit=1" method="post">
                                        <input type="hidden" name="adminid1" id="adminid1" value="<%=cus_id%>"/>
                                    <table id="example2" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Timer Time</th>
                                                <th>Status</th>
                                                <th>Modify</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                try {
                                                    int timer_time = 0;
                                                    int count = 0;
                                                    java.sql.Statement st = conn.createStatement();
                                                    java.sql.ResultSet rs = st.executeQuery("SELECT * FROM loyalty_auto_timer_details WHERE adminid='" + cus_id + "' AND status='active'");
                                                    while (rs.next()) {
                                                        count=rs.getInt("id");
                                                        timer_time = Integer.parseInt(rs.getString("set_timer"));
                                                        timer_time = timer_time * 60 * 1000;
                                            %>
                                            <tr>
                                            
                                                <td>
                                                    <input type="text" id="settimer" name="settimer" value="<%=rs.getString("set_timer")%>" class="form-control">
                                                </td>     
                                            
                                                <td>
                                                    <select id="status" name="status" class="form-control">
                                                        <%
                                                        if(rs.getString("status").equals("active")){
                                                        %>
                                                        <option value="active" selected=""> Active</option>
                                                        <option value="De_active"> De Active </option>
                                                        <%
                                                        }else{
                                                        %>
                                                        <option value="active"> Active</option>
                                                        <option value="De_active" selected> De Active </option>
                                                        <%
                                                        }
                                                        %>
                                                    </select>
                                                </td>     
                                            
                                                <td><input type="button" name="sub" value="Update" class="btn btn-primary" onclick="subVal()"></td>
                                            </tr>
                                            <%
                                                }
                                                
                                            %>
                                        <script>
                                            var myVar;
                                            function myFunction() {
                                                myVar = setTimeout(alertFunc, <%=timer_time%>);
                                            }
                                            function alertFunc() {
                                                //alert("Hello!");
                                                myFunction();
                                                window.location = "auto_checkin_checkout.jsp";

                                            }
                                        </script>
                                        <%
                                            } catch (Exception ex) {
                                            } finally {
                                                conn.close();
                                            }
                                        %>
                                        </tbody>

                                    </table>
                                        </form>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->


                        </div>    

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

