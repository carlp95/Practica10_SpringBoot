<#import "base.ftl" as b>

<head>
    <title>Crear Dispositivo</title>
</head>

<@b.base>
    <div class="row justify-content-around">
        <div class="col-lg-4 mb-4">
            <div class="card border-success mb-3 mx-auto">
                <div class="card-body">
                <#--<h4 class="card-title" align="center" style="font-family: leaf,serif; font-size: 50px; color: #316a3a">BanaGreen</h4>-->

                    <form id="createDeviceForm" action="/device/create" method="POST" autocomplete="off">

                        <div class="form-row">
                            <div class="form-group">
                                <label for="deviceName"> Nombre</label>
                                <input class="form-control" name="deviceName" placeholder="Nombre" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="color"> Color</label>
                            <input id="color" class="form-control" name="color" placeholder="Color" type="text">
                        </div>

                        <div class="form-group">
                            <label for="issueDate"> Fecha de Fabricación/Producción</label>
                            <input id="issueDate" class="form-control" name="issueDate" type="date" min="1900-01-01">
                        </div>
                        <div class="form-group">
                            <label for="company"> Company</label>
                            <input id="company" class="form-control" name="company" placeholder="Company" type="text">
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label for="category"> Categoría</label>
                                <select class="form-control" id="category" name="category">
                                    <option value="admin">Administrador</option>
                                    <option value="seller">Vendedor</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label for="sub_Categoria"> Sub-Categoría</label>
                                <select class="form-control" id="sub_Categoria" name="sub_Categoria">
                                    <option value="active">Activo</option>
                                    <option value="no_active">No Activo</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <button type="submit" class="btn btn-success mx-auto "><i class="fas fa-check-circle"></i><strong> Crear</strong></button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
</@b.base>
<#--<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Crear Dispositivo</title>

    <link rel="stylesheet" href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/webjars/font-awesome/5.3.1/css/all.min.css">
</head>
<body>
<div class="container">

    </div>-->
</div>
</body>
</html>