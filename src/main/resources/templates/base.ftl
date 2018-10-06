<#macro base>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Collapsible sidebar using Bootstrap 4</title>

    <link rel="stylesheet" href="/webjars/bootstrap/4.1.3/css/bootstrap-grid.min.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="/static/css/style.css">

    <!-- Font Awesome JS -->
    <script defer src="/webjars/font-awesome/5.3.1/js/solid.js"></script>
    <script defer src="/webjars/font-awesome/5.3.1/js/fontawesome.js"></script>
</head>

<body>

<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3><@spring.message "sidebar.title" /></h3>
        </div>

        <ul class="list-unstyled components">
            <li>
                <a href="#"><@spring.message "sidebar.users" /></a>
            </li>
            <li>
                <a href="/customer/"><@spring.message "sidebar.customers" /></a>
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
            </div>
        </nav>

        <#nested >

    </div>
</div>

<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="/webjars/popper.js/1.14.4/popper.min.js"></script>
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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