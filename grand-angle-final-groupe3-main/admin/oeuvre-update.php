<?php

session_start();

$title = "Modifier une oeuvre";

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";

require_once "../config/pdo.php";

;?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>
<div id="color" class="art-contain-by-btn">
    <div class="oeuvre-unique-contain">

        <div class="oeuvre-unique-infos col">
        <?php include "includes/components/oeuvre-update-infos.php" ;?>
        </div> 

        <div class="oeuvre-unique-contenu col">
            <?php include "includes/components/oeuvre-update-description.php" ;?>
        </div>
        
    </div>
</div>
