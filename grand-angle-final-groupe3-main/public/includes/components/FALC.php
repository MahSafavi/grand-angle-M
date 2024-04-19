<?php

require_once "../config/pdo.php";
$titre = "FALC";
$nav = "FALC";
include_once "includes/pages/nav.php";

// Check if both id and lang parameters are present
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


    // Fetch object details based on ID
    $sql = "SELECT *
            FROM oeuvres
            JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
            JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
            JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition
            JOIN contenu ON contenu.Id_Oeuvres = oeuvres.Id_Oeuvres
            JOIN video ON video.Id_Oeuvres = oeuvres.Id_Oeuvres
            JOIN audio ON audio.Id_Oeuvres = oeuvres.Id_Oeuvres
            JOIN langue ON contenu.Id_Langue = langue.Id_Langue 
            WHERE oeuvres.Id_Oeuvres = $id AND langue.Id_Langue = $id_L";
    $request = $db->query($sql);
    $arts = $request->fetchAll(PDO::FETCH_ASSOC);
} elseif (isset($_GET['id']) && !isset($_GET['lang'])) {
    $id = $_GET['id'];
    $id_L = 1;
    $sql1 = "SELECT *
    FROM oeuvres
    JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
    JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
    JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition
    JOIN contenu ON contenu.Id_Oeuvres = oeuvres.Id_Oeuvres
    JOIN langue ON contenu.Id_Langue = langue.Id_Langue
    WHERE oeuvres.Id_Oeuvres = $id AND langue.Id_Langue = $id_L";
    $request1 = $db->query($sql1);
    $arts = $request1->fetchAll(PDO::FETCH_ASSOC);
}
?>


<div class="bkgfalc">

    <div class="falci">
        <div class="hdFALC">
            <i class="fa-solid fa-eye"></i>
            <h2>FALC</h2>
        </div>
    </div>

    <div class="artworkFC">
    <div class="falci">
        <i class="fa-solid fa-chart-bar falci"></i>
       

            </h3><?php echo DESC_H3; ?></h3>
        </div>
        <?php foreach ($arts as $art) : ?>
            <img src="../assets/images/artwork/<?= $art['chemin_Image']; ?>" alt="<?= $art['libelle_Oeuvre']; ?>">
        <?php endforeach ?>
    </div>

    <div class="descriptionFC">
        <div class="falci">
            <i class="fa-solid fa-palette falci"></i>
            <div><?php echo DESC1_H3; ?></div>
        </div>
        <p>
            <?php
            foreach ($arts as $art) {
                echo $art['description_Contenu'];
            } ?>
        </p>
    </div>

    <div class="additional-infoFC">
        <div class="falci">
        <i class="fa-solid fa-file-circle-plus"></i>
        <div><?php echo ADDINFOS_H3; ?></div>
        </div>
        <div class="addinf">
        <ul>
            <?php foreach ($arts as $art) : ?>
                <li><strong><i class="fa-solid fa-image-portrait"></i><?php echo ARTISTE; ?> : </strong><?= $art['Prenom_Artiste'] . " "; ?><?= $art['Nom_Artiste']; ?></li>
                <li><strong><?php echo LIBELLEO; ?> : </strong><?= $art['libelle_contenu']; ?></li>
                <li><strong><i class="fa-solid fa-euro-sign"></i><?php echo PRIXO; ?> : </strong><?= $art['prix']; ?>€</li>
                <li><strong><i class="fa-solid fa-expand"></i><?php echo DIMO; ?> : </strong><?= " " . $art['hauteur_Oeuvre'] . " "; ?><i class="fa-solid fa-xmark"></i><?= " " . $art['largeur_Oeuvre'] . " "; ?><i class="fa-solid fa-xmark"></i><?= " " . $art['profondeur_Oeuvre'] . " "; ?></li>
                <li><strong><i class="fa-solid fa-calendar-days"></i><?php echo DATE; ?> : </strong><?= date('d-m-y', strtotime($art['Date_Debut'])) . " "; ?>-<?= " " . date('d-m-y', strtotime($art['Date_Fin'])); ?></li>
                <?php endforeach; ?> 
        </ul>
        </div>
    </div>

    <div class="exhibition-videoFC">
        <div class="falci">
            <i class="fa-regular fa-circle-play falci"></i>
            <div><?php echo VIDEO_H3; ?></div>
                <?php foreach($arts as $art): ?>
                <iframe class="video" width="560" height="315" src="../assets/video/<?php echo $art['chemin_Video']; ?>" frameborder="0" allowfullscreen></iframe>
                <?php endforeach; ?>    
        </div>
    </div>

    <div class="audio-fileFC">
        <div class="falci">
        <i class="fa-solid fa-file-audio falci"></i>
        <?php foreach($arts as $art): ?>
        <div><?php echo AUDIO_H3; ?></div>
                  
        </div>
        <audio controls class="audio">
            <source src="../assets/audio/<?php echo $art['chemin_Audio']; ?>" type="audio/mpeg">
        </audio>
    </div>
    <?php endforeach ;?>
</div>

<?php
include_once "includes/pages/footer.php";
?>