<#macro base>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Pr&aacute;ctica 10 Login</title>

    <link rel="stylesheet" href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/ourStyle.css" class="css">

    <!-- Font Awesome JS -->
    <script defer src="/webjars/font-awesome/5.3.1/js/solid.js"></script>
    <script defer src="/webjars/font-awesome/5.3.1/js/fontawesome.js"></script>
</head>

<body>

<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <a href="/"><h3><@spring.message "sidebar.title" /></h3></a>
        </div>

        <ul class="list-unstyled components">
            <li>
                <a href="#"><@spring.message "sidebar.users" /></a>
            </li>
            <li>
                <a href="/customer/"></a>
                <a href="#rentsSubmenu" data-toggle="collapse" class="dropdown-toggle">
                    <i class="fas fa-users"></i>
                    <@spring.message "sidebar.customers" />
                </a>
                <ul class="collapse list-unstyled" id="rentsSubmenu">
                    <li>
                        <a href="/customer/"><@spring.message "sidebar.submenu.list"></@spring.message></a>
                    </li>
                    <li>
                        <a href="/customer/create"><@spring.message "sidebar.submenu.create"></@spring.message></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#customerSubmenu" data-toggle="collapse" class="dropdown-toggle">
                    <i class="fas fa-building"></i>
                    <@spring.message "sidebar.rents" />
                </a>
                <ul class="collapse list-unstyled" id="customerSubmenu">
                    <li>
                        <a href="/rent/"><@spring.message "sidebar.submenu.list"></@spring.message></a>
                    </li>
                    <li>
                        <a href="/rent/create"><@spring.message "sidebar.submenu.create"></@spring.message></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#devicesSubmenu" data-toggle="collapse" class="dropdown-toggle">
                    <i class="fas fa-hdd"></i>
                    <@spring.message "sidebar.devices" />
                </a>
                <ul class="collapse list-unstyled" id="devicesSubmenu">
                    <li>
                        <a href="/device/"><@spring.message "sidebar.submenu.list"></@spring.message></a>
                    </li>
                    <li>
                        <a href="/device/create"><@spring.message "sidebar.submenu.create"></@spring.message></a>
                    </li>
                </ul>
            </li>
        </ul>

    </nav>

    <!-- Page Content Holder -->
    <div id="content">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="navbar-btn">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-align-justify"></i>
                </button>

                <#--Esta es la barra de control -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Facturar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/rent/list">Alquilados</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <#nested >

    </div>
</div>

<script src="/webjars/jquery/3.1.1/jquery.js"></script>
<script src="/webjars/popper.js/1.14.4/umd/popper.js"></script>
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/webjars/chartjs/2.7.2/Chart.bundle.js"></script>
<script src="/webjars/cleave.js/1.4.4/dist/cleave.js"></script>
<#--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>-->

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            $(this).toggleClass('active');
        });
    });
</script>

</body>

</html>
</#macro>