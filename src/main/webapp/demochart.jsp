<%-- 
    Document   : demochart
    Created on : 31 Aug, 2015, 6:15:14 PM
    Author     : parwez
--%>
<html>
    <head>
        <script type="text/javascript"
                src="https://www.google.com/jsapi?autoload={
                'modules':[{
                'name':'visualization',
                'version':'1',
                'packages':['corechart']
                }]
        }"></script>

        <script type="text/javascript">
                    google.setOnLoadCallback(drawChart);
                    function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                            ['Year', 'Sales', 'Expenses'],
                            ['2004', 40, 40],
                            ['2005', 0, 40],
                            ['2006', 40, 40],
                            ['2007', 40, 40]
                    ]);
                            var options = {
                            title: 'Company Performance',
                                    curveType: 'function',
                                    legend: { position: 'bottom' }
                            };
                            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
                            chart.draw(data, options);
                    }
        </script>
    </head>
    <body>
        <div id="curve_chart" style="width: 900px; height: 500px"></div>
    </body>
</html>