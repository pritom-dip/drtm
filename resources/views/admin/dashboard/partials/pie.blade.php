@push('page-scripts')
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {
            packages: ["corechart"]
        });
        google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var tas = [];

                var data = google.visualization.arrayToDataTable([
                    ['Service', 'Amount'],
                    @php
                    foreach($tasks as $task) {
                        echo "['".$task[0]."', ".$task[1]."],";
                    }
                    @endphp
                ]);

                var options = {
                    title: 'Revenue',
                    is3D: true,
                };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>

@endpush

<div id="piechart_3d" style="width: 100%; height: 360px;"></div>