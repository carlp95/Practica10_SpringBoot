<#import "base.ftl" as b>

<@b.base>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Color</th>
            <th>Fecha de producido</th>
            <th>Compañía</th>
            <th>Unidades Disponibles</th>
            <th>Costo Diario</th>
            <th>Categoría</th>
            <th>Sub Categoría</th>
        </tr>
        </thead>
        <tbody>
            <#list deviceList as device>
            <tr>
                <td><a href="/device/edit/${device.id}">${device.name}</a></td>
                <td>${device.color}</td>
                <td>${device.issueDate}</td>
                <td>${device.company}</td>
                <td>${device.unitsAvailable}</td>
                <td>${device.dailyCost}</td>
                <td>${device.category.name}</td>
                <td>${device.sub_Category.name}</td>
            </tr>
            </#list>
        </tbody>

    </table>
</@b.base>