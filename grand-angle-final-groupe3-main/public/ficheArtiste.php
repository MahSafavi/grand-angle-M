<?php

require_once "../config/pdo.php";

$titre = "fiche Artiste";
$nav = "fiche Artiste";
include_once "includes/pages/nav.php";

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

    $sqlBio = "SELECT *
    FROM bio_artist
    JOIN langue ON bio_artist.Id_Langue = langue.Id_Langue
    JOIN artiste ON bio_artist.Id_Artiste = artiste.Id_Artiste
    WHERE  bio_artist.Id_Langue = $id_L AND bio_artist.Id_Artiste = $id";
    $requestbio = $db->query($sqlBio);
    $Bios = $requestbio->fetchAll(PDO::FETCH_ASSOC);
} elseif (isset($_GET['id']) && !isset($_GET['lang'])) {
    $id = $_GET['id'];
    $id_L = 1;

    $sqlBio = "SELECT *
    FROM bio_artist
    JOIN langue ON bio_artist.Id_Langue = langue.Id_Langue
    JOIN artiste ON bio_artist.Id_Artiste = artiste.Id_Artiste
    WHERE  bio_artist.Id_Langue = $id_L AND bio_artist.Id_Artiste = $id";
    $requestbio = $db->query($sqlBio);
    $Bios = $requestbio->fetchAll(PDO::FETCH_ASSOC);
}


?>



<?php foreach ($Bios as $Bio) : ?>
    <h2 class="titre-artiste"><?php echo $Bio['Nom_Art'] . " " . $Bio['Prenom_Art']; ?></h2>

    <div class="img-keeper">
        <img src="../assets/images/img-artiste/<?php echo $Bio['chemin_Imgart']; ?>" alt="">
    </div>
    
<?php endforeach; ?>


<div class="description-artiste" id="">
    <i class="fa-solid fa-palette"></i>
    <h3><?php echo BIO; ?> : </h3>
    <p>
        <?php foreach ($Bios as $bio) : ?>
            <?php echo $bio['description_artist']; ?>
    </p>
<?php endforeach ?>

</div>
<?php

if (isset($_GET['id'])) {
    $id3 = $_GET['id'];
    $currentDateTime = date("Y-m-d H:i:s");
    $sql3 = "SELECT *
    FROM oeuvres
    JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
    JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
    JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition
    WHERE  oeuvres.Id_Artiste = $id3 AND (exposition.Date_Fin <= '$currentDateTime' OR 'exposition.Date_Debut' >= '$currentDateTime')";
    $request3 = $db->query($sql3);
    $cardOeuvres = $request3->fetchAll(PDO::FETCH_ASSOC);

    if (!empty($cardOeuvres)) {
?>
        <div class="oeuvreExpo <?php echo ("active1") ?>">
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
    else { ?>

        <h3 class="infos-sup"><?php echo MESSAGE2; ?></h3>
<?php
    }
}; ?>




<script src="../assets/javascript/script2.js"></script>


<?php

include_once "includes/pages/footer.php";

?>