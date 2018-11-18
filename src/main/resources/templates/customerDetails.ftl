<#import "base.ftl" as b>

<@b.base>
    <div class="card mb-4">
        <div class="card-header">
            <div class="card-title"><h2><@spring.message "content.customer.show.title"></@spring.message></h2></div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col mb-3">
                    <img class="profile-pic mb-3" src="/img/${customer.photoPath}" alt="Customer profile">
                    <p class="card-text"><strong><@spring.message "content.customer.show.id"/></strong>: ${customer.id}</p>
                    <p class="card-text">
                        <strong><@spring.message "content.customer.show.firstName"/></strong>: ${customer.firstName}</p>
                    <p class="card-text">
                        <strong><@spring.message "content.customer.show.lastName"/></strong>: ${customer.lastName}</p>
                    <p class="card-text">
                        <strong><@spring.message "content.customer.show.phone"/></strong>: ${customer.phone}</p>
                </div>
                <div class="col-md-6">
                    <table class="table table-hover table-sm table-bordered">
                        <tr>
                            <th><@spring.message "common.rentDate"/></th>
                            <th><@spring.message "common.returnDate"/></th>
                            <th><@spring.message "common.state"/></th>
                            <th><@spring.message "common.details"/></th>
                        </tr>

                        <#list rents as rent>
                        <tr>
                            <td>${ rent.rentDate?date }</td>
                            <td>${ rent.untilDate?date }</td>
                            <#if rent.pending == true>
                                <td><@spring.message "common.pending"/></td>
                            <#else >
                                <td><@spring.message "common.committed"/></td>
                            </#if>
                            <#if rent.pending>
                                <td><a href="/rent/show/${rent.id}" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
                            <#else>
                                <td><a href="#" class="btn btn-outline-primary disabled"><i class="fa fa-eye"></i></a></td>
                            </#if>
                        </tr>
                        </#list>
                    </table>
                </div>
            </div>
        </div>
    </div>
<#--<#list rents_categories as category>-->
    <#--<p>${category}</p>-->
<#--</#list>-->
<#--<#list rents_average_days as average>-->
    <#--<p>${average}</p>-->
<#--</#list>-->
    <div class="card" >
        <div class="card-header"><div class="card-title"><@spring.message "content.chart.title"/></div></div>
        <div class="card-body">
            <canvas id="myChart"></canvas>
        </div>
    </div>
</@b.base>

<script>
    var categories = [];
    var averages = [];

    <#list rents_categories as category>
    categories.push("${category}");
    </#list>

    <#list rents_average_days as average>
    averages.push(parseInt(${average}));
    </#list>

    var backgroundColors = [
        'rgba(255, 99, 132, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
        'rgba(255, 159, 64, 0.2)'
    ];
    var borderColors = [
        'rgba(255,99,132,1)',
        'rgba(153, 102, 255, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
        'rgba(255, 159, 64, 1)'
    ];

    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: categories,
            datasets: [{
                label: '# of Votes',
                data: averages,
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