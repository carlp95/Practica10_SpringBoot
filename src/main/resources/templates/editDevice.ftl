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
                                    <#if device.category == "PC y Portátiles">
                                        <option value="PC y Portátiles" selected="selected">PC Y Portátiles</option>
                                        <option value="Hogar">Hogar</option>
                                        <option value="Celulares">Celulares</option>
                                        <option value="Ferretería">Ferretería</option>
                                        <option value="Gadgets">Gadgets</option>
                                    <#elseif device.category == "Hogar">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar" selected="selected">Hogar</option>
                                        <option value="Celulares">Celulares</option>
                                        <option value="Ferretería">Ferretería</option>
                                        <option value="Gadgets">Gadgets</option>
                                    <#elseif device.category == "Celulares">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar">Hogar</option>
                                        <option value="Celulares" selected="selected">Celulares</option>
                                        <option value="Ferretería">Ferretería</option>
                                        <option value="Gadgets">Gadgets</option>
                                    <#elseif device.category == "Ferretería">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar">Hogar</option>
                                        <option value="Celulares">Celulares</option>
                                        <option value="Ferretería" selected="selected">Ferretería</option>
                                        <option value="Gadgets">Gadgets</option>
                                    <#elseif device.category == "Gadgets">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar">Hogar</option>
                                        <option value="Celulares">Celulares</option>
                                        <option value="Ferretería">Ferretería</option>
                                        <option value="Gadgets" selected="selected">Gadgets</option>
                                    </#if>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label for="sub_Categoria"> Sub-Categoría</label>
                                <select class="form-control" id="sub_Categoria" name="sub_Categoria">
                                    <#if device.sub_Category == "Portátil">
                                        <option value="Portátil" selected="selected">Portátil</option>
                                    <#--<option value="Hogar">Huawei</option>-->
                                    <#--<option value="Celulares">Celulares</option>-->
                                    <#--<option value="Ferretería">Ferretería</option>-->
                                    <#--<option value="Gadgets">Gadgets</option>-->
                                    <#elseif device.sub_Category == "Celulares">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar" selected="selected">Hogar</option>
                                        <option value="Celulares">Celulares</option>
                                        <option value="Ferretería">Ferretería</option>
                                        <option value="Gadgets">Gadgets</option>
                                    <#elseif device.sub_Category == "Celulares">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar">Hogar</option>
                                        <option value="Celulares" selected="selected">Celulares</option>
                                        <option value="Ferretería">Ferretería</option>
                                        <option value="Gadgets">Gadgets</option>
                                    <#elseif device.sub_Category == "Ferretería">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar">Hogar</option>
                                        <option value="Celulares">Celulares</option>
                                        <option value="Ferretería" selected="selected">Ferretería</option>
                                        <option value="Gadgets">Gadgets</option>
                                    <#elseif device.sub_Category == "Gadgets">
                                        <option value="PC y Portátiles">PC Y Portátiles</option>
                                        <option value="Hogar">Hogar</option>
                                        <option value="Celulares">Celulares</option>
                                        <option value="Ferretería">Ferretería</option>
                                        <option value="Gadgets" selected="selected">Gadgets</option>
                                    </#if>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <button type="submit" class="btn btn-success mx-auto "><i class="fas fa-check-circle"></i> <strong>Crear</strong></button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</@b.base>

<#--
<html>

<body>
<div class="container">

</div>
</body>
</html>-->
