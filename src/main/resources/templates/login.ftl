<html>
<head>
    <title>Login</title>
</head>
<body>
<#if _csrf??> <#--validando que no sea nula, si lo es, está deshabilitado el csrf -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</#if>
<div class="container">
    <div class="card border-success mb-3 mx-auto">
        <div class="card-body">
            <h4 class="card-title" align="center" style="font-family: leaf,serif; font-size: 50px; color: #316a3a">BanaGreen Software</h4>
            <form action="/login" method="post">
                <div class="form-group row">
                    <div class="col-md-12" style="margin: 0 auto;">
                        <input class="form-control" name="username" placeholder="Usuario" type="text" required autofocus>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-12" style="margin: 0 auto;">
                        <input  class="form-control" name="password" placeholder="Contraseña" type="password">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="custom-control custom-checkbox mx-auto">
                        <input class="custom-control-input" id="remember-me" name="remember-me" type="checkbox">
                        <label class="custom-control-label" for="remember-me">Recuerdame</label>
                    </div>
                </div>
                <div class="form-group row">
                    <button type="submit" class="btn btn-success mx-auto"><i class="fa fa-sign-in-alt"> <strong>Entrar</strong></i></button>
                </div>

                        <#--<#if loginRedirect?has_content>
                            <input type="hidden" name="loginRedirect" value="${ loginRedirect }">
                        </#if>-->
            </form>
        </div>
    </div>
</div>
</body>
</html>