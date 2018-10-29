<#import "base.ftl" as b>

<@b.base>
    <div class="mb-4">
        <div class="card border-success mb-3 mx-auto">
            <div class="card-header">
                <h4 class="card-title" align="center">Alquiler</h4>
            </div>
            <div class="card-body">
                <form id="rentForm" action="/rent/create" method="POST" autocomplete="off">

                    <div class="form-row">
                        <div class="form-group col-sm-6">
                            <label for="custId"><@spring.message "content.rent.select.customer"></@spring.message></label>
                            <select id="custId" class="custom-select" name="customerID" required>
                                <#list customers as customer>
                                    <option value="${customer.id}">${customer.id} ${customer.firstName}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="untilDate"> Alquiler Hasta</label>
                            <input class="form-control" id="untilDate" name="untilDate" type="date" required>
                        </div>
                    </div>

                    <label for="devices-select"></label>
                    <select id="devices-select" multiple size="6" class="custom-select mb-4" name="devices" required>
                        <#list devices as device>
                            <#if device.unitsAvailable gt 0>

                                <option value="${device.id}" class="device-option" data-img="/img/${device.photoPath}">
                                    ${device.name} <b>${device.color}</b> $${device.dailyCost}/Day
                                </option>
                            </#if>
                        </#list>
                    </select>

                    <div class="form-group row">
                        <button type="submit" class="btn btn-success mx-auto "><strong><@spring.message "content.rent.button.rent"></@spring.message></strong></button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</@b.base>
