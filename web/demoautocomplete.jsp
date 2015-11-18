<%-- 
    Document   : demoautocomplete
    Created on : 3 Sep, 2015, 2:26:04 PM
    Author     : parwez
--%>


<!doctype html>
<html lang="en">
<head>
    <%@include file="conn.jsp" %>
  <meta charset="utf-8">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
   <%

                java.sql.Statement stcontact = conn.createStatement();
                java.sql.ResultSet rsstcontact = stcontact.executeQuery("select * from sengroup_new_member_reg_details");
            %>
                    var availableTags = [
            <% while (rsstcontact.next()) {
            %>
                    "<%=rsstcontact.getString("fullname")%>",
            <%}%>
                    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>
 
 
</body>
</html>