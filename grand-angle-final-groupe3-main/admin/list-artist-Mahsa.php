<?php

session_start();

$title = "Liste des artistes";

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";

require_once "../config/pdo.php";
$sql = "SELECT artiste.*, dirart.* 
FROM artiste 
LEFT JOIN dirart ON artiste.id_DirArt = dirart.id_DirArt 
ORDER BY artiste.Nom_Artiste ASC";
$requete = $db -> query($sql);
$artists = $requete->fetchAll(PDO::FETCH_ASSOC);


?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>
<div class="art-contain-by-btn">

 <?php include "includes/components/artist.php";?>

</div>


<?php 
include "includes/pages/footer.php";
;?>