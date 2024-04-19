<?php

session_start();
$title = "Gestion des collaborateurs";

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";

require_once "../config/pdo.php";
$sql= "SELECT collaborateur.*, service.* 
FROM collaborateur 
JOIN service ON collaborateur.Id_Service = service.Id_Service
ORDER BY collaborateur.Nom_Collaborateur ASC";

$requete = $db -> query($sql);
$collabs = $requete->fetchAll(PDO::FETCH_ASSOC);

?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="art-contain-by-btn">

<?php include 'includes/components/card-collab.php' ;?>

</div>

<?php 
include "includes/pages/footer.php";
;?>
