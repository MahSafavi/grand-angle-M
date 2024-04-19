<?php

session_start();

$title = "Liste des expositions";
require_once "../config/pdo.php";

include "includes/pages/header.php";
include "includes/pages/navbarr.php";
include "includes/pages/nav-head.php";

?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="art-contain-by-btn">
  <?php include "includes/components/expo-card.php" ;?>
</div>


<?php 
  include "includes/pages/footer.php";
;?>