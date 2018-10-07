<#import "base.ftl" as b>

<@b.base>
    <div class="row justify-content-around">
        <div class="col-lg-4 mb-4">
            <div class="card border-success mb-3 mx-auto">
                <div class="card-body">
                <#--<h4 class="card-title" align="center" style="font-family: leaf,serif; font-size: 50px; color: #316a3a">BanaGreen</h4>-->

                    <form id="editCustomerForm" action="/customer/create" method="POST" autocomplete="off">

                        <div class="form-group">
                            <label for="identification"><@spring.message "content.customer.formLabel.id"/></label>
                            <input id="identification" class="form-control" name="identification" placeholder="031-0000000-1" maxlength="13" type="text">
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="firstName"><@spring.message "content.customer.formLabel.firstName"/></label>
                                <input class="form-control fullName" name="firstName" placeholder="Nombres" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="lastName"><@spring.message "content.customer.formLabel.lastName"/></label>
                                <input class="form-control fullName" name="lastName" placeholder="Apellidos" type="text">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="form-group col-md-6">
                                <label for="phone"><@spring.message "content.customer.formLabel.phone"/></label>
                                <input class="form-control" id="phone" name="phone" maxlength="10" type="tel">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="cellPhone"><@spring.message "content.customer.formLabel.cellphone"/></label>
                                <input class="form-control" id="cellPhone" name="cellPhone" maxlength="10" type="tel">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address"><@spring.message "content.customer.formLabel.address"/></label>
                            <textarea class="form-control" id="address" name="address" rows="3"></textarea>
                        </div>

                        <div class="form-group">
                            <div class="autocomplete">
                                <label for="citylist"><@spring.message "content.customer.formLabel.city"/></label>
                                <input class="form-control" id="citylist" name="city" type="text">
                            </div>
                        </div>


                        <div class="form-group row">
                            <button type="submit" class="btn btn-success mx-auto ">
                                <strong><@spring.message "content.customer.createButton.register"/></strong>
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</@b.base>

<script type="text/javascript" src="/js/city.js"></script>