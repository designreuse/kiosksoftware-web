<%-- 
    Document   : setting
    Created on : 14 Sep, 2015, 4:06:05 PM
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
        <title><%=config.getServletContext().getInitParameter("projectname")%> | Create Role</title>
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
                        Setting

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Setting</li>
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
                            Member Group Created!
                        </div>
                        <%} else {%>
                        <div style=" background: red; padding: 3px 3px 3px 3px; width: 97% ;margin-left: 5px;margin-bottom: 5px;color: #ffffff; ">
                            There Goes Something Wrong! 
                        </div>
                        <%}
                            } catch (Exception e) {
                            }%>
                        <!-- 14-09-15 -->
                        <div class="col-md-12 col-sm-12 white_back">
                            <div class="blue_hd">Your Account</div>  
                            <div class="acl_cllr"></div> 


                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/stars.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="manage_subscription.jsp?&opt=<%=session.getId()%>">Manage Subscription</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="manage_subscription.jsp?&opt=<%=session.getId()%>">Manage your subscription details</a></h4>

                                    </div>
                                </div>  

                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/company.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="company_details.jsp?&opt=<%=session.getId()%>">Company Details</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="company_details.jsp?&opt=<%=session.getId()%>">Update your Company details</a></h4>

                                    </div>
                                </div>  

                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/users.png" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="change_adminpassword.jsp?&opt=<%=session.getId()%>">Change Your Password</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="change_adminpassword.jsp?&opt=<%=session.getId()%>">Change Your Current Password For Better Security</a></h4>

                                    </div>
                                </div>  

                            </div>                          
                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/users.png" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="cancel_admin_account.jsp?&opt=<%=session.getId()%>">Cancel Your Account</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="cancel_admin_account.jsp?&opt=<%=session.getId()%>">Cancel Your Reccuring Payment Account</a></h4>
                                    </div>
                                </div>  

                            </div>




                            <div class="acl_cllr"></div>

                            <hr class="greycol">

                            <div class="acl_cllr"></div> 
                            <div class="blue_hd">Kiosk Control</div>  
                            <div class="acl_cllr"></div>

                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/vat.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="kiosk_management.jsp?&opt=<%=session.getId()%>">Kiosk Management</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="kiosk_management.jsp?&opt=<%=session.getId()%>">Manage your kiosk details</a></h4>

                                    </div>
                                </div>  

                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/vat.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="view_list_of_kiosk.jsp?&opt=<%=session.getId()%>">Kiosk List</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="view_list_of_kiosk.jsp?&opt=<%=session.getId()%>">View your Kiosk details</a></h4>

                                    </div>
                                </div>  

                            </div>


                            <div class="acl_cllr"></div> 
                            <hr class="greycol">
                            <div class="acl_cllr"></div> 
                            <div class="blue_hd">Promotion Administration</div>  
                            <div class="acl_cllr"></div>

                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/salestypes.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="creategroup.jsp?&opt=<%=session.getId()%>">Promotional Tier Categories</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="creategroup.jsp?&opt=<%=session.getId()%>">Manage your Promotional details</a></h4>

                                    </div>
                                </div>  

                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/salestypes.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="viewgroup.jsp?&opt=<%=session.getId()%>">Promotional Tier Categories List</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="viewgroup.jsp?&opt=<%=session.getId()%>">View your Promotional details</a></h4>

                                    </div>
                                </div>  

                            </div>




                            <div class="acl_cllr"></div>

                            <hr class="greycol">

                            <div class="acl_cllr"></div> 
                            <div class="blue_hd">User Roles And Permissions</div>  
                            <div class="acl_cllr"></div>

                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/vat.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="create_user.jsp?&opt=<%=session.getId()%>">Create Users</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="create_user.jsp?&opt=<%=session.getId()%>">Create your User</a></h4>

                                    </div>
                                </div>  

                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/vat.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="view_list_of_users.jsp?&opt=<%=session.getId()%>">Manage User</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="view_list_of_users.jsp?&opt=<%=session.getId()%>">Manage your User details</a></h4>

                                    </div>
                                </div>  

                            </div>


                            <div class="acl_cllr"></div> 


                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/salestypes.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="create_role.jsp?&opt=<%=session.getId()%>">Create Roles</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="create_role.jsp?&opt=<%=session.getId()%>">Manage your Roles details</a></h4>

                                    </div>
                                </div>  

                            </div>


                            <div class="col-lg-6 col-md-6 col-sm-6 clearfix">
                                <div class="in_wh_bx clearfix">
                                    <div class="sm_lft_pic"><a href="#"><img src="images/salestypes.gif" alt=""></a></div>

                                    <div class="tp_rgh_hdng">
                                        <h3><a href="auto_checkin_checkout.jsp?&opt=<%=session.getId()%>">Auto Timer</a></h3>
                                        <div class="acl_cllr"></div> 
                                        <h4><a href="create_auto_timer.jsp?&opt=<%=session.getId()%>">Manage your timer</a></h4>

                                    </div>
                                </div>  

                            </div>

                            <div class="acl_cllr"></div>



                        </div>


                        <!-- 14-09-15 -->

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
