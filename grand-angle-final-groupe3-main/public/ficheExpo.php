<?php

require_once "../config/pdo.php";

$titre = "fiche Exposition";
$nav = "fiche Exposition";
include "includes/pages/nav.php";

if (isset($_GET['id']) && isset($_GET['lang'])) {
    $id = $_GET['id'];
    $lang = $_GET['lang'];

    $sqllangue = "SELECT *
    FROM langue
    WHERE langue.value_Langue = :value_Langue";
    $queryLangue = $db->prepare($sqllangue);
    $queryLangue->bindParam(":value_Langue", $lang, PDO::PARAM_STR);
    $queryLangue->execute();
    $row = $queryLangue->fetch(PDO::FETCH_ASSOC);
    $id_L = $row['Id_Langue'];
    
    
    $sql1 = "SELECT *
    FROM artiste 
    JOIN exposition ON artiste.Id_Artiste= exposition.Id_Artiste
    JOIN bio_artist ON artiste.Id_Artiste= bio_artist.Id_Artiste
    WHERE  exposition.Id_Exposition = $id  AND bio_artist.Id_Langue=  $id_L";
    $request1 = $db->query($sql1);
    $expos = $request1->fetchAll(PDO::FETCH_ASSOC);
    
} elseif(isset($_GET['id']) && !isset($_GET['lang'])) {
    $id = $_GET['id'];
    $lang = 1;

    
    $sql1 = "SELECT *
    FROM artiste 
    JOIN exposition ON artiste.Id_Artiste= exposition.Id_Artiste
    JOIN bio_artist ON artiste.Id_Artiste= bio_artist.Id_Artiste
    WHERE  exposition.Id_Exposition = $id  AND bio_artist.Id_Langue=  $lang";
    $request1 = $db->query($sql1);
    $expos = $request1->fetchAll(PDO::FETCH_ASSOC);
  
} 


?>

<?php foreach ($expos as $expo) : ?>
    <div class="Fiche-expo">

        <img src="../assets/images/exposition/<?php echo $expo['chemin_Affiche']; ?>" alt="">

    </div>
<?php endforeach; ?>



<div id="media "class="description-artiste">
    <?php foreach ($expos as $expo) : ?>
        <div class="card-row1">
            <h2><?php echo $expo['Nom_Art'] . " " . $expo['Prenom_Art']; ?></h2>
        </div>
        <div class="card-row2">
            <div class="image-artiste-ongoing">
                <img src="../assets/images/img-artiste/<?php echo $expo['chemin_Imgart']; ?>" alt="<?php echo $expo['Nom_Artiste']; ?>">
            </div>
            <div class="content-infos-artiste-ongoing">
                <div class="infos-artiste-ongoing">
                    <h3><?php echo PROPOS; ?> : </h3>
                    <p><?php echo substr($expo['description_artist'], 0, 4 * 46) . "..."; ?></p>
                </div>
                <div class="action-artiste-ongoing">
                    <button class="voir-plus-artiste">
                        <a href="ficheArtiste.php?id=<?= $expo['Id_Artiste'] ?>"><?php echo AFFICHE; ?></a>
                    </button>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>



 <?php
if (isset($_GET['id'])) {
    $id2 = $_GET['id'];
    $currentDateTime = date("Y-m-d H:i:s"); 
    $sql2 = "SELECT *
    FROM oeuvres
    JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
    JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
    JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition
    WHERE  oeuvres.Id_Exposition = $id2 AND (exposition.Date_Fin <= '$currentDateTime' OR 'exposition.Date_Debut' >= '$currentDateTime')";
    $request2 = $db->query($sql2);
    $cardOeuvres = $request2->fetchAll(PDO::FETCH_ASSOC);

    if (!empty($cardOeuvres)) {
?>
        <div class="oeuvreExpo <?php echo("active1")?>" id="">
            <div class="wrapper">
                <i id="left" class="fa-solid fa-angle-left"></i>
                <ul class="carousel">
                    <?php foreach ($cardOeuvres as $cardOeuvre) : ?>
                        <li class="card">
                            <div class="img"><img src="../assets/images/artwork/<?= $cardOeuvre['chemin_Image']; ?>" alt="<?= $cardOeuvre['chemin_Image']; ?>"></div>
                            <div class="btn-voir-plus">
                                <button class="btn-afficher">
                                    <a href="descriptionOeuvre.php?id=<?= $cardOeuvre["Id_Oeuvres"]; ?>"><?php echo AFFICHE; ?></a>
                                </button>
                                <button class="btn-afficher"><a href="descriptionOeuvrefalc.php?id=<?= $cardOeuvre["Id_Oeuvres"]; ?>"><?php echo FALC; ?></a></button>
                            </div>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <i id="right" class="fa-solid fa-angle-right"></i>
            </div>
        </div>

<?php
    } 
    else{ ?>
           
            <h3 class="infos-sup"><?php echo MESSAGE; ?></h3>
<?php
    }
}
;?> 




<script src="../assets/javascript/script2.js"></script>


<?php

include_once "includes/pages/footer.php";

?>





