<#import "base.ftl" as b>

<@b.base>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Fecha de Alquiler</th>
            <th>Fecha entrega</th>
            <th>Estado</th>
            <th>Cliente</th>
            <th>Detalles</th>
        </tr>
        </thead>
        <tbody>
            <#list rents as rent>
            <tr>
                <td>${rent.rentDate}</td>
                <td>${rent.untilDate}</td>
                <#if rent.pending == true>
                    <td>Pendiente</td>
                <#else >
                    <td>Regresado/Pagado</td>
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