<%-- 
    Document   : demonselect
    Created on : 17 Sep, 2015, 1:22:54 PM
    Author     : parwez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/democss.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script type="text/javascript">
             $( document ).ready(function() {
            $(".dropdown dt a").on('click', function () {
               
          $(".dropdown dd ul").slideToggle('fast');
      });

      $(".dropdown dd ul li a").on('click', function () {
          $(".dropdown dd ul").hide();
      });

      function getSelectedValue(id) {
           return $("#" + id).find("dt a span.value").html();
      }

      $(document).bind('click', function (e) {
          var $clicked = $(e.target);
          if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
      });


      $('.mutliSelect input[type="checkbox"]').on('click', function () {
        
          var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
              title = $(this).val() + ",";
        
          if ($(this).is(':checked')) {
              var html = '<span title="' + title + '">' + title + '</span>';
              $('.multiSel').append(html);
              $(".hida").hide();
          } 
          else {
              $('span[title="' + title + '"]').remove();
              var ret = $(".hida");
              $('.dropdown dt a').append(ret);
              
          }
      });
     
  // Handler for .ready() called.
});
        </script>
    </head>
    <body>
       <dl class="dropdown"> 
  
    <dt>
    <a href="#">
      <span class="hida">Select</span>    
      <p class="multiSel"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect">
            <ul>
                <li>
                    <input type="checkbox" value="Apple" />Apple</li>
                <li>
                    <input type="checkbox" value="Blackberry" />Blackberry</li>
                <li>
                    <input type="checkbox" value="HTC" />HTC</li>
                <li>
                    <input type="checkbox" value="Sony Ericson" />Sony Ericson</li>
                <li>
                    <input type="checkbox" value="Motorola" />Motorola</li>
                <li>
                    <input type="checkbox" value="Nokia" />Nokia</li>
            </ul>
        </div>
    </dd>
  <button>Filter</button>
</dl>
    </body>
</html>
