<#import "base.ftl" as b>

<@b.base>
    <div class="card">
        <div class="card-header">
            <div class="card-title"><h2><@spring.message "content.customer.show.title"></@spring.message></h2></div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col mb-3">
                    <img class="profile-pic mb-3" src="/img/${customer.photoPath}" alt="Customer profile" >
                    <p class="card-text"><strong><@spring.message "content.customer.show.id"/></strong>: ${customer.id}</p>
                    <p class="card-text"><strong><@spring.message "content.customer.show.firstName"/></strong>: ${customer.firstName}</p>
                    <p class="card-text"><strong><@spring.message "content.customer.show.lastName"/></strong>: ${customer.lastName}</p>
                    <p class="card-text"><strong><@spring.message "content.customer.show.phone"/></strong>: ${customer.phone}</p>
                </div>
                <div class="col-md-6" style="background-color:lightblue">
                    Aqui los datos de alquileres activos
                </div>
            </div>
        </div>
    </div>
</@b.base>

