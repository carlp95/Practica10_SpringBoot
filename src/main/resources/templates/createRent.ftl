<html>
<head>
    <title>Crear Alquiler</title>
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

                    <form id="rentForm" action="/rent/create" method="POST" autocomplete="off">

                        <#--<div class="form-group">-->
                            <#--<label for="device"> Dispositivo</label>-->
                            <#--<input id="identification" class="form-control" name="identification" placeholder="031-0000000-1" maxlength="13" type="text">-->
                        <#--</div>-->
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label for="device"> Dispositivos</label>
                                    <select class="form-control" id="device" name="device">
                                        <#list devices as device>
                                            <option value="${device.name}">${device.name}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="counter"> Cantidad</label>
                                <input class="form-control" name="counter" min="0" type="number">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="custId"> Cédula Cliente</label>
                                <input class="form-control" name="custId" placeholder="031-0000000-1" type="text">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="form-group col-md-6">
                                <label for="untilDate"> Alquiler Hasta</label>
                                <input class="form-control" id="untilDate" name="untilDate" type="date">
                            </div>
                        </div>

                        <div class="form-group row">
                            <button type="submit" class="btn btn-success mx-auto "><strong>Registrar</strong></button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>