<#import "base.ftl" as b>

<@b.base>
<div class="row justify-content-around">
    <div class="col-lg-6 mb-4">
        <div class="card border-success mb-3 mx-auto">
            <div class="card-body">
                <img class="profile-pic" src="/img/${customer.photoPath}" alt="Customer profile">
                <form method="POST" action="/customer/profile/${customer.id}" enctype="multipart/form-data">
                    <div class="input-group my-2">
                        <div class="input-group-prepend">
                            <input class="input-group-text" id="upload-photo-button" type="submit" required/>
                        </div>

                        <div class="custom-file">
                            <label class="custom-file-label" for="upload-photo"><@spring.message "content.customer.chooseFile"/></label>
                            <input class="custom-file-input" type="file" name="file" id="upload-photo" required>
                        </div>
                    </div>
                </form>

                <form id="editCustomerForm" action="/customer/edit" method="POST" autocomplete="off">

                    <div class="form-group">
                        <label for="identification"><@spring.message "content.customer.formLabel.id"/></label>
                        <input id="identification" class="form-control" name="identification" type="text" value="${customer.id}" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="firstName"><@spring.message "content.customer.formLabel.firstName"/></label>
                            <input id="firstName" class="form-control fullName" name="firstName" type="text" value="${customer.firstName}" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="lastName"><@spring.message "content.customer.formLabel.lastName"/></label>
                            <input id="lastName" class="form-control fullName" name="lastName" type="text" value="${customer.lastName}" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phone"><@spring.message "content.customer.formLabel.phone"/></label>
                            <input id="phone" class="form-control" name="phone" type="tel" value="${customer.phone}" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cellPhone"><@spring.message "content.customer.formLabel.cellphone"/></label>
                            <input id="cellPhone" class="form-control" name="cellPhone" type="tel" value="${customer.cellPhone}" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address"><@spring.message "content.customer.formLabel.address"/></label>
                        <textarea class="form-control" id="address" name="address" rows="3" required>${customer.address}</textarea>
                    </div>

                    <div class="form-group">
                        <div class="autocomplete">
                            <label for="citylist"><@spring.message "content.customer.formLabel.city"/></label>
                            <input class="form-control" id="citylist" name="city" type="text" value="${customer.city}" required>
                        </div>
                    </div>


                    <div class="form-group row">
                        <button type="submit" class="btn btn-success mx-auto ">
                            <i class="fas fa-save"></i> <strong><@spring.message "content.customer.editButton.save"/></strong>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
</@b.base>

<script type="text/javascript" src="/js/city.js"></script>

<#--<script>-->
    <#--function sendImage() {-->
        <#--var formData = new FormData();-->
        <#--var fileField = document.getElementById("upload-photo");-->

        <#--formData.append('profile', fileField.files[0]);-->

        <#--fetch('/images/profile/${customer.id}', {-->
            <#--method: 'POST',-->
            <#--body: formData-->
        <#--}).then(function(response) {-->
            <#--return response.json();-->
        <#--})-->
        <#--.then(function(response) {-->
            <#--console.log('Success:', JSON.stringify(response));-->
        <#--})-->
        <#--.catch(function(error) {-->
            <#--console.error('Error:', error)-->
        <#--});-->
    <#--}-->
<#--</script>-->
