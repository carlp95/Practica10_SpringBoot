<html>
<head>
    <title>Create New User</title>
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

                    <form id="createUserForm" action="/admin/createUser" method="POST" autocomplete="off">

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

                        <div class="form-group">
                            <label for="username"> Usuario</label>
                            <input id="username" class="form-control" name="username" placeholder="Nombre de usuario" type="text">
                        </div>

                        <div class="form-group">
                            <label for="password"> Contraseña</label>
                            <input id="password" class="form-control" name="password" minlength="8"  placeholder="Contraseña" type="password">
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label for="role"> Rol</label>
                                <select class="form-control" id="role" name="role">
                                    <option value="admin">Administrador</option>
                                    <option value="seller">Vendedor</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label for="status"> Estado</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="active">Activo</option>
                                    <option value="no_active">No Activo</option>
                                </select>
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