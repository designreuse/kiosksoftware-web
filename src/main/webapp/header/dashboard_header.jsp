<%-- 
    Document   : dashboard_header
    Created on : 24 Jun, 2015, 12:41:57 PM
    Author     Parwez
--%>
<header class="main-header">
    <!-- Logo -->
    <%@include file="../conn.jsp" %>
    <a href="dashboard.jsp?type=already_loggedin&opt=<%=session.getId()%>" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><%=session.getAttribute("storedisp")%></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b><%=session.getAttribute("storedisp")%></b></span>
    </a>


    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <%  int countpromotion = 0;
                    java.sql.Statement stchkpromotion = conn.createStatement();
                    java.sql.ResultSet rschkstchkpromotion = stchkpromotion.executeQuery("SELECT * FROM loyalty_promotion where adminid='" + cus_id + "' && status='active'");
                    while (rschkstchkpromotion.next()) {
                        countpromotion++;
                    }

                %>
                <!-- Messages: style can be found in dropdown.less-->
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <%if (countpromotion == 0) {%>
                        <span class="label label-success"></span>
                        <%} else {%>
                        <span class="label label-success"><%=countpromotion%></span>
                        <% }
                        %>

                    </a>
                    <ul class="dropdown-menu">
                        <%
                            if (countpromotion == 0) {%>
                        <li class="header">You have no message</li>
                            <%} else {%>
                        <li class="header">You have <%=countpromotion%> messages</li>
                            <% }
                            %>

                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <%
                                    if (countpromotion == 0) {%>

                                <%} else {%>

                                <%
                                    java.sql.Statement stchkpromotionmainpart = conn.createStatement();
                                    java.sql.ResultSet rschkstchkpromotionstchkpromotionmainpart = stchkpromotionmainpart.executeQuery("SELECT * FROM loyalty_promotion where adminid='" + cus_id + "' && status='active'");
                                    while (rschkstchkpromotionstchkpromotionmainpart.next()) {
                                //out.print(countpromotion++);

                                %>
                                <li><!-- start message -->
                                    <a href="view_promortion_noti.jsp?id=<%=rschkstchkpromotionstchkpromotionmainpart.getString("id")%>">
                                        <div class="pull-left">

                                        </div>
                                        <h4>
                                            <%=rschkstchkpromotionstchkpromotionmainpart.getString("promotionname")%>
                                            <small><i class="fa fa-clock-o"></i> </small>
                                        </h4>
                                        <p><%=rschkstchkpromotionstchkpromotionmainpart.getString("description")%></p>
                                    </a>
                                </li>
                                <%}%>

                                <% }
                                %>
                                <!-- end message -->
                                <!--                                <li>
                                                                    <a href="#">
                                                                        <div class="pull-left">
                                                                            <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="user image"/>
                                                                        </div>
                                                                        <h4>
                                                                            AdminLTE Design Team
                                                                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                                        </h4>
                                                                        <p>Why not buy a new awesome theme?</p>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <div class="pull-left">
                                                                            <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="user image"/>
                                                                        </div>
                                                                        <h4>
                                                                            Developers
                                                                            <small><i class="fa fa-clock-o"></i> Today</small>
                                                                        </h4>
                                                                        <p>Why not buy a new awesome theme?</p>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <div class="pull-left">
                                                                            <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="user image"/>
                                                                        </div>
                                                                        <h4>
                                                                            Sales Department
                                                                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                                        </h4>
                                                                        <p>Why not buy a new awesome theme?</p>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <div class="pull-left">
                                                                            <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="user image"/>
                                                                        </div>
                                                                        <h4>
                                                                            Reviewers
                                                                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                                        </h4>
                                                                        <p>Why not buy a new awesome theme?</p>
                                                                    </a>
                                                                </li>-->
                            </ul>
                        </li>
                        <li class="footer"><a href="#">See All Messages</a></li>
                    </ul>
                </li>
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown notifications-menu">
                    <%
                        int countproblem = 0;
                        java.sql.Statement stchkcountproblem = conn.createStatement();
                        java.sql.ResultSet rschkcountproblem = stchkcountproblem.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "' && status='active' && allocate_ip='0'");
                        while (rschkcountproblem.next()) {
                            countproblem++;
                        }

                    %>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <%if (countproblem == 0) {%>
                        <span class="label label-warning"></span>
                        <%} else {%>
                        <span class="label label-warning"><%=countproblem%></span>

                        <% }
                        %>

                    </a>
                    <ul class="dropdown-menu">
                        <%
                            if (countproblem == 0) {%>
                        <li class="header">You have no notifications</li>
                            <%} else {%>
                        <li class="header">You have <%=countproblem%> notifications</li>
                            <%   }
                            %>

                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <%
                                    if (countproblem == 0) {%>

                                <%} else {%>

                                <%
                                    java.sql.Statement stchkproblemmainpart = conn.createStatement();
                                    java.sql.ResultSet rschkstchkproblemstchkpromotionmainpart = stchkproblemmainpart.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "' && status='active' && allocate_ip='0'");
                                    while (rschkstchkproblemstchkpromotionmainpart.next()) {
                                //out.print(countpromotion++);

                                %>
                                <li><!-- start message -->
                                    <a href="#">
                                        <i class="fa fa-users text-aqua"></i>License no <%=rschkstchkproblemstchkpromotionmainpart.getString("license_nos")%>  didn't allocated any IP.
                                    </a>
                                </li>
                                <%}%>

                                <% }
                                %>


                            </ul>
                        </li>
                        <li class="footer"><a href="#">View all</a></li>
                    </ul>
                </li>
                <!-- Tasks: style can be found in dropdown.less -->
                <li class="dropdown tasks-menu">
                    <%
                        int countrunningkiosk = 0;
                        java.sql.Statement stchkcountrunningkiosk = conn.createStatement();
                        java.sql.ResultSet rschkcountrunningkiosk = stchkcountrunningkiosk.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "' && status='active' && allocate_ip!='0'");
                        while (rschkcountrunningkiosk.next()) {
                            countrunningkiosk++;
                        }
                        

                    %>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o"></i>
                        <%if (countrunningkiosk == 0) {%>
                        <span class="label label-danger"></span>
                        <%} else {%>
                        <span class="label label-danger"><%=countrunningkiosk%></span>

                        <% }
                        %>
                        
                    </a>
                    <ul class="dropdown-menu">
                        <%
                            if (countrunningkiosk == 0) {%>
                        <li class="header">You have no notifications</li>
                            <%} else {%>
                        <li class="header">You have <%=countrunningkiosk%> notifications</li>
                            <%   }
                            %>
                        
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <%
                                    if (countrunningkiosk == 0) {%>

                                <%} else {%>

                                <%
                                        
                                    java.sql.Statement stchkrunningkioskmainpart = conn.createStatement();
                                    java.sql.ResultSet rschkstchkrunningkioskmainpart = stchkrunningkioskmainpart.executeQuery("SELECT * FROM loyalty_allocate_subscription_plan where admin_id='" + cus_id + "' && status='active' && allocate_ip!='0'");
                                    while (rschkstchkrunningkioskmainpart.next()) {
                                //out.print(countpromotion++);

                                %>
                                <li><!-- Task item -->
                                    <a href="#">
                                        <h3>
                                           License No <%=rschkstchkrunningkioskmainpart.getString("license_nos")%> running.
                                            <small class="pull-right"></small>
                                        </h3>
<!--                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>-->
                                    </a>
                                </li>
                                
                                
                                <%}%>

                                <% }
                                %>
                                
                                <!-- end task item -->
                               <!-- end task item -->
                                <!-- end task item -->
                            </ul>
                        </li>
                        <li class="footer">
                            <a href="#">View all tasks</a>
                        </li>
                    </ul>
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<%=request.getContextPath()%>/uploads/<%=session.getAttribute("image")%>" class="user-image" alt="Loading Image.."/>
                        <span class="hidden-xs"><%=user_name%></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="<%=request.getContextPath()%>/uploads/<%=session.getAttribute("image")%>" class="img-circle" alt="Loading Image.." />
                            <p>
                                <%=session.getAttribute("firstname") + " " + session.getAttribute("lastname")%>
                                <!--                                <small>Member since Nov. 2012</small>-->
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <!--                        <li class="user-body">
                                                    <div class="col-xs-4 text-center">
                                                        <a href="#">Followers</a>
                                                    </div>
                                                    <div class="col-xs-4 text-center">
                                                        <a href="#">Sales</a>
                                                    </div>
                                                    <div class="col-xs-4 text-center">
                                                        <a href="#">Friends</a>
                                                    </div>
                                                </li>-->
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="company_details.jsp" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="<%=request.getContextPath()%>/admin_logout" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>
