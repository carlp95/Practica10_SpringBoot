<html>
<head>
    <title>Crear Cliente</title>
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

                    <form id="editCustomerForm" action="/customer/editcustomer" method="POST" autocomplete="off">

                        <div class="form-group">
                            <label for="identification"> Cédula</label>
                            <input id="identification" class="form-control" name="identification" placeholder="031-0000000-1" maxlength="13" type="text">
                        </div>


                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="firstName"> Nombres</label>
                                <input class="form-control fullName" name="firstName" placeholder="Nombres" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="lastName"> Apellidos</label>
                                <input class="form-control fullName" name="lastName" placeholder="Apellidos" type="text">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="phone"> Teléfono</label>
                                <input class="form-control" name="phone" maxlength="10" type="tel">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="cellPhone"> Celular</label>
                                <input class="form-control" name="cellPhone" maxlength="10" type="tel">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address">Dirección</label>
                            <textarea class="form-control" id="address" rows="3"></textarea>
                        </div>

                        <div class="form-group">
                            <div class="autocomplete">
                                <label for="city">Ciudad</label>
                                <input class="form-control" id="citylist" name="city" type="text">
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

<script type="text/javascript" src="/js/city.js"></script>
</body>
</html>