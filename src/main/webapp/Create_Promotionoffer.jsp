<%-- 
    Document   : Create_Promotionoffer
    Created on : 3 Sep, 2015, 7:01:50 PM
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
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Send Promotions</title>
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
        <meta charset="utf-8">
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7, IE=9" />
        <!-- css -->
        <link rel="stylesheet" href="bootstrap/css/datepicker.min.css" type="text/css">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <!-- css -->
        <!-- js -->


        <!-- date_picker -->

        <style type="text/css">
            body { font-family: 'Open Sans Condensed', sans-serif; }
            label {
                display: inline-block;
                font-size: 15px;
                margin-bottom: 5px;
                font-family: 'Open Sans Condensed', sans-serif; font-weight:normal!important; font-size:15px;
            }
            .dtpkr {
                width:200px;
                height:42px;
                color:#4f4f4f;
                float:left;
                padding-left:8px;
                margin-right:10px;
                font-size:14px;
            }
            .form-control.dtpk {
                height:42px;
            }
            .input-group-addon.hmpg {
                background:#fff;
            }
            .hedb {
                font-size: 30px;
                padding: 10px 0;
                text-align: left;
            }
            .hedb2 {
                font-size: 20px;
                padding:5px 0;
                text-align: left;
            }
            .hedb3 {
                font-size: 16px;
                padding:1px 0;
                text-align: left;
                width:100%;
            }
            .hedb4 {
                font-size: 13px;
                padding:1px 0;
                text-align: left;
                color:#474747;
                width:100%;
            }
            .grety {
                width:100%;
                background:#f5f5f5;
                border-radius:5px;
                border:1px solid #ccc;
                padding:10px;
                text-align:center;
                display:table;
            }
            .gretysm {
                width:100%;
                background:#f5f5f5;
                border-radius:5px;
                border:1px solid #ccc;
                padding:10px;
                text-align:center;
                display:table;
            }
            .inrbxr {
                width:18%;
                margin:5px;
                padding:5px;
                border:3px solid #ccc;
                text-align:center;
                background:#fff;
                border-radius:10px;
                display:inline-block;
                vertical-align:top;
            }
            .inrbxr:hover {
                border:3px solid #F60;
                cursor:pointer;
            }
            .inrbxr .glyphicon {
                color:#F60;
                margin:10px auto;
                font-size:26px;
            }
            .blotxt {
                font-size: 14px;
                text-align:center;
            }
            .ttrp {
                text-align: left;
            }
            .slt1 {
                border: 1px solid #cccccc;
                float: left;
                height: 40px;
                padding: 5px;
                width: 100%;
            }
            .slt2 {
                border: 1px solid #cccccc;
                float: left;
                height: 40px;
                padding: 5px;
                width:177px;
            }
            .smptu {
                float: left;
                height: 40px;
                margin: 0 23px;
                width: 20%;
                border: 1px solid #cccccc;
                padding:5px;
            }
            .clear_new {
                clear:both;
                margin:2px 0;
                display:block;
                padding:2px 0;
            }
            .rdo {
                width: 30px;
            }
            .fff {
                float: left;
                margin: 2px;
                padding: 5px;
            }
            .tpotr {
                background:#f9f9f9;
                display: table;
                width: 100%;
                margin:15px 0;
                padding:15px;
            }
            .frm_wht {
                background:#f5f5f5;
            }
            .frm_wht {
                background:#f0f0f0;
                border: 1px solid #cccccc;
                border-radius: 7px;
                padding: 15px;
            }
            .linesmr {
                width:100%;
                border-bottom:1px solid #ccc;
                height:2px;
                margin-bottom:15px;
            }


        </style>

    </head>
    <body class="skin-blue sidebar-mini">
        <div class="wrapper">

            <%@include file="header/dashboard_header.jsp" %>
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="menu/admin_menu.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <% int ccc = 0;
                    java.sql.Statement stadmincheckpoint = conn.createStatement();
                    java.sql.ResultSet rsadminstadmincheckpoint = stadmincheckpoint.executeQuery("select * from loyalty_promotionoffer where adminid='" + cus_id + "'");
                    while (rsadminstadmincheckpoint.next()) {
                        ccc++;
                        //out.print(ccc);
                    }
                %>
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Send Promotions
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Send Promotions</li>
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
                            New Offer Created!
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                            There Goes Something Wrong! 
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                        <form role="form" action="Create_Promotionoffer_action.jsp" method="POST" >
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
                                            <label>Select Promotion</label>
                                            <select name="promotion_name" id="promotion_name" class="form-control" required="">
                                                <option value=""> select</option>
                                                <%
                                                    java.sql.Statement stadmin = conn.createStatement();
                                                    java.sql.ResultSet rsadmin = stadmin.executeQuery("select * from loyalty_promotion where adminid='" + cus_id + "'");
                                                    while (rsadmin.next()) {

                                                %>
                                                <option value="<%=rsadmin.getString("id")%>"><%=rsadmin.getString("promotionname")%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label> Status</label>
                                            <select name="status" id="status" class="form-control">
                                                <option value="active"> Active</option>
                                                <option value="De_active"> De Active </option>
                                            </select>
                                        </div>
                                        <div class="form-group">

                                            <label> Select Category</label>
                                            <select name="group_cat" id="group_cat" class="form-control">
                                                <%  try {
                                                        java.sql.Statement stadminn = conn.createStatement();
                                                        java.sql.ResultSet rsadminn = stadminn.executeQuery("select * from loyalty_membergroup where status='active' AND adminid='" + cus_id + "'");
                                                        while (rsadminn.next()) {
                                                            //out.print("sss");
%>
                                                <option value="<%=rsadminn.getString("id")%>"> <%=rsadminn.getString("groupname")%></option>
                                                <%
                                                        }
                                                    } catch (Exception e) {
                                                    }
                                                %>
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
                                            <label> Offer Name</label>
                                            <input type="text" class="form-control" id="offername" name="offername" placeholder="Enter Offer Name">
                                        </div>
                                        <div class="form-group">
                                            <label>Offer Description</label>
                                            <input type="text" class="form-control" id="desc" name="desc" placeholder="Enter Description">
                                        </div>

                                        <div class="form-group clearfix">
                                            <label class="clickkk" style="display: block; float: left; margin: 0 30px 0 0;">Send Type</label>
                                            <div class="check_area clearfix" style="float: left; margin: 0 10px;">
                                                <input type="checkbox" onclick="OnChangeCheckbox (this)" value="sms" name="send_type_cats" class="checkbox checkbox1" style="display: block; float: left; margin: 0 5px 0 0;">
                                                <label style="display: block; float: left; margin: 0 30px 0 0;">SMS</label>
                                            </div>
                                            <div class="check_area clearfix" style="float: left; margin: 0 10px;">
                                                <input type="checkbox" onclick="OnChangeCheckboxx (this)" value="email" name="send_type_cate" class="checkbox checkbox2" style="display: block; float: left; margin: 0 5px 0 0;">
                                                <label style="display: block; float: left; margin: 0 30px 0 0;">Email</label>
                                            </div>


                                        </div>
                                        <!-- text input -->

                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (right) -
                            <!-- /.box-body -->
                            <section class="content">
                                <div class="">
                                    <div class="row">
                                        <div class="tpotr">
                                            <div class="col-md-7 col-sm-7 col-lg-7" id="email" style="display: none;">

                                                <div class="grety clearfix">
                                                    <div class="inrbxr"> <span aria-hidden="true" class="glyphicon glyphicon-time"></span>
                                                        <div class="blotxt">Send Now</div>
                                                    </div>

                                                    <div class="inrbxr"> <span aria-hidden="true" class="glyphicon glyphicon-upload"></span>
                                                        <div class="blotxt">Trigger</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-lg-12">
                                                    <div class="hedb2">When?</div>
                                                </div>
                                                <div class="grety clearfix">

                                                    <div class="col-md-5 col-sm-5 col-lg-5"></div>
                                                    <div class="clear_new"></div>
                                                    <div class="ttrp col-md-2 col-sm-2 col-lg-2">
                                                        <label>When to send?</label>
                                                    </div>
                                                    <div class="col-md-5 col-sm-5 col-lg-5">
                                                        <select class="slt1 form-control">
                                                            <option value="1">After Trigger Occur</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-5 col-sm-5 col-lg-5">
                                                        <input class="smptu form-control" type="text" name="trig_day" id="trig_day" value="">
                                                        <select class="slt2 form-control">
                                                            <option value="1">days</option>

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="clear_new"></div>


                                            </div>


                                            <div class="col-md-5 col-sm-5 col-lg-5" id="sms" style="display: none;">
                                                <div class="frm_wht clearfix">

                                                    <textarea class="form-control" name="sms_msg" placeholder="Your Message"></textarea>
                                                    <div class="clear_new"></div>
                                                    <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                                        <input type="radio" id="" name="whn_sms" value="1">
                                                    </div>
                                                    <div class="rdtxt col-md-4 col-lg-4 col-sm-4">Send Now</div>
                                                    <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                                        <input type="radio" id="" name="whn_sms" value="2">
                                                    </div>
                                                    <div class="rdtxt col-md-4 col-lg-4 col-sm-4">Schedule</div>
                                                    <div class="clear_new"></div>
                                                    <div class="col-md-7 col-sm-7 col-lg-7">
                                                        <select class="slt2 form-control">
                                                            <option value="1">On Exactly</option>
                                                        </select>
                                                    </div>
                                                    <!-- date -->
                                                    <div class="col-md-4 col-sm-4 col-lg-4">
                                                        <div class="dtpkr">
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <input class="form-control dtpk" name="sms_date" type="text" datepicker data-trigger="#partha" placeholder="Date">
                                                                    <span id="partha" class="input-group-addon hmpg"><i class="glyphicon glyphicon-calendar"></i></span> </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- date -->
                                                    <div class="clear_new"></div>
                                                    <div class="ttrp col-md-3 col-sm-3 col-lg-3">
                                                        <label>At what time?</label>
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-lg-3">
                                                        <input class="" type="text" name="sms_time_hr" id="sms_time_hr" value="" style="width: 100%; height: 41px;">
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-lg-3">
                                                        <input class="" type="text" name="sms_time_min" id="sms_time_min" value="" style="width: 100%; height: 41px;">
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-lg-3">
                                                        <select class="slt1 form-control">
                                                            <option value="am">AM</option>
                                                            <option value="pm">PM</option>
                                                        </select>
                                                    </div>

                                                </div>
                                            </div>




                                        </div>
                                        <div class="tpotr">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>

                            </section>

                        </form>

                        <div class="alcler_bod"></div>

                        <%
                            if (ccc != 0) {%>

                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Promotion Offer List</h3>
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


                        </div>   
                        <%} else { %>

                        <% }%>


                    </div><!-- /.box -->
                </section>
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
<!--<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
<script src="bootstrap/js/datepicker.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<!--<script src="dist/js/app.min.js" type="text/javascript"></script>-->
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- ChartJS 1.0.1 -->
<!--<script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>-->

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!--<script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>-->

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js" type="text/javascript"></script>
<script type='text/javascript src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>

<script type="text/javascript">
    function OnChangeCheckbox(checkbox) {
        
        
        if (checkbox.checked) {
            //var sms = document.getElementById('sms');
            //alert("The check box is checked.");
            document.getElementById('sms').style.display = 'block';
        }
        else {
            var sms = document.getElementById('sms');
            //alert("The check box is not checked.");
            document.getElementById('sms').style.display = 'none';
        }
    }
    function OnChangeCheckboxx(checkbox) {
        var email = document.getElementById('email');
        if (checkbox.checked) {
            //alert("The check box is checked.");
            email.style.display = 'block';
        }
        else {
            //alert("The check box is not checked.");
            email.style.display = 'none';
        }
    }
</script>
</body>
</html>
<%} else {
        response.sendRedirect("super_admin_login.jsp");
    }%>
