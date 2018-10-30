<#import "base.ftl" as b>

<@b.base>
<div class="row">
    <div class="col-sm-6">
        <div class="card mb-2">
            <div class="card-header"><div class="card-title"><@spring.message "content.records.title"/></div></div>

            <div class="card-body p-0">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th><@spring.message "content.records.rent.id"/></th>
                            <th><@spring.message "content.records.client.name"/></th>
                            <th><@spring.message "content.records.rent.date"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nelson Dummy Mockup</td>
                            <td>6/10/2018</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-sm-6">

    </div>
</div>
</@b.base>



