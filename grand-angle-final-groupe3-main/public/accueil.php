<?php
require "../config/pdo.php";
$titre = "Accueil";
$nav = "Accueil";
include_once "includes/pages/nav.php";


$sqlArtNow = "SELECT *
FROM oeuvres
JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition
WHERE exposition.Date_Debut <= DATE_ADD(CURRENT_DATE(), INTERVAL 3 DAY) AND CURRENT_DATE() <= exposition.Date_Fin";
$requeteArtNow = $db->query($sqlArtNow);
$oeuvresNow = $requeteArtNow->fetchAll(PDO::FETCH_ASSOC);

?>


<div class="top">
    <h1><?php echo TITLEACC; ?></h1>
    <div class="sli-wra">
        <div class="slid">
            <img src="../assets/images/desktop.png" alt="artistes" class="" id="im1">
            <img src="../assets/images/gallery.jpg" width="100%" alt="gallerie" class="" id="im2">
            <img src="../assets/images/Tours.jpg" alt="ville de tours" class="" id="im3">
            <div class="nav-img">
                <a href="#im1"></a>
                <a href="#im2"></a>
                <a href="#im3"></a>
            </div>
        </div>
    </div>
</div>




<div class="bottom">
    <?php

    include_once "./includes/components/carousel2.php";

    ?>
</div>

<?php

include_once "includes/pages/footer.php";

?>  