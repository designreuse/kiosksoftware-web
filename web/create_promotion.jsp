<%-- 
    Document   : create_promotion
    Created on : 3 Sep, 2015, 6:40:02 PM
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
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Manage Promotion</title>
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
        <link rel="stylesheet" href="css/datepicker.min.css"/>
        <link rel="stylesheet" href="css/datepicker3.min.css"/>
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            $(function () {
                // $("#date").datepicker();
                $('#offerfrom').datepicker({
                    format: "mm/dd/yyyy",
                    minDate: 0
                });
                $('#vaidupto').datepicker({
                    format: "mm/dd/yyyy"
                });

            });
        </script>
        <script type="text/javascript">
            function delVal(tabid){
                var con = confirm('Do you want to delete this record?');
                if(con){
                if (typeof XMLHttpRequest != "undefined") {
                    xmlHttp = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (xmlHttp == null) {
                        alert("Browser does not support XMLHTTP Request")
                        return;
                    }
                    var url = "delete_promotion_record.jsp";
                    url += "?tabid=" + tabid;
                    xmlHttp.onreadystatechange = setValue;
                    xmlHttp.open("GET", url, true);
                    xmlHttp.send(null);
                }
            }
            
            function setValue(){
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    
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
                <% int ccc = 0;
                    java.sql.Statement stadmincheckpoint = conn.createStatement();
                    java.sql.ResultSet rsadminstadmincheckpoint = stadmincheckpoint.executeQuery("select * from loyalty_promotionoffer where adminid='" + cus_id + "'");
                    while (rsadminstadmincheckpoint.next()) {
                        ccc++;
                        //out.print(ccc);
                    }
                %>
                <section class="content-header">
                    <h1>
                        Manage Promotion

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Promotion</li>
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
                            New Promotion Created!
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                            There Goes Something Wrong! 
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                        <form role="form" action="create_promtion_action.jsp" method="POST" >
                            <input type="hidden" name="adminid" value="<%=cus_id%>"/>
                            <div class="col-md-6">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title"></h3>
                                    </div><!-- /.box-header -->
                                    <!-- form start -->

                                    <div class="box-body">

                                        <div class="form-group">
                                            <label>Promotion Name</label>
                                            <input type="text" class="form-control" id="promotion_name" name="promotion_name" placeholder="Enter Promotion Name">
                                        </div>
                                        <div class="form-group">
                                            <label>Valid From</label>
                                            <input type="text" class="form-control" id="offerfrom" readonly="" name="offerfrom" placeholder="Enter Promotion Start Date">
                                        </div>
                                        <div class="form-group">
                                            <label> Status</label>
                                            <select name="status" id="status" class="form-control">
                                                <option value="active"> Active</option>
                                                <option value="De_active"> De Active </option>
                                            </select>

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
                                        <div class="form-group">
                                            <label>Promotion Description</label>
                                            <input type="text" class="form-control" id="desc" name="desc" placeholder="Enter Description">
                                        </div>
                                        <div class="form-group">
                                            <label>Valid Upto</label>
                                            <input type="text" class="form-control" id="vaidupto" readonly="" name="vaidupto" placeholder="Enter Promotion Last Date">
                                        </div>

                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <!-- text input -->

                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (right) -
                            <!-- /.box-body -->
                        </form>
                        <div class="alcler_bod"></div>

                        <%
                            if (ccc != 0) {%>
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Promotion List</h3><br>
                                    <br>
                                    <h5 style="font-size: large;"> Select Promotion Date</h5>
                                    From : <input type="text" id="search" name="fromdt" placeholder="dd/mm/yyyy">
                                    To : <input type="text" id="search1" name="enddt" placeholder="dd/mm/yyyy">
                                </div><!-- /.box-header -->

                                <div class="box-body">
                                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div><div class="row"><div class="col-sm-12">
                                                <table id="table1" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="example2_info">
                                                    <thead>
                                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SL No: activate to sort column descending">SL No</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Address: activate to sort column ascending">Description</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Full Name: activate to sort column ascending">Promotion Name</th>             
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Member Id: activate to sort column ascending">Valid From</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Bonus Point: activate to sort column ascending">Valid Upto</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Mobile No: activate to sort column ascending">Status</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">Delete</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <%  int cc = 0;
                                                            java.sql.Statement stadmincheckpointvalue = conn.createStatement();
                                                            java.sql.ResultSet rsadminstadmincheckpointstadmincheckpointvalue = stadmincheckpointvalue.executeQuery("select * from loyalty_promotion where adminid='" + cus_id + "'");
                                                            while (rsadminstadmincheckpointstadmincheckpointvalue.next()) {
                                                                cc++;
                                                        %>
                                                        <tr role="row" class="odd">
                                                            <td class="sorting_1"><%=cc%></td> 
                                                            <td><%=rsadminstadmincheckpointstadmincheckpointvalue.getString("description")%></td> 
                                                            <td><%=rsadminstadmincheckpointstadmincheckpointvalue.getString("promotionname")%></td>           
                                                            <td><%=rsadminstadmincheckpointstadmincheckpointvalue.getString("offerfrom")%></td> 
                                                            <td><%=rsadminstadmincheckpointstadmincheckpointvalue.getString("valid")%></td> 

                                                            <%
                                                                if (rsadminstadmincheckpointstadmincheckpointvalue.getString("status").equals("deactive")) {
                                                            %>
                                                            <td>In-Active <a href="permit_promotion.jsp?id=<%=rsadminstadmincheckpointstadmincheckpointvalue.getInt("id")%>&status=active">Click here to Active</a> </td>
                                                            <%
                                                            } else if (rsadminstadmincheckpointstadmincheckpointvalue.getString("status").equals("active")) {

                                                            %>
                                                            <td>Active <a href="permit_promotion.jsp?id=<%= rsadminstadmincheckpointstadmincheckpointvalue.getInt("id")%>&status=deactive">Click here to In-Active</a></td>

                                                            <%}%>
                                                            <td>                                                                
                                                                <input type="button" name="del" class="btn btn-primary" value="Delete" onclick="delVal('<%= rsadminstadmincheckpointstadmincheckpointvalue.getInt("id")%>')">
                                                            </td>
                                                        </tr>
                                                        <%}%>

                                                    </tbody>

                                                </table></div></div><div class="row"><div class="col-sm-5"><div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Showing 1 to 3 of 3 entries</div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="example2_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button next disabled" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">Next</a></li></ul></div></div></div></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->


                        </div>   
                        <%} else { %>

                        <% }%>
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

<script>
            $(function () {
                // $("#date").datepicker();
                $('#offerfrom').datepicker({
                    format: "MM-DD-YYYY"
                });

            });
</script>
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
            var $rows = $('#table1 tr');
    $('#search').keyup(function () {
        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

        $rows.show().filter(function () {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val);
        }).hide();
    });
     $('#search1').keyup(function () {
        var val1 = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

        $rows.show().filter(function () {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val1);
        }).hide();
    });
        </script>
</body>
</html>
<%} else {
        response.sendRedirect("super_admin_login.jsp");
    }%>
