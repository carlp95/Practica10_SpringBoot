<#import "base.ftl" as b>

<@b.base>
    <table class="table table-hover table-sm table-bordered">
        <thead>
        <tr>
            <th>Cédula</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Teléfono</th>
            <th>Celular</th>
            <th>Dirección</th>
            <th>Ciudad</th>
            <th>Opciones</th>
        </tr>
        </thead>
        <tbody>
            <#list customerList as customer>
            <tr>
                <td>${customer.id}</td>
                <td>${customer.firstName}</td>
                <td>${customer.lastName}</td>
                <td>${customer.phone}</td>
                <td>${customer.cellPhone}</td>
                <td>${customer.address}</td>
                <td>${customer.city}</td>
                <td>
                    <a href="/customer/show/${customer.id}" class="btn btn-primary">Show</a>
                    <a href="/customer/edit/${customer.id}" class="btn btn-secondary">Edit</a>
                    <button class="btn btn-danger">Delete</button>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>
</@b.base>
