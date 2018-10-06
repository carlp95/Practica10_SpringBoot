<html>
<head>
    <title>Crear Dispositivo</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-around">
    <#--<div class="col-lg-8">
        <h2 class="card-text" style="color: white">Registrate en la red donde puedes compartir tus pensamientos</h2>
    </div>
-->
        <div class="col-lg-4 mb-4">
            <div class="card border-success mb-3 mx-auto">
                <div class="card-body">
                <#--<h4 class="card-title" align="center" style="font-family: leaf,serif; font-size: 50px; color: #316a3a">BanaGreen</h4>-->

                    <form id="editDeviceForm" action="/device/edit" method="POST" autocomplete="off">

                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="deviceName"> Nombre</label>
                                <input class="form-control" name="deviceName" type="text" value="${device.name}">
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="color"> Color</label>
                            <input id="color" class="form-control" name="color" type="text" value="${device.color}">
                        </div>

                        <div class="form-group">
                            <label for="issueDate"> Fecha de Fabricación/Producción</label>
                            <input id="issueDate" class="form-control" name="issueDate" type="date" min="1900-01-01" value="${device.issueDate}">
                        </div>
                        <div class="form-group ">
                            <label for="company"> Company</label>
                            <input id="company" class="form-control" name="company" type="text" value="${device.company}">
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
                            <button type="submit" class="btn btn-success mx-auto "><strong>Crear</strong></button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>