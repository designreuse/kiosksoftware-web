<%-- 
    Document   : mail_sms_sending
    Created on : 25 Feb, 2016, 5:25:19 PM
    Author     : xent30
--%>
<%
    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_code = (String) session.getAttribute("user_code");
    String cus_id = (String) session.getAttribute("cus_id");
    if (user_name != null) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>AdminLTE 2 | Advanced form elements</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.4 -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- daterange picker -->
        <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="plugins/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- Bootstrap Color Picker -->
        <link href="plugins/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
        <!-- Bootstrap time Picker -->
        <link href="plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"/>
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. Choose a skin from the css/skins 
             folder instead of downloading all of them to reduce the load. -->
        <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="plugins/iCheck/all.css" rel="stylesheet" type="text/css" />

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
        <title>Kiosk Form</title>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
        <!-- css -->
        <link rel="stylesheet" href="bootstrap/css/datepicker.min.css" type="text/css">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <!-- css -->
        <!-- js -->
        <script src="bootstrap/js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- date_picker -->
        <script src="bootstrap/js/datepicker.min.js" type="text/javascript"></script>
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
                width:196px;
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
            <!-- Left side column. contains the logo and sidebar -->


            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Advanced Form Elements
                        <small>Preview</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Forms</a></li>
                        <li class="active">Advanced Elements</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container">
                        <div class="row">
                            <div class="tpotr">
                                <div class="col-md-9 col-sm-9 col-lg-9">
                                    <div class="col-md-12 col-sm-12 col-lg-12">
                                        <div class="hedb">Heading Goes Here</div>
                                        <div class="hedb2">Heading Goes Here</div>
                                    </div>
                                    <div class="grety clearfix">
                                        <div class="inrbxr"> <span aria-hidden="true" class="glyphicon glyphicon-time"></span>
                                            <div class="blotxt">Dummy Text goes here</div>
                                        </div>
                                        <div class="inrbxr"> <span aria-hidden="true" class="glyphicon glyphicon-repeat"></span>
                                            <div class="blotxt">Dummy Text goes here</div>
                                        </div>
                                        <div class="inrbxr"> <span aria-hidden="true" class="glyphicon glyphicon-calendar"></span>
                                            <div class="blotxt">Dummy Text goes here</div>
                                        </div>
                                        <div class="inrbxr"> <span aria-hidden="true" class="glyphicon glyphicon-sort"></span>
                                            <div class="blotxt">Dummy Text goes here</div>
                                        </div>
                                        <div class="inrbxr"> <span aria-hidden="true" class="glyphicon glyphicon-upload"></span>
                                            <div class="blotxt">Dummy Text goes here</div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-lg-12">
                                        <div class="hedb2">Heading Goes Here</div>
                                    </div>
                                    <div class="grety clearfix">
                                        <div class="ttrp col-md-2 col-sm-2 col-lg-2">
                                            <label>Trigger</label>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-lg-5">
                                            <select class="slt1 form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-lg-5"></div>
                                        <div class="clear_new"></div>
                                        <div class="ttrp col-md-2 col-sm-2 col-lg-2">
                                            <label>Trigger</label>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-lg-5">
                                            <select class="slt1 form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-lg-5">
                                            <input class="smptu form-control" type="text" name="" id="" value="">
                                            <select class="slt2 form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-lg-12">
                                        <div class="hedb2">Heading Goes Here</div>
                                    </div>
                                    <div class="grety clearfix">
                                        <div class="ttrp col-md-2 col-sm-2 col-lg-2">
                                            <label>Trigger</label>
                                        </div>
                                        <div class="col-md-7 col-sm-7 col-lg-7">
                                            <select class="slt1 form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-lg-5"></div>
                                        <div class="clear_new"></div>
                                        <div class="ttrp col-md-2 col-sm-2 col-lg-2">
                                            <label>Trigger</label>
                                        </div>
                                        <div class="col-md-7 col-sm-7 col-lg-7">
                                            <select class="slt1 form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-lg-3"> </div>
                                        <div class="clear_new"></div>
                                        <div class="ttrp col-md-2 col-sm-2 col-lg-2">
                                            <label>Trigger</label>
                                        </div>
                                        <div class="col-md-7 col-sm-7 col-lg-7">
                                            <select class="slt1 form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-lg-3"> </div>
                                    </div>
                                    <div class="clear_new"></div>
                                    <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                        <input type="radio" name="" id="">
                                    </div>
                                    <div class="rdtxt col-md-11 col-lg-11 col-sm-11">Text Goes Here</div>
                                    <div class="clear_new"></div>
                                    <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                        <input type="radio" name="" id="">
                                    </div>
                                    <div class="rdtxt col-md-11 col-lg-11 col-sm-11">Text Goes Here</div>
                                </div>
                                <div class="col-sm-3 col-md-3 col-lg-3">
                                    <div class="rtr_txtr">
                                        <input type="button" class="fff btn btn-warning" value="text goes here">
                                        <input type="button" class="fff btn btn-success" value="text goes here">
                                        <div class="clear_new"></div>
                                        <div class="hedb2">Heading Goes Here</div>
                                        <div class="gretysm">
                                            <div class="hedb3">Heading Goes Here</div>
                                            <div class="hedb4">Dummy Text Goes Here</div>
                                            <div class="clear_new"></div>
                                            <div class="hedb3">Heading Goes Here</div>
                                            <div class="hedb4">Dummy Text Goes Here</div>
                                        </div>
                                        <div class="clear_new"></div>
                                        <div class="hedb2">Heading Goes Here</div>
                                        <div class="gretysm">
                                            <div class="hedb3">Heading Goes Here</div>
                                            <div class="hedb4">Dummy Text Goes Here</div>
                                            <div class="clear_new"></div>
                                            <div class="hedb3">Heading Goes Here</div>
                                            <div class="hedb4">Dummy Text Goes Here</div>
                                            <div class="clear_new"></div>
                                            <input type="button" class="fff btn btn-primary" value="text goes here">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tpotr">
                                <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="frm_wht clearfix">
                                        <form>
                                            <textarea class="form-control" placeholder="Text Goes Here"></textarea>
                                            <div class="clear_new"></div>
                                            <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                                <input type="radio" id="" name="">
                                            </div>
                                            <div class="rdtxt col-md-4 col-lg-4 col-sm-4">Text Goes Here</div>
                                            <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                                <input type="radio" id="" name="">
                                            </div>
                                            <div class="rdtxt col-md-4 col-lg-4 col-sm-4">Text Goes Here</div>
                                            <div class="clear_new"></div>
                                            <div class="col-md-7 col-sm-7 col-lg-7">
                                                <select class="slt2 form-control">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>
                                            <!-- date -->
                                            <div class="col-md-4 col-sm-4 col-lg-4">
                                                <div class="dtpkr">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <input class="form-control dtpk" type="text" datepicker data-trigger="#partha" placeholder="Check In">
                                                            <span id="partha" class="input-group-addon hmpg"><i class="glyphicon glyphicon-calendar"></i></span> </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- date -->
                                            <div class="clear_new"></div>
                                            <div class="ttrp col-md-3 col-sm-3 col-lg-3">
                                                <label>Trigger</label>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-lg-3">
                                                <select class="slt1 form-control">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-lg-3">
                                                <select class="slt1 form-control">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-lg-3">
                                                <select class="slt1 form-control">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>
                                            <div class="clear_new"></div>
                                            <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                                <input type="radio" id="" name="">
                                            </div>
                                            <div class="rdtxt col-md-11 col-lg-11 col-sm-11">Text Goes Here</div>
                                            <div class="clear_new"></div>
                                            <div class="rdo col-md-1 col-lg-1 col-sm-1">
                                                <input type="radio" id="" name="">
                                            </div>
                                            <div class="rdtxt col-md-11 col-lg-11 col-sm-11">Text Goes Here</div>
                                            <div class="clear_new"></div>
                                            <br>
                                            <div class="linesmr"></div>
                                            <input type="button" value="text goes here" class="fff btn btn-warning">
                                            <input type="button" value="text goes here" class="fff btn btn-success">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 2.0
                </div>
                <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
            </footer>

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
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- InputMask -->
        <script src="plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <!-- date-range-picker -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js" type="text/javascript"></script>
        <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- bootstrap color picker -->
        <script src="plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
        <!-- bootstrap time picker -->
        <script src="plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <!-- SlimScroll 1.3.0 -->
        <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- iCheck 1.0.1 -->
        <script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- FastClick -->
        <script src='plugins/fastclick/fastclick.min.js'></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js" type="text/javascript"></script>
        <!-- Page script -->
        <script type="text/javascript">
            $(function () {
                //Datemask dd/mm/yyyy
                $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                //Datemask2 mm/dd/yyyy
                $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
                //Money Euro
                $("[data-mask]").inputmask();

                //Date range picker
                $('#reservation').daterangepicker();
                //Date range picker with time picker
                $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
                //Date range as a button
                $('#daterange-btn').daterangepicker(
                        {
                            ranges: {
                                'Today': [moment(), moment()],
                                'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                                'Last 7 Days': [moment().subtract('days', 6), moment()],
                                'Last 30 Days': [moment().subtract('days', 29), moment()],
                                'This Month': [moment().startOf('month'), moment().endOf('month')],
                                'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                            },
                            startDate: moment().subtract('days', 29),
                            endDate: moment()
                        },
                function (start, end) {
                    $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
                );

                //iCheck for checkbox and radio inputs
                $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                    checkboxClass: 'icheckbox_minimal-blue',
                    radioClass: 'iradio_minimal-blue'
                });
                //Red color scheme for iCheck
                $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                    checkboxClass: 'icheckbox_minimal-red',
                    radioClass: 'iradio_minimal-red'
                });
                //Flat red color scheme for iCheck
                $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });

                //Colorpicker
                $(".my-colorpicker1").colorpicker();
                //color picker with addon
                $(".my-colorpicker2").colorpicker();

                //Timepicker
                $(".timepicker").timepicker({
                    showInputs: false
                });
            });
        </script>

    </body>
</html>


<%} else {
        response.sendRedirect("index.jsp");
    }%>
