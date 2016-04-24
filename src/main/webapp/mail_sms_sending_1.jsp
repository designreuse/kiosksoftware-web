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
<!doctype html>
<html>
    <head>
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
    <body>
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
    </body>
</html>

<%} else {
        response.sendRedirect("index.jsp");
    }%>
