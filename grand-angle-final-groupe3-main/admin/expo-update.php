<?php

session_start();

include "includes/pages/header.php";
include "includes/pages/navbarr.php";
include "includes/pages/nav-head.php";


require_once '../config/pdo.php';

?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="art-contain-by-btn">
  <?php include "includes/components/compo-update-expo.php";?>
</div>

<?php include "includes/pages/footer.php";?>