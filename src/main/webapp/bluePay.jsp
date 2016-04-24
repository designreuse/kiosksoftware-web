<%-- 
    Document   : bluePay
    Created on : 28 Jan, 2016, 12:51:20 PM
    Author     : surajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = request.getParameter("id");
String price = request.getParameter("price");
String type = request.getParameter("type");
%>
<html>

    <head>
        <title>${DBA} | Secure Payment Form</title>

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

        <link href="${SHPF_STATIC_PATH}css/BP-DONATE.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript">
            function setAmount() {
                document.forms.mainform.AMOUNT.value = document.forms.mainform.AMOUNT.value.replace(/[^\d\.\-\ ]/g, '');
            }
        </script>

        <script type="text/javascript">


            function verify() {
                var themessage = "You are required to complete the following fields: \n";

                if (document.forms.mainform.AMOUNT.value == "") {

                    themessage = themessage + " - Amount \n";
                }

                if (document.forms.mainform.NAME.value == "") {
                    themessage = themessage + " - First Name \n";
                }


                if (document.forms.mainform.ADDR1.value == "") {
                    themessage = themessage + " - Billing Address \n";
                }

                if (document.forms.mainform.CITY.value == "") {
                    themessage = themessage + " - City \n";
                }

                if (document.forms.mainform.STATE.value == "") {
                    themessage = themessage + " - State \n";
                }

                if (document.forms.mainform.ZIPCODE.value == "") {
                    themessage = themessage + " - Zip Code \n";
                }

                if (document.forms.mainform.PHONE.value == "") {
                    themessage = themessage + " - Phone Number \n";

                }

                if (document.forms.mainform.PAYMENT_TYPE[0].checked == true) {
                    //alert('CREDIT CARD')
                    if (document.forms.mainform.CC_NUM.value == "") {
                        themessage = themessage + " - Credit Card Number \n";
                    }

                    if (document.forms.mainform.CC_EXPIRES_MONTH.value == "") {
                        themessage = themessage + " - Card Expiration Month \n";
                    }
                    if (document.forms.mainform.CC_EXPIRES_YEAR.value == "") {
                        themessage = themessage + " - Card Expiration Year \n";
                    }
                    if (document.forms, mainform.CVCCVV2.value == "") {
                        themessage = themessage + " - CVV \n";
                    }
                }
                if (document.forms.mainform.PAYMENT_TYPE[1].checked == true) {
                    //alert('ACH')
                    if (document.forms.mainform.ACH_ROUTING.value == "") {
                        themessage = themessage + " - Routing Number \n";
                    }
                    if (document.forms.mainform.ACH_ACCOUNT.value == "") {
                        themessage = themessage + " - Bank Account Number \n";
                    }
                }


                //alert if fields are empty and cancel form submit
                if (themessage != "You are required to complete the following fields: \n") {
                    alert(themessage);
                    return false;

                }
            }

            function DisplayPayType(PayType) {
                obj_CREDIT_01 = (document.all) ? document.all.CREDIT_INPUT_01 : document.getElementById('CREDIT_INPUT_01');
                obj_CREDIT_02 = (document.all) ? document.all.CREDIT_INPUT_02 : document.getElementById('CREDIT_INPUT_02');
                obj_CREDIT_03 = (document.all) ? document.all.CREDIT_INPUT_03 : document.getElementById('CREDIT_INPUT_03');
                obj_CREDIT_04 = (document.all) ? document.all.CREDIT_INPUT_04 : document.getElementById('CREDIT_INPUT_04');
                obj_ACH_01 = (document.all) ? document.all.ACH_INPUT_01 : document.getElementById('ACH_INPUT_01');
                obj_ACH_02 = (document.all) ? document.all.ACH_INPUT_02 : document.getElementById('ACH_INPUT_02');
                obj_ACH_03 = (document.all) ? document.all.ACH_INPUT_03 : document.getElementById('ACH_INPUT_03');




                if (PayType == 'ACH') {
                    obj_CREDIT_01.style.display = "none";
                    obj_CREDIT_02.style.display = "none";
                    obj_CREDIT_03.style.display = "none";
                    obj_CREDIT_04.style.display = "none";
                    obj_ACH_01.style.display = "table-row";
                    obj_ACH_02.style.display = "table-row";
                    obj_ACH_03.style.display = "table-row";


                } else {
                    obj_CREDIT_01.style.display = "table-row";
                    obj_CREDIT_02.style.display = "table-row";
                    obj_CREDIT_03.style.display = "table-row";
                    obj_CREDIT_04.style.display = "table-row";
                    obj_ACH_01.style.display = "none";
                    obj_ACH_02.style.display = "none";
                    obj_ACH_03.style.display = "none";


                }

            }

            function DisplayRebill(Rebill) {

                obj_REBILL_01 = (document.all) ? document.all.REBILL_INPUT_01 : document.getElementById('REBILL_INPUT_01');


                if (Rebill == 'SINGLE') {
                    obj_REBILL_01.style.display = "table-row";


                } else {
                    obj_REBILL_01.style.display = "none";

                }

                if (document.forms.mainform.REBILLING[1].checked == true) {
                    document.forms.mainform.REB_FIRST_DATE.value = document.forms.mainform.REB_EXPR.value

                }
            }

            // Set values



            function popup(mylink, windowname) {
                if (!window.focus)
                    return true;
                var href;
                if (typeof (mylink) == 'string')
                    href = images / cvv.jpg;
                else
                    href = mylink.href;
                window.open(href, windowname, 'width=500,height=400,scrollbars=yes');
                return false;
            }

//-->
        </script> 
    </head>

    <body>

        <div id="wrap-border"><div id="wrap">

                <div id="header">

                    <div id="header-dba">
                        <div class="title-head">${DBA}</div>  
                        <div style="clear: both;"></div>

                    </div>
                </div>

                <div id="form-table">
                    <body onload="DisplayPayType('CREDIT');
                            DisplayRebill('SINGLE')">
                        <form id="mainform" class="mainform"  action="<%=request.getContextPath()%>/PaymentAction" method="post">
                            <!--<input type="hidden" name="MERCHANT" value="100287554380"/>
                            <input type="hidden" name="TRANSACTION_TYPE" value="${TRANSACTION_TYPE}"/>
                            <input type="hidden" name="TAMPER_PROOF_SEAL" value="${TAMPER_PROOF_SEAL}"/>			
                            <input type="hidden" name="APPROVED_URL" value="${REDIRECT_URL}"/>
                            <input type="hidden" name="DECLINED_URL" value="${REDIRECT_URL}"/>
                            <input type="hidden" name="MISSING_URL"  value="${REDIRECT_URL}"/>
                            <input type="hidden" name="MODE"         value="${MODE}"/>
                            <input type="hidden" name="CUSTOM_ID"        value="${CUSTOM_ID}"/>
                            <input type="hidden" name="CUSTOM_ID2"        value="${CUSTOM_ID2}"/>
                            <input type="hidden" name="DOC_TYPE"        value="WEB"/>
                            <input type="hidden" name="ACH_ACCOUNT_TYPE"        value="C"/>
                            <input type="hidden" name="COMMENT"        value=""/>			
                            <input type="hidden" name="REB_CYCLES"   value="${REB_CYCLES}"/>
                            <input type="hidden" name="REB_AMOUNT"   value="${REB_AMOUNT}"/>			
                            <input type="hidden" name="REB_FIRST_DATE" value="${REB_FIRST_DATE}"/>
                            <input type="hidden" name="TPS_DEF" value="${TPS_DEF}"/>
                            <input type="hidden" name="MERCHDATA_shpf-form-id"         value="default8Dv5R"/>-->

                            <!--<input type="hidden" name="TRANSACTION_TYPE" value="SALE" />

                            <input type="hidden" name="APPROVED_URL" value="https://secure.bluepay.com/interfaces/shpf?SHPF_FORM_ID=mobileresult01&SHPF_ACCOUNT_ID=100155584807&SHPF_TPS_DEF=SHPF_ACCOUNT_ID SHPF_FORM_ID RETURN_URL DBA AMEX_IMAGE DISCOVER_IMAGE SHPF_TPS_DEF&SHPF_TPS=2bd02e08a400072786a4959476998d01&RETURN_URL=http%3A%2F%2Fwww%2Ebluepay%2Ecom&DBA=Merchant%20Name&AMEX_IMAGE=amex%2Egif&DISCOVER_IMAGE=discvr%2Egif" />
                            <input type="hidden" name="DECLINED_URL" value="https://secure.bluepay.com/interfaces/shpf?SHPF_FORM_ID=mobileresult01&SHPF_ACCOUNT_ID=100155584807&SHPF_TPS_DEF=SHPF_ACCOUNT_ID SHPF_FORM_ID RETURN_URL DBA AMEX_IMAGE DISCOVER_IMAGE SHPF_TPS_DEF&SHPF_TPS=2bd02e08a400072786a4959476998d01&RETURN_URL=http%3A%2F%2Fwww%2Ebluepay%2Ecom&DBA=Merchant%20Name&AMEX_IMAGE=amex%2Egif&DISCOVER_IMAGE=discvr%2Egif" />
                            <input type="hidden" name="MISSING_URL" value="https://secure.bluepay.com/interfaces/shpf?SHPF_FORM_ID=mobileresult01&SHPF_ACCOUNT_ID=100155584807&SHPF_TPS_DEF=SHPF_ACCOUNT_ID SHPF_FORM_ID RETURN_URL DBA AMEX_IMAGE DISCOVER_IMAGE SHPF_TPS_DEF&SHPF_TPS=2bd02e08a400072786a4959476998d01&RETURN_URL=http%3A%2F%2Fwww%2Ebluepay%2Ecom&DBA=Merchant%20Name&AMEX_IMAGE=amex%2Egif&DISCOVER_IMAGE=discvr%2Egif" />
                            <input type="hidden" name="MODE" value="TEST" />
                            <input type="hidden" name="CUSTOM_ID" value="" />
                            <input type="hidden" name="CUSTOM_ID2" value="" />
                            <input type="hidden" name="DOC_TYPE" value="WEB" />
                            <input type="hidden" name="ACH_ACCOUNT_TYPE" value="C" />
                            <input type="hidden" name="COMMENT" value="" />
                            <input type="hidden" name="REB_CYCLES" value="" />
                            <input type="hidden" name="REB_AMOUNT" value="" />

                            <input type="hidden" name="TPS_DEF" value="MERCHANT APPROVED_URL DECLINED_URL MISSING_URL MODE TRANSACTION_TYPE TPS_DEF REBILLING REB_CYCLES REB_AMOUNT REB_EXPR REB_FIRST_DATE" />
                            <input type="hidden" name="MERCHDATA_shpf-form-id" value="default8Dv5R" />-->

                            <table id="payment_info">

                                <tbody>

                                <td><b>Donation Type:<b></td>
                                            <td align="right"><input type="radio" name="REBILLING" value="0" checked onclick="DisplayRebill('SINGLE')">Single Donation &nbsp &nbsp &nbsp <input type="radio" name="REBILLING" value="1" checked="" onclick="DisplayRebill('SINGLE')">Recurring Donation</td>
                                            </tr>
                                            <tr id="REBILL_INPUT_01">
                                                <td>Recurring Period:</td>
                                                <td><select name="REB_EXPR" disabled="" onchange="DisplayRebill('REBILL')">
                                                        <option value="1 MONTH">Monthly</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>              
                                                <td style="height: 25px";>Amount:</td>
                                                <td><input type="text" class="form" name="AMOUNT" id="AMOUNT" value="<%=price%>" readonly="" autocomplete="off"/></td>         
                                            </tr>




                                            <tr>
                                                <td style="vertical-align:middle;"><b>Payment Information:</b></td>			  
                                            <tr>
                                                <td class="radio"><label>Credit Card:</label><input type="radio" name="PAYMENT_TYPE" value="CREDIT" class="form" checked onclick="DisplayPayType('CREDIT')"></td>
                                            </tr>
                                            <tr>
                                                <td class="radio"><label>Electronic Check</label><input type="radio" name="PAYMENT_TYPE" value="ACH" class="form" onclick="DisplayPayType('ACH')"></td>
                                            </tr>


                                            <tr id="CREDIT_INPUT_01" >	
                                                <td style="height: 50px; vertical-align:middle;"><b>Cards Accepted:</b></td> 			  
                                                <td colspan="3" style="vertical-align:bottom;"><img src="${SHPF_STATIC_PATH}images/visa.gif" alt="visa"/><img src="${SHPF_STATIC_PATH}images/mc.gif" alt="mastercard"/><img src="${SHPF_STATIC_PATH}images/discvr.gif" alt="discover"/><img src="${SHPF_STATIC_PATH}images/${AMEX_IMAGE}" alt=""/></td>	  
                                                <td></td></tr>




                                            <tr id="CREDIT_INPUT_02">
                                                <td>Card Number:</td>
                                                <td><input type="text" class="form" name="CC_NUM" value="" autocomplete="off" maxlength="16"/>

                                            </tr>

                                            <tr id="CREDIT_INPUT_03">
                                                <td>Expiration Date:</td>
                                                <td><select name="CC_EXPIRES_MONTH">
                                                        <option value="" SELECTED>--Month--</option>
                                                        <option value="01">01</option>
                                                        <option value="02">02</option>
                                                        <option value="03">03</option>
                                                        <option value="04">04</option>
                                                        <option value="05">05</option>
                                                        <option value="06">06</option>
                                                        <option value="07">07</option>
                                                        <option value="08">08</option>
                                                        <option value="09">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select> /
                                                    <select name="CC_EXPIRES_YEAR">
                                                        <option value="" SELECTED>--Year--</option>			
                                                        ${SHPF_YEARBLOCK}
                                                    </select>
                                                </td>
                                            </tr>



                                            <tr id="CREDIT_INPUT_04">
                                                <td>CVV2 : <a href="${SHPF_STATIC_PATH}images/cvv.jpg" onClick="return popup(this, 'notes')">What's this?</A></td>
                                                <td><div id="8"><input type="text" class="form" name="CVCCVV2" value="" maxlength="4" autocomplete="off"/>
                                            </tr>

                                            <tr id="ACH_INPUT_01" >	
                                                <td colspan="3" style="vertical-align:bottom;"><img src="${SHPF_STATIC_PATH}images/check.gif" alt="echeck"/></td>	  
                                                <td></td></tr>

                                            <tr id="ACH_INPUT_02">
                                                <td style="height: 25px; vertical-align:bottom;">Routing Number:</td>
                                                <td><input type="text" class="form" name="ACH_ROUTING" value="" autocomplete="off" maxlength="9"/> </td>  
                                            </tr>

                                            <tr id="ACH_INPUT_03">
                                                <td>Account Number:</td>
                                                <td><input type="text" class="form" name="ACH_ACCOUNT" value="" autocomplete="off"/> </td>   

                                            </tr>
                                            <tr>
                                                <td colspan="4" style="height: 50px; vertical-align:bottom;"><b>Billing Information:</b></td>
                                            </tr>

                                            <tr>
                                                <td>First Name:</td><td><input type="text" class="form"  name="NAME" value="${NAME}" autocomplete="off"/></td>
                                                <td>Last Name</td><td><input type="text" class="form"  name="LAST_NAME" value="${COMPANY_NAME}" autocomplete="off"/></td>
                                            </tr>

                                            <tr>
                                                <td>Billing Address:</td><td><input type="text" class="form"  name="ADDR1" value="${ADDR1}" autocomplete="off"/></td>
                                                <td>City:</td><td><input type="text" class="form"  name="CITY" value="${CITY}" autocomplete="off"/></td>
                                            </tr>

                                            <tr>
                                                <td>State/Province:</td><td><input type="text" class="form"  name="STATE" value="${STATE}" autocomplete="off"/></td>
                                                <td>Country:</td><td><input type="text" name="COUNTRY" class="form" value="${COUNTRY}" autocomplete="off"/></td>			  
                                            </tr>

                                            <tr>
                                                <td>Zip/Postal Code:</td><td><input type="text" class="form"  name="ZIPCODE" value="${ZIPCODE}" autocomplete="off"/></td>
                                                <td>Email:</td><td><input type="text" class="form"  name="EMAIL" value="${EMAIL}" autocomplete="off"/></td>
                                            </tr>

                                            <tr>
                                                <td>Phone: xxx-xxx-xxxx</td><td><input type="text" class="form"  name="PHONE" value="${PHONE}" maxlength="12"autocomplete="off"/></td>
                                            </tr>

                                            <tr>
                                                <td colspan="4"><br></td>
                                            </tr>
                                            </table>
                                            <table>
                                                <td>Comments:</td>
                                                </tr>
                                                <tr>						
                                                    <td><textarea cols="46" rows="5" name="COMMENT"></textarea></td>	
                                                </tr>
                                            </table>
                                            <table>

                                                <tr>
                                                    <td colspan="4" style="text-align:left"><input type="submit" value="PAY" class="button"  onClick="return verify()"  /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><a href="http://www.bluepay.com" target="new"><img src="${SHPF_STATIC_PATH}images/BluePay2.png" border="0" alt="securebybluepay" /></a></td><td></td>
                                                </tr>


                                                </tbody>
                                            </table>


                                            </form>  
                                            </div>      
                                            <div id="footer">       
                                            </div>

                                            </div></div>
                                            </body>
                                            </html>