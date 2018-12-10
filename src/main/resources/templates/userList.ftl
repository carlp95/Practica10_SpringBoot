<#import "base.ftl" as b>

<@b.base>
    <div class="row justify-content-around">
        <table class="table table-hover table-sm table-bordered">
        <thead>
        <tr>
            <th><@spring.message "content.username"/></th>
            <th><@spring.message "content.firstName"/></th>
            <th><@spring.message "content.lastName"/></th>
        </tr>
        </thead>
        <tbody>
            <#list userList as user>
            <tr>
                <td>${user.username}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
            </tr>
            </#list>
        </tbody>
    </table>
    </div>
</@b.base>