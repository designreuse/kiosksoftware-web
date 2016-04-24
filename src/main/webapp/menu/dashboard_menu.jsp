<%-- 
    Document   : dashboard_menu
    Created on : 24 Jun, 2015, 12:43:50 PM
    Author     : Parwez
--%>


<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<%=request.getContextPath()%>/uploads/<%=session.getAttribute("image")%>" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <%=session.getAttribute("firstname")+" "%><%=session.getAttribute("lastname")%>
                <br/>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
                <span class="input-group-btn">
                    <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="active treeview">
                <a href="superdashboard.jsp?&opt=<%=session.getId()%>">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span> 
                </a>
                <!--<ul class="treeview-menu">
                  <li class="active"><a href="index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                  <li><a href="index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
                </ul>-->
            </li>


            <li class="header">Settings</li>
            <li><a href="create_admin.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Create Admin</span></a></li>
            <li><a href="superadmin_details.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Superadmin Details</span></a></li>
            <li><a href="create_subscription_plan.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-red"></i> <span>Create Subscription Plan</span></a></li>
            <li><a href="allocate_subscription_plan.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-red"></i> <span>Allocate Subscription Plan</span></a></li>
            <li><a href="view_enquirylog.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-yellow"></i> <span>Enquiry Log</span></a></li>
            <li><a href="view_orderdetails.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Order Details</span></a></li>

            <li><a href="view_current_subscriber_list.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-yellow"></i> <span>Current Subscriber List</span></a></li>
            <li><a href="view_deleted_subscriber_list.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-red"></i> <span>Deleted Subscriber List</span></a></li>
            <li><a href="view_free_subscriber_list.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Free Subscriber List</span></a></li>
            <li><a href="view_totalsubscriber_list.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-yellow"></i> <span>Total Subscriber List</span></a></li>
            <li class="header">View</li>
            <li><a href="view_subscription_plan.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-red"></i> <span>View Subscription Details</span></a></li>
            <li><a href="admin_detals.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>View Admin Details</span></a></li>
            <!--<li><a href="create_subscription_plan.jsp"><i class="fa fa-circle-o text-red"></i> <span>Create Subscription Plan</span></a></li>
            <li><a href=""><i class="fa fa-circle-o text-yellow"></i> <span>Enquiry Log</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Order Details</span></a></li>-->
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>