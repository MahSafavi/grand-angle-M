<?php

session_start();

$title = "Ajouter un collaborateur";

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";

require_once "../config/pdo.php";

;?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="art-contain-by-btn">

    <?php include 'includes/components/add_collab.php' ;?>

</div>

<?php 

include "includes/pages/footer.php";

;?>