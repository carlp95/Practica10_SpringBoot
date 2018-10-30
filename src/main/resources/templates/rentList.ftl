<#import "base.ftl" as b>

<@b.base>
    <table class="table table-hover">
        <thead>
        <tr>
            <th><@spring.message "common.rentDate"/></th>
            <th><@spring.message "common.returnDate"/></th>
            <th><@spring.message "common.state"/></th>
            <th><@spring.message "common.customer"/></th>
            <th><@spring.message "common.details"/></th>
        </tr>
        </thead>
        <tbody>
            <#list rents as rent>
            <tr>
                <td>${rent.rentDate?date}</td>
                <td>${rent.untilDate?date}</td>
                <#if rent.pending == true>
                    <td><@spring.message "common.pending"/></td>
                <#else >
                    <td><@spring.message "common.committed"/></td>
                </#if>
                <td><a href="/customer/show/${rent.customer.id}">${rent.customer.firstName} ${rent.customer.lastName}</a></td>
                <#if rent.pending>
                    <td><a href="/rent/show/${rent.id}" class="btn btn-outline-primary"><i class="fa fa-eye"></i></a></td>
                <#else>
                    <td><a href="#" class="btn btn-outline-primary disabled"><i class="fa fa-eye"></i></a></td>
                </#if>
            </tr>
            </#list>
        </tbody>

    </table>
</@b.base>