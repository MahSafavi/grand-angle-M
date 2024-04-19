<?php

require_once "../config/pdo.php";


$titre = "listeArtiste";
$nav = "listeArtiste";
include_once "includes/pages/nav.php";


$sqlArtist = "SELECT *
FROM artiste";
$requeteArtisteT = $db->query($sqlArtist);
$Art = $requeteArtisteT->fetchAll(PDO::FETCH_ASSOC);


$sqlArtiste = "SELECT artiste.Id_Artiste, artiste.Nom_Artiste, artiste.Prenom_Artiste, bio_artist.chemin_Imgart
FROM artiste
JOIN bio_artist ON artiste.Id_Artiste = bio_artist.Id_Artiste
GROUP BY artiste.Id_Artiste, artiste.Nom_Artiste, artiste.Prenom_Artiste, bio_artist.chemin_Imgart";
$requeteArtiste = $db->query($sqlArtiste);
$Artistes = $requeteArtiste->fetchAll(PDO::FETCH_ASSOC);


$sqlArtisteCours = "SELECT *
FROM exposition
JOIN artiste ON exposition.Id_Artiste = artiste.Id_Artiste
WHERE exposition.Date_Debut <= CURRENT_DATE() AND CURRENT_DATE() <= exposition.Date_Fin";
$requeteArtisteC = $db->query($sqlArtisteCours);
$ArtisteC = $requeteArtisteC->fetchAll(PDO::FETCH_ASSOC);
?>


<div class="container-infos-expo">
  <div class="expo-infos">
    <div class="expo-header">
      <h2 class=""><?php echo NARTISTES; ?></h2>
      <p class="date-time"><?php include_once "date.php" ?></p>
    </div>
    <div class="expo-lineinfos">
      <div class="expo-status">
        <div class="item-status">
          <span class="status-number"><?php echo count($Art); ?></span>
          <span class="type-status"><?php echo NTARTS; ?></span>
        </div>
        <div class="item-status">
          <?php foreach ($ArtisteC as $Artiste) : ?>
            <span class="status-number"><?php echo $Artiste['Nom_Artiste']; ?></span>
          <?php endforeach; ?>
          <span class="type-status"><?php echo ARTN; ?></span>

        </div>
      </div>
    </div>
  </div>
</div>


<div class="expo-wrapper">
  <?php foreach ($Artistes as $Art) : ?>
    <div class="card-keeper-expo">
      <div class="card-expo" id="card-artiste">
        <div class="card-row2">
          <div class="image-artiste-ongoing" id="art-img">
            <img src="../assets/images/img-artiste/<?php echo $Art['chemin_Imgart']; ?>" alt="<?php echo $Art['Nom_Artiste']; ?>">
          </div>
        </div>
        <div class="card-content-expo">
          <h4 class="libelle-expo"><?= $Art["Nom_Artiste"] . " " . $Art["Prenom_Artiste"]; ?></h4>

          <div class="keep-expo-btn">
            <button class="voir-plus-expo">
              <a href="ficheArtiste.php?id=<?= $Art["Id_Artiste"]; ?>"><?php echo AFFICHE; ?></a>
            </button>
          </div>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
</div>

<?php
include_once "includes/pages/footer.php";
?>