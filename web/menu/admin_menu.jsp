<%-- 
    Document   : admin_menu
    Created on : 30 Jun, 2015, 4:16:26 PM
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
                <%=user_name%>
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
                <a href="dashboard.jsp?type=already_loggedin&opt=<%=session.getId()%>">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>

            </li>
            <li class="header">Setting</li>
            <li><a href="setting.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Setting</span></a></li>
        
            <li class="header">Promotions</li>
            <li><a href="create_promotion.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Manage Promotion</span></a></li>
            <li><a href="Create_Promotionoffer.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Send Promotion</span></a></li>
            <li><a href="view_list_of_users.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>User List</span></a></li>
            <li><a href="view_list_of_members.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Loyality Customer</span></a></li>
            
            <li class="header">Kiosk Control</li>
        <!--    <li><a href="kiosk_management.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Kiosk Management</span></a></li>  -->
            <li><a href="view_list_of_kiosk.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>KIOSK List</span></a></li>
            <li class="header">Purchase Entry</li>
            <li><a href="daily_purchase_entry.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Update Promotion Inventory</span></a></li>
            <li class="header">Report</li>
            <!--<li><a href="generate_card.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Print Card</span></a></li>-->
            <li><a href="member_details.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Manage Rewards Card</span></a></li>
            
            <!--<li><a href="view_list_of_users_op.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>View User Details</span></a></li>-->
            <li><a href="view_list_of_members_op.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>View Customer Details</span></a></li>
            <li><a href="list_of_item_pur_user_wise.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>Promotion Report</span></a></li>
            <li><a href="List_of_daily_points_gain_form.jsp?&opt=<%=session.getId()%>"><i class="fa fa-circle-o text-aqua"></i> <span>View List daily points gain</span></a></li>
            
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>