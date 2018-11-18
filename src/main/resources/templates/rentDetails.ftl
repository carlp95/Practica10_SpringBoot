<#import "base.ftl" as b>

<@b.base>
    <div class="card mb-3">
        <div class="card-header">
            <div class="card-title"><@spring.message "common.invoice"></@spring.message></div>
        </div>
        <div class="card-body">
            <p><b><@spring.message "common.name"></@spring.message></b>: ${rent.customer.firstName} ${rent.customer.lastName}</p>
            <p><b><@spring.message "common.date"></@spring.message></b>: ${rent.rentDate}</p>
            <p><b><@spring.message "common.returnDate"></@spring.message></b>: ${rent.untilDate}</p>
            <p><b><@spring.message "common.daysrented"></@spring.message></b>: ${rent.daysRented}</p>

            <form action="/rent/return/${rent.id}" method="post">
                <label for="devices-select"></label>
                <select id="devices-select" multiple size="6" class="custom-select mb-4" name="devices" required>
                    <#list rent.devices as device>
                        <#if device.unitsAvailable gt 0>
                            <option value="${device.id}" class="device-option" data-img="/img/${device.photoPath}">
                                ${device.name} <b>${device.color}</b> $${device.dailyCost}/Day
                            </option>
                        </#if>
                    </#list>
                </select>

                <hr>

                <h5><b>$<@spring.message "common.total"></@spring.message></b>: ${rent.total}</h5>

                <hr>

                <button class="btn btn-success"><@spring.message "common.checkin"/></button>
            </form>
        </div>
    </div>


</@b.base>

<script>
    var select = document.getElementById("devices-select");
    var selected = [];
    select.addEventListener("click  ", function() {
        for (var i = select.value; i < select.length; i++) {
            if (select.options[i].selected) {
                selected.push(select.options[i].value);
            }
        }
        console.log(" Lista seleccionada: " + selected)
    })
</script>