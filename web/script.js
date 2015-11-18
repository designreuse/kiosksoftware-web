/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#pwd").keyup(function () {
        $('#pswd_info').show();
        alert("ahaghagg");
    }).blur(function () {
        $('#pswd_info').hide();
    });
});