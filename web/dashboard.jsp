<%-- 
    Document   : dashboard
    Created on : 17 Sep, 2015, 12:16:58 PM
    Author     : parwez
--%>

<%@page import="com.loyalty.card.admin.providor.GetIPAddress"%>
<%@page import="java.net.InetAddress"%>
<%@include file="conn.jsp" %>
<%  String user_name = (String) session.getAttribute("user_name");
    String user_code = (String) session.getAttribute("user_code");
    String cus_id = (String) session.getAttribute("cus_id");

    String mobile_no = (String) session.getAttribute("mobile_no");
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
    String email = (String) session.getAttribute("email");
    //out.print(session.getAttribute("image"));

    if (user_name != null) {

        int totalpointearned = 0;


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>

        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <!--        <link rel="stylesheet" href="/resources/demos/style.css">-->

        <%@include file="head/dashboardhead.jsp"%>
        <!--        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>-->

        <script type="text/javascript"
                src="https://www.google.com/jsapi?autoload={
                'modules':[{
                'name':'visualization',
                'version':'1',
                'packages':['corechart']
                }]
        }"></script>

        <script type="text/javascript">

                            $(document).ready(function() {
                    $("#prom").on('click', function () {

                    $("#promul").slideToggle('fast');
                            e.preventDefault();
                    });
                            $("#promul").on('click', function () {
                    $("#promul").hide();
                            e.preventDefault();
                    });
//                            function getSelectedValue(id) {
//                            return $("#" + id).find("dt a span.value").html();
//                            }
//
//                    $(document).bind('click', function (e) {
//                    var $clicked = $(e.target);
//                            if (!$clicked.parents().hasClass("dropdown")) $("#promul").hide();
//                    });
//                            $('.mutliSelect input[type="checkbox"]').on('click', function () {
//
//                    var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
//                            title = $(this).val() + ",";
//                            if ($(this).is(':checked')) {
//                    var html = '<span title="' + title + '">' + title + '</span>';
//                            $('.multiSel').append(html);
//                            $(".hida").hide();
//                    }
//                    else {
//                    $('span[title="' + title + '"]').remove();
//                            var ret = $(".hida");
//                            $('.dropdown dt a').append(ret);
//                    }
//                    });

                            //////////////////////////////////////////////
                            $("#smsmail").on('click', function () {

                    $("#smsul").slideToggle('fast');
                            e.preventDefault();
                    });
                            $("#smsul").on('click', function () {
                    $("#smsul").hide();
                            e.preventDefault();
                    });
//                            function getSelectedValue(id) {
//                            return $("#" + id).find("dt a span.value").html();
//                            }
//
//                    $(document).bind('click', function (e) {
//                    var $clicked = $(e.target);
//                            if (!$clicked.parents().hasClass("dropdown")) $("#smsul").hide();
//                    });
//                            $('.mutliSelect input[type="checkbox"]').on('click', function () {
//
//                    var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
//                            title = $(this).val() + ",";
//                            if ($(this).is(':checked')) {
//                    var html = '<span title="' + title + '">' + title + '</span>';
//                            $('.multiSel').append(html);
//                            $(".hida").hide();
//                    }
//                    else {
//                    $('span[title="' + title + '"]').remove();
//                            var ret = $(".hida");
//                            $('.dropdown dt a').append(ret);
//                    }
//                    });



                    });</script>


        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <%            String ent_dt = "";
        %>
        <script type="text/javascript">
                            google.load("visualization", "1.1", {packages:["bar"]});
                            google.setOnLoadCallback(drawChart);
                            function drawChart() {
                            var data = google.visualization.arrayToDataTable([
                                    ['Date', 'Total Registered Users'],
            <%
                try {
                    int veh_availablechk = 0;
                    String dt[] = null;
                    String percen = "%";
                    java.sql.Statement stchk = conn.createStatement();
                    java.sql.ResultSet rschk = stchk.executeQuery("SELECT * FROM loyalty_user_reg_details where adminid='" + cus_id + "'");
                    // while (rschk.next()) {

                    int count = 0;
                    float totcnt = 0;

                    Statement smt1 = conn.createStatement();
                    ResultSet res1 = smt1.executeQuery("SELECT COUNT(*)  AS USER1 , date_modified FROM loyalty_user_reg_details where adminid='" + cus_id + "' GROUP BY CAST(date_modified AS DATE)");

                    while (res1.next()) {

                        // count++;
                        ent_dt = res1.getString("date_modified");
                        dt = ent_dt.split(" ");
                    //totcnt = (float) count / veh_availablechk;
                        // count = 0;

            %>
                            ['<%=dt[0]%>', <%=res1.getString("USER1")%>],
            <%}
            %>
                            ]);
                                    var options = {
                                    chart: {
                                    title: 'Total Registered Users',
                                            subtitle: 'Kiosk',
                                    },
                                            bars: 'horizontal' // Required for Material Bar Charts.
                                    };
                                    var chart = new google.charts.Bar(document.getElementById('curve_chart'));
                                    chart.draw(data, options);
                            }
        </script>

        <script type="text/javascript">
                    google.load("visualization", "1", {packages:["corechart"]});
                            google.setOnLoadCallback(drawChart1);
                            function drawChart1() {
                            var data = google.visualization.arrayToDataTable([
                                    ['Year', 'Kiosk'],
            <%
                String kiusoipoip = "";
                int mostutilized = 0;
                java.sql.Statement stchkmostutilized = conn.createStatement();
                java.sql.ResultSet rschkmostutilized = stchkmostutilized.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "'");
                while (rschkmostutilized.next()) {
                    mostutilized++;

                    int countrschkmostutilized = 0;
                    float totcntrschkmostutilized = 0;
                    String ent_dtmostutilized = "";
                    Statement smt1mostutilized1 = conn.createStatement();
                    ResultSet res1most = smt1mostutilized1.executeQuery("SELECT DISTINCT kiosk_id FROM loyalty_member_login_info_datewise where kiosk_id='" + rschkmostutilized.getString("allocate_ip") + "'");
                    while (res1most.next()) {
                        Statement smt1mostutilizedreg = conn.createStatement();
                        ResultSet res1mostreg = smt1mostutilizedreg.executeQuery("SELECT * FROM loyalty_kiosk_reg_info where kiosk_id='" + res1most.getString("kiosk_id") + "' GROUP BY kiosk_id");
                        while (res1mostreg.next()) {
                            countrschkmostutilized++;
                            if (res1most.getString("kiosk_id").equals(res1mostreg.getString("kiosk_id"))) {
                                kiusoipoip = res1mostreg.getString("positions");
                            } else {
                                kiusoipoip = "Not Yet Positioned";
                            }


            %>
                            ['<%=kiusoipoip%>', <%=countrschkmostutilized%>],
            <%}
                    }
                }%>
                            ]);
                                    var options = {
                                    title: 'Most Utilized Kiosk',
                                            //          hAxis: {title: 'Year', titleTextStyle: {color: 'red'}}

                                    };
                                    var chart = new google.visualization.PieChart(document.getElementById('boxkioskutilize'));
                                    chart.draw(data, options);
                            }
        </script>
        <script>
                    $(function() {


                    var availableTags = [
            <%

                java.sql.Statement stcontact = conn.createStatement();
                java.sql.ResultSet rsstcontact = stcontact.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan WHERE admin_id='" + cus_id + "'");
                while (rsstcontact.next()) {
            %>
            <%  java.sql.Statement st = conn.createStatement();
                java.sql.ResultSet rs = st.executeQuery("select email from sengroup_new_member_reg_details where kiosk_ip='" + rsstcontact.getString("allocate_ip") + "' GROUP BY fullname");
                while (rs.next()) {

            %>
                    "<%=rs.getString("email")%>",
            <%}
                }%>
                    ];
                            // $("#emailto").autocomplete({
                            //source: availableTags
                            // });
                    });</script>

    </head>
    <body class="skin-blue sidebar-mini">
        <div class="wrapper">

            <%@include file="header/admin_dash_header.jsp" %>
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="menu/admin_menu.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->

                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <%      try {//InetAddress IP = InetAddress.getLocalHost();
                                            String ip = new GetIPAddress().getIPAddress();
                                            //System.out.println(ip);

                                            java.util.Date date1 = new java.util.Date();
                                            String modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(date1);
                                            java.util.Date date = new java.util.Date();
                                            // System.out.println(modifiedDate+"pk");
                                            String totalavailchk = "";
                                            String dateonlytoday[] = null;
                                            String datemodifieddb = "";

                                            java.sql.Statement sttotalpointip = conn.createStatement();
                                            java.sql.ResultSet rstotalpointip = sttotalpointip.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "'");
                                            while (rstotalpointip.next()) {

                                                java.sql.Statement sttotalpoint = conn.createStatement();
                                                java.sql.ResultSet rstotalpoint = sttotalpoint.executeQuery("select * from sengroup_new_member_reg_details where kiosk_ip='" + rstotalpointip.getString("allocate_ip") + "'");
                                                while (rstotalpoint.next()) {
                                                    datemodifieddb = rstotalpoint.getString("date_modified");
                                                    dateonlytoday = datemodifieddb.split(" ");

                                                    if (modifiedDate.equals(dateonlytoday[0])) {
                                                        totalpointearned = totalpointearned + Integer.parseInt(rstotalpoint.getString("points"));
                                                    }

                                                }
                                            }

                                    %>
                                    <%if (datemodifieddb.equals("") || datemodifieddb.equals(null)) {%>
                                    <h3><%=totalpointearned%></h3>
                                    <%    } else {%>
                                    <h3><%=totalpointearned%></h3>
                                    <%}
                                    %>

                                    <p>Total Points Earned Today</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="view_list_of_members_op.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <%
                                        int countchkin = 0;
                                        String datechkinmodified = "";
                                        String dateonlytodaychkin[] = null;
                                        java.sql.Statement sttotalpointchkl = conn.createStatement();
                                        java.sql.ResultSet rstotalpointipck = sttotalpointchkl.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "'");
                                        while (rstotalpointipck.next()) {
                                            java.sql.Statement stchkin = conn.createStatement();
                                            java.sql.ResultSet rstchkin = stchkin.executeQuery("select * from loyalty_member_login_info_datewise where kiosk_id='" + rstotalpointipck.getString("allocate_ip") + "' && status='Check In'");
                                            while (rstchkin.next()) {
                                                datechkinmodified = rstchkin.getString("date_modified");
                                                dateonlytodaychkin = datechkinmodified.split(" ");

                                                if (modifiedDate.equals(dateonlytodaychkin[0])) {
                                                    // totalpointearned = totalpointearned + Integer.parseInt(rstchkin.getString("points"));
                                                    countchkin++;
                                                }

                                            }
                                        }

                                    %>
                                    <%if (datechkinmodified.equals("") || datechkinmodified.equals(null)) {%>

                                    <h3><%=countchkin%><sup style="font-size: 20px"> Times</sup></h3>

                                    <%    } else {
                                        System.out.println(datechkinmodified + "else");
                                        System.out.println(countchkin);
                                        System.out.println(datechkinmodified);
                                        System.out.println(countchkin + "else");
                                    %>

                                    <h3><%=countchkin%><sup style="font-size: 20px"> Times</sup></h3>
                                    <%}
                                    %>

                                    <p>Checked In</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                                <a href="showcheckinmember.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">

                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <%
                                        int countchkout = 0;
                                        String datechkoutmodified = "";
                                        String dateonlytodaychkout[] = null;
                                        java.sql.Statement sttotalpointchkout = conn.createStatement();
                                        java.sql.ResultSet rstotalpointipcout = sttotalpointchkout.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "'");
                                        while (rstotalpointipcout.next()) {

                                            java.sql.Statement stchkout = conn.createStatement();
                                            java.sql.ResultSet rstchkout = stchkout.executeQuery("select * from loyalty_member_login_info_datewise where kiosk_id='" + rstotalpointipcout.getString("allocate_ip") + "' && status='Check Out'");
                                            while (rstchkout.next()) {
                                                datechkoutmodified = rstchkout.getString("date_modified");
                                                dateonlytodaychkout = datechkoutmodified.split(" ");

                                                if (modifiedDate.equals(dateonlytodaychkout[0])) {
                                                    // totalpointearned = totalpointearned + Integer.parseInt(rstchkout.getString("points"));
                                                    countchkout++;
                                                }

                                            }
                                        }

                                    %>
                                    <%if (datechkoutmodified.equals("") || datechkoutmodified.equals(null)) {
                                            System.out.println(datechkoutmodified + "if");
                                            System.out.println(countchkout + "if");
                                    %>
                                    <h3><%=countchkout%><sup style="font-size: 20px"> Times</sup></h3>

                                    <%    } else {
                                        System.out.println(datechkoutmodified + "else");
                                        System.out.println(countchkout);
                                        System.out.println(datechkoutmodified);
                                        System.out.println(countchkout + "else");
                                    %>

                                    <h3><%=countchkout%><sup style="font-size: 20px"> Times</sup></h3>
                                    <%}
                                    %>

                                    <p>Checked Out</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="showcheckoutmember.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <%
                                        int counttotalkiosk = 0;

                                        java.sql.Statement sttotalkiosk = conn.createStatement();
                                        java.sql.ResultSet rstotalkiosk = sttotalkiosk.executeQuery("select * from loyalty_allocate_subscription_plan where admin_id='" + cus_id + "' && status='active'");
                                        while (rstotalkiosk.next()) {

                                            counttotalkiosk++;

                                        }

                                    %>
                                    <h3><%=counttotalkiosk%><sup style="font-size: 20px"></sup></h3>

                                    <p>Total Kiosk</p>
                                    <%
                                        } catch (Exception e) {
                                        }
                                    %>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-pie-graph"></i>
                                </div>
                                <a href="view_list_of_kiosk.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div><!-- /.row -->
                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-7 connectedSortable">
                            <!-- Custom tabs (Charts with tabs)-->
                            <div class="nav-tabs-custom" id="curve_chart">

                                <!--                                <ul class="nav nav-tabs pull-right">
                                                                    <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>
                                                                    <li><a href="#sales-chart" data-toggle="tab">Donut</a></li>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                    <li class="pull-left header"><i class="fa fa-inbox"></i> Sales</li>
                                                                </ul>
                                                                <div class="tab-content no-padding">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                                                                     Morris chart - Sales 
                                                                    <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
                                                                    <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
                                                                </div>-->
                                <div class="all_clr"></div>
                            </div>

                            <!-- /.nav-tabs-custom -->

                            <!-- Chat box -->
                            <!-- /.box (chat box) -->

                            <!-- TO DO List -->
                            <!-- /.box -->

                            <!-- quick email widget -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <i class="fa fa-envelope"></i>
                                    <h3 class="box-title">Quick Promotions</h3>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div>
                                <div class="box-body">
                                    <form action="<%=request.getContextPath()%>/SendEmailAuth" method="post">
                                        <dl class="dropdown" id="prom"> 

                                            <dt>
                                            <a href="javascript:void(0);">
                                                <span class="hida">Select Category</span>    

                                            </a>
                                            </dt>

                                            <dd>
                                                <div class="mutliSelect">

                                                    <ul id="promul">
                                                        <li>
                                                            <input type="checkbox" value="all" />All Group
                                                        </li>

                                                        <%
                                                            java.sql.Statement stadmin = conn.createStatement();
                                                            java.sql.ResultSet rsadmin = stadmin.executeQuery("select * from loyalty_membergroup where adminid='" + cus_id + "'");
                                                            while (rsadmin.next()) {
                                                                //out.print("sss");
%>
                                                        <li>
                                                            <input type="checkbox" value="<%=rsadmin.getString("id")%>" /><%=rsadmin.getString("groupname")%>
                                                        </li>
                                                        <%}
                                                            } catch (Exception e) {
                                                            }%>


                                                    </ul>
                                                </div>
                                            </dd>

                                        </dl>
                                        <!--                                        <div class="form-group">
                                        
                                                                                    <select name="emailto" id="emailto" class="form-control" required="" multiple="">
                                                                                        <option value="">select Group</option>
                                                                                        <option value="all">All Group</option>
                                                                                        
                                                                                    </select>
                                                                                </div>-->




                                        <div class="form-group">
                                            <input type="text" class="form-control" name="subject" placeholder="Subject"/>
                                        </div>
                                        <div>
                                            <textarea class="textarea" name="message" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="box-footer clearfix">
                                    <button class="pull-right btn btn-default" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
                                </div>
                            </div>
                            <div class="box box-info">
                                <div class="box-header">
                                    <i class="fa fa-envelope"></i>
                                    <h3 class="box-title">Send SMS</h3>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div>
                                <div class="box-body">
                                    <form action="#" method="post">
                                        <dl class="dropdown" id="smsmail"> 

                                            <dt>
                                            <a href="javascript:void(0);">
                                                <span class="hida">Select Category</span>    
                                            </a>
                                            </dt>

                                            <dd>
                                                <div class="mutliSelect">

                                                    <ul id="smsul">
                                                        <li>
                                                            <input type="checkbox" value="all" />All Group
                                                        </li>

                                                        <%  try {
                                                                java.sql.Statement stadmin = conn.createStatement();
                                                                java.sql.ResultSet rsadmin = stadmin.executeQuery("select * from loyalty_membergroup where adminid='" + cus_id + "'");
                                                                while (rsadmin.next()) {
                                                                    //out.print("sss");
%>
                                                        <li>
                                                            <input type="checkbox" value="<%=rsadmin.getString("id")%>" /><%=rsadmin.getString("groupname")%>
                                                        </li>
                                                        <%}
                                                            } catch (Exception e) {
                                                            }%>


                                                    </ul>
                                                </div>
                                            </dd>

                                        </dl>

                                        <div class="form-group">
                                            <input type="text" class="form-control" name="subject" placeholder="Subject"/>
                                        </div>
                                        <div>
                                            <textarea class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="box-footer clearfix">
                                    <button class="pull-right btn btn-default" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
                                </div>
                            </div>

                        </section><!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section class="col-lg-5 connectedSortable">

                            <!-- Map box -->
                            <div class="box box-solid bg-light-blue-gradient" id="boxkioskutilize">
                                <div class="box-header">
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn btn-primary btn-sm daterange pull-right" data-toggle="tooltip" title="Date range"><i class="fa fa-calendar"></i></button>
                                        <button class="btn btn-primary btn-sm pull-right" data-widget='collapse' data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                                    </div><!-- /. tools -->

                                    <i class="fa fa-map-marker"></i>
                                    <h3 class="box-title">
                                        Visitors
                                    </h3>
                                </div>
                                <div class="box-body">
                                    <div id="world-map" style="height: 250px; width: 100%;"></div>
                                </div><!-- /.box-body-->
                                <div class="box-footer no-border">
                                    <div class="row">
                                        <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                            <div id="sparkline-1"></div>
                                            <div class="knob-label">Visitors</div>
                                        </div><!-- ./col -->
                                        <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                            <div id="sparkline-2"></div>
                                            <div class="knob-label">Online</div>
                                        </div><!-- ./col -->
                                        <div class="col-xs-4 text-center">
                                            <div id="sparkline-3"></div>
                                            <div class="knob-label">Exists</div>
                                        </div><!-- ./col -->
                                    </div><!-- /.row -->
                                </div>
                            </div>
                            <!-- /.box -->

                            <!-- solid sales graph -->
                            <div class="box box-solid bg-teal-gradient">
                                <div class="box-header">
                                    <i class="fa fa-th"></i>
                                    <h3 class="box-title">Sales Graph</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn bg-teal btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body border-radius-none">
                                    <div class="chart" id="line-chart" style="height: 250px;"></div>
                                </div><!-- /.box-body -->
                                <div class="box-footer no-border">
                                    <div class="row">
                                        <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                            <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60" data-fgColor="#39CCCC"/>
                                            <div class="knob-label">Mail-Orders</div>
                                        </div><!-- ./col -->
                                        <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                            <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60" data-fgColor="#39CCCC"/>
                                            <div class="knob-label">Online</div>
                                        </div><!-- ./col -->
                                        <div class="col-xs-4 text-center">
                                            <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60" data-fgColor="#39CCCC"/>
                                            <div class="knob-label">In-Store</div>
                                        </div><!-- ./col -->
                                    </div><!-- /.row -->
                                </div><!-- /.box-footer -->
                            </div><!-- /.box -->

                            <!-- Calendar -->
                            <div class="box box-solid bg-green-gradient">
                                <div class="box-header">
                                    <i class="fa fa-calendar"></i>
                                    <h3 class="box-title">Calendar</h3>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <!-- button with a dropdown -->
                                        <div class="btn-group">
                                            <button class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#">Add new event</a></li>
                                                <li><a href="#">Clear events</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">View calendar</a></li>
                                            </ul>
                                        </div>
                                        <button class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <!--The calendar -->
                                    <div id="calendar" style="width: 100%"></div>
                                </div><!-- /.box-body -->
                                <div class="box-footer text-black">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Progress bars -->
                                            <div class="clearfix">
                                                <span class="pull-left">Task #1</span>
                                                <small class="pull-right">90%</small>
                                            </div>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                                            </div>

                                            <div class="clearfix">
                                                <span class="pull-left">Task #2</span>
                                                <small class="pull-right">70%</small>
                                            </div>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                                            </div>
                                        </div><!-- /.col -->
                                        <div class="col-sm-6">
                                            <div class="clearfix">
                                                <span class="pull-left">Task #3</span>
                                                <small class="pull-right">60%</small>
                                            </div>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                                            </div>

                                            <div class="clearfix">
                                                <span class="pull-left">Task #4</span>
                                                <small class="pull-right">40%</small>
                                            </div>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                                            </div>
                                        </div><!-- /.col -->
                                    </div><!-- /.row -->
                                </div>
                            </div><!-- /.box -->

                        </section><!-- right col -->
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
            <%@include file="footer/footer.jsp" %>

            <!-- Control Sidebar -->      
            <aside class="control-sidebar control-sidebar-dark">                
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>

                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane" id="control-sidebar-home-tab">
                        <h3 class="control-sidebar-heading">Recent Activity</h3>
                        <ul class='control-sidebar-menu'>
                            <li>
                                <a href='javascript::;'>
                                    <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                                        <p>Will be 23 on April 24th</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href='javascript::;'>
                                    <i class="menu-icon fa fa-user bg-yellow"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                                        <p>New phone +1(800)555-1234</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href='javascript::;'>
                                    <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                                        <p>nora@example.com</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href='javascript::;'>
                                    <i class="menu-icon fa fa-file-code-o bg-green"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                                        <p>Execution time 5 seconds</p>
                                    </div>
                                </a>
                            </li>
                        </ul><!-- /.control-sidebar-menu -->

                        <h3 class="control-sidebar-heading">Tasks Progress</h3> 
                        <ul class='control-sidebar-menu'>
                            <li>
                                <a href='javascript::;'>               
                                    <h4 class="control-sidebar-subheading">
                                        Custom Template Design
                                        <span class="label label-danger pull-right">70%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                    </div>                                    
                                </a>
                            </li> 
                            <li>
                                <a href='javascript::;'>               
                                    <h4 class="control-sidebar-subheading">
                                        Update Resume
                                        <span class="label label-success pull-right">95%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                    </div>                                    
                                </a>
                            </li> 
                            <li>
                                <a href='javascript::;'>               
                                    <h4 class="control-sidebar-subheading">
                                        Laravel Integration
                                        <span class="label label-waring pull-right">50%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                    </div>                                    
                                </a>
                            </li> 
                            <li>
                                <a href='javascript::;'>               
                                    <h4 class="control-sidebar-subheading">
                                        Back End Framework
                                        <span class="label label-primary pull-right">68%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                    </div>                                    
                                </a>
                            </li>               
                        </ul><!-- /.control-sidebar-menu -->         

                    </div><!-- /.tab-pane -->
                    <!-- Stats tab content -->
                    <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">            
                        <form method="post">
                            <h3 class="control-sidebar-heading">General Settings</h3>
                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Report panel usage
                                    <input type="checkbox" class="pull-right" checked />
                                </label>
                                <p>
                                    Some information about this general settings option
                                </p>
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Allow mail redirect
                                    <input type="checkbox" class="pull-right" checked />
                                </label>
                                <p>
                                    Other sets of options are available
                                </p>
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Expose author name in posts
                                    <input type="checkbox" class="pull-right" checked />
                                </label>
                                <p>
                                    Allow the user to show his name in blog posts
                                </p>
                            </div><!-- /.form-group -->

                            <h3 class="control-sidebar-heading">Chat Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Show me as online
                                    <input type="checkbox" class="pull-right" checked />
                                </label>                
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Turn off notifications
                                    <input type="checkbox" class="pull-right" />
                                </label>                
                            </div><!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Delete chat history
                                    <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                                </label>                
                            </div><!-- /.form-group -->
                        </form>
                    </div><!-- /.tab-pane -->
                </div>
            </aside><!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class='control-sidebar-bg'></div>
        </div><!-- ./wrapper -->

        <!-- jQuery 2.1.4 -->

        <!-- jQuery UI 1.11.2 -->

        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
                            $.widget.bridge('uibutton', $.ui.button);</script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
        <!-- Morris.js charts -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="plugins/morris/morris.min.js" type="text/javascript"></script>
        <!-- Sparkline -->
        <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <!-- jvectormap -->
        <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <!-- jQuery Knob Chart -->
        <script src="plugins/knob/jquery.knob.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js" type="text/javascript"></script>
        <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- datepicker -->
        <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        <!-- Slimscroll -->
        <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- FastClick -->
        <script src='plugins/fastclick/fastclick.min.js'></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js" type="text/javascript"></script>    

        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard.js" type="text/javascript"></script>    

        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js" type="text/javascript"></script>
    </body>
</html>
<%

    } else {
        response.sendRedirect("index.jsp");
    }
%>




