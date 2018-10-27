<#import "base.ftl" as b>

<@b.base>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Fecha de Alquiler</th>
            <th>Hasta</th>
            <th>Estado</th>
            <th>Cantidad</th>
            <th>Dispositivo</th>
            <th>Cliente</th>
        </tr>
        </thead>
        <tbody>
            <#list rents as rent>
            <tr>
                <td>${rent.rentDate}</td>
                <#--<td><a href="/device/edit/${device.id}">${device.name}</a></td>-->
                <td>${rent.untilDate}</td>
                <#if rent.pending == true>
                    <td>Pendiente</td>
                <#else >
                    <td>Regresado/Pagado</td>
                </#if>
                <td>${rent.deviceCount}</td>
                <td>${rent.device.name}</td>
                <td>${rent.customer.firstName}</td>
                <#--<td>${device.category}</td>-->
                <#--<td>${device.sub_Category}</td>-->
            </tr>
            </#list>
        </tbody>

    </table>
</@b.base>