<?php

session_start();

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";

$title = "Plan d'exposition";

;?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="art-contain-by-btn">
    <?php include "includes/components/implantation-print.php";?>
</div>

<?php 
include "includes/pages/footer.php";
;?>