<#import "base.ftl" as b>

<@b.base>
<div class="row">
    <div class="col-sm-6">
        <div class="card mb-2">
            <div class="card-header"><div class="card-title"><@spring.message "content.records.title"/></div></div>

            <div class="card-body p-0">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th><@spring.message "content.records.rent.id"/></th>
                            <th><@spring.message "content.records.client.name"/></th>
                            <th><@spring.message "content.records.rent.date"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nelson Dummy Mockup</td>
                            <td>6/10/2018</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="card" style="height: 400px;">
            <div class="card-header"><div class="card-title"><@spring.message "content.chart.title"/></div></div>
            <div class="card-body">
                <canvas id="myChart" style="height: 400px"></canvas>
            </div>
        </div>
    </div>
</div>
</@b.base>

<script>
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [{
                label: '# of Mock Values',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
</script>

