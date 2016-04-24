<%-- 
    Document   : super_admin_login
    Created on : 24 Jun, 2015, 12:22:33 PM
    Author     : surajit
--%>
<%@page import="com.loyalty.card.msg.failed"%>
<%
    failed failed_msg = new failed();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head/dashboardhead.jsp" %>
    <body class="login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="index.html"><b>Super Admin</b>Login</a>
            </div><!-- /.login-logo -->

            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>
                <form action="<%=request.getContextPath()%>/log_in" method="post" >
                    <div class="form-group has-feedback">
                        <%
                            try {

                        %>

                        <%                              if (request.getParameter("status").equals("2")) {
                        %>
                        <div style=" width: 98%; color: #fff; background: red;padding: 3px 3px 3px 3px;
                             font-weight: bold;">
                            <%=failed_msg.getInvalidLogin()%>
                        </div>
                        <%
                            }
                        %>
                        <%
                            } catch (Exception e) {
                            }
                        %>
                        <label> username/email</label>
                        <input type="text" class="form-control" name="unm" id="unm" placeholder="Email/username"/>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label> password </label>
                        <input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password"/>
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

                <!--                <div class="social-auth-links text-center">
                                    <p>- OR -</p>
                                    <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
                                    <a href="#" class="btn btn-block btn-social btn-google-plus btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google+</a>
                                </div> /.social-auth-links -->

                <a href="#">I forgot my password</a><br>
                <a href="register.html" class="text-center">Register a new membership</a><br>
                <a href="index.jsp" class="text-center">Admin Login</a>

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


