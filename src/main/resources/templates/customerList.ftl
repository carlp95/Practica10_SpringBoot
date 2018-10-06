<html>
<head>
    <title>Clientes</title>
</head>
<body>
<div class="container">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Foto</th>
                <th>Cédula</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Teléfono</th>
                <th>Celular</th>
                <th>Dirección</th>
                <th>Ciudad</th>
                <th>Miscelaneos</th>
            </tr>
        </thead>
        <tbody>
            <#list custList as customer>
                <tr>
                    <#--<td>${customer.customerPhoto}</td>-->
                    <td>NULL</td>
                    <td><a href="/customer/edit/${customer.id}">${customer.id}</a></td>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.phone}</td>
                    <td>${customer.cellPhone}</td>
                    <td>${customer.address}</td>
                    <td>${customer.city}</td>
                    <td><a>Ver facturas</a></td>
                </tr>
            </#list>
        </tbody>

    </table>
</div>
</body>
</html>