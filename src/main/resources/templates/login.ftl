<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Práctica 10</title>

    <link rel="stylesheet" href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/webjars/font-awesome/5.3.1/css/all.min.css">
</head>
<body>
    <div class="row justify-content-around">
        <div class="col-lg-4 mb-4">
            <div class="card border-success mb-3 mx-auto">
                <div class="card-body">
                    <h4 class="card-title" align="center" style="font-family: leaf,serif; font-size: 50px; color: #316a3a">BanaGreen Software</h4>
                    <form role="form" action="/login" method="post">
                <#if _csrf??> <#--validando que no sea nula, si lo es, está deshabilitado el csrf -->
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </#if>
                        <div class="form-group row">
                            <div class="col-md-12" style="margin: 0 auto;">
                                <input type="text" class="form-control" name="username" id="username" placeholder="Usuario" required autofocus>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12" style="margin: 0 auto;">
                                <input  type="password" class="form-control" name="password" id="password" placeholder="Contraseña" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="custom-control custom-checkbox mx-auto">
                                <input class="custom-control-input" id="remember-me" name="remember-me" type="checkbox">
                                <label class="custom-control-label" for="remember-me">Recuerdame</label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <button type="submit" class="btn btn-success mx-auto" value="Sign In"><i class="fa fa-sign-in-alt"> <strong>Entrar</strong></i></button>
                        </div>

                    <#--<#if loginRedirect?has_content>
                        <input type="hidden" name="loginRedirect" value="${ loginRedirect }">
                    </#if>-->
                    </form>
            <#if error.isPresent()>
                <p>usuario no existe....</p>
            </#if>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

