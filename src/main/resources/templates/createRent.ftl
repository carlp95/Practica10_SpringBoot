<#import "base.ftl" as b>

<@b.base>

    <div class="card border-success mb-3 mx-auto">
        <div class="card-header">
            <h4 class="card-title" align="center"><@spring.message "sidebar.rents"/></h4>
        </div>

        <div class="card-body">
            <form id="rentForm" action="/rent/create" method="POST">

                <div class="form-group">
                    <label for="custId"><@spring.message "content.rent.select.customer"/></label>
                    <select id="custId" class="custom-select" name="customerID" required>
                    <#list customers as customer>
                        <option value="${customer.id}">${customer.id} ${customer.firstName}</option>
                    </#list>
                    </select>
                </div>

                <div class="form-row">
                    <div class="form-group col-sm-6">
                        <label for="rentDate"><@spring.message "common.rentDate"/></label>
                        <input class="form-control" id="rentDate" name="date" value="${todayDate}" type="date" required>
                    </div>

                    <div class="form-group col-sm-6">
                        <label for="untilDate"><@spring.message "common.returnDate"/></label>
                        <input class="form-control" id="untilDate" name="untilDate" type="date"  required>
                    </div>
                </div>

                <div class="form-group">
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
                </div>

                <button type="submit" class="btn btn-success mx-auto "><strong><@spring.message "content.rent.button.rent"></@spring.message></strong></button>

            </form>
        </div>
    </div>

</@b.base>
