<%-- 
    Document   : index
    Created on : 24 Jun, 2015, 12:21:13 PM
    Author     : surajit
--%>
<%
    String user_name = (String) session.getAttribute("user_name");
    if (user_name != null) {
        response.sendRedirect("dashboard.jsp?status=already_loggedin&otp=" + session.getId());
    } else {
        //response.sendRedirect("index.jsp");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> Admin Log in</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.4 -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <!-- iCheck -->
        <link href="plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="index.jsp"><b>Admin</b>Login</a>
            </div><!-- /.login-logo -->

            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>
                <form action="<%= request.getContextPath()%>/admin_login_auth" name="form" method="post">
                    <div class="form-group has-feedback">
                        <label> User Name</label>
                        <input type="text" class="form-control"  name="unm" id="unm" placeholder="User Name"/>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label> Password</label>
                        <input type="password"  name="pwd" id="pwd" class="form-control" placeholder="Password"/>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">    
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox"> Remember Me
                                </label>
                            </div>                        
                        </div><!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                        </div><!-- /.col -->
                    </div>
                </form>
                <%
                    try {
                        if (request.getParameter("status").equals("1")) {
                %>
                <div style="background: red; width: 100%;padding: 5px 5px 5px 5px;color: #fff;">Invalid Login.</div>
                <%
                } else {
                %>
                <!--                           <div style="background: red; width: 100%;padding: 5px 5px 5px 5px;color: #fff;">Your Account is Temporary Suspended. Login to Continue</div> -->
                <%  }
                    } catch (Exception ex) {
                    }
                %>
                <div class="social-auth-links text-center">
                    <!--                    <p>- OR -</p>
                                        <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
                                        <a href="#" class="btn btn-block btn-social btn-google-plus btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google+</a>-->
                </div><!-- /.social-auth-links -->

                <a href="#">I forgot my password</a><br>
                <a href="register.html" class="text-center">Register a new membership</a><br>
                <a href="super_admin_login.jsp" class="text-center">Super Admin Login</a>

            </div><!-- /.login-box-body -->
        </div><!-- /.login-box -->

        <!-- jQuery 2.1.4 -->
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- iCheck -->
        <script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });
            });
        </script>
    </body>
</html>
<%
    }
%>


