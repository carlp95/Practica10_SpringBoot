<#import "base.ftl" as b>

<@b.base>
    <div class="card mb-3">
        <div class="card-header">
            <div class="card-title"><@spring.message "common.invoice"></@spring.message></div>
        </div>
        <div class="card-body">
            <p><b><@spring.message "common.name"></@spring.message></b>: ${rent.customer.firstName} ${rent.customer.lastName}</p>
            <p><b><@spring.message "common.date"></@spring.message></b>: ${rent.rentDate}</p>
            <p><b><@spring.message "common.returnDate"></@spring.message></b>: ${rent.untilDate}</p>
            <p><b><@spring.message "common.daysrented"></@spring.message></b>: ${rent.daysRented}</p>


            <table class="table">
                <thead>
                <tr>
                    <th><@spring.message "common.name"></@spring.message></th>
                    <th><@spring.message "common.company"></@spring.message></th>
                    <th><@spring.message "common.dailycost"></@spring.message></th>
                </tr>
                </thead>
                <tbody>
                <#list rent.devices as device>
                <tr>
                    <td>${device.name}</td>
                    <td>${device.company}</td>
                    <td>${device.dailyCost}</td>
                </tr>
                </#list>
                </tbody>
            </table>

            <hr>

            <h5><b>$<@spring.message "common.total"></@spring.message></b>: ${rent.total}</h5>

            <hr>

            <form action="/rent/return/${rent.id}" method="post">
                <button class="btn btn-success"><@spring.message "common.checkin"/></button>
            </form>
        </div>
    </div>


</@b.base>