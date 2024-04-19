<?php
/* require "config/pdo.php";
$titre = "Accueil";
$nav = "Accueil";
include_once "includes/pages/nav.php"; */


$sqlArtNow = "SELECT *
FROM oeuvres
JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition
WHERE exposition.Date_Debut <= DATE_ADD(CURRENT_DATE(), INTERVAL 3 DAY) AND CURRENT_DATE() <= exposition.Date_Fin";
$requeteArtNow = $db->query($sqlArtNow);
$oeuvresNow = $requeteArtNow->fetchAll(PDO::FETCH_ASSOC);

if ( isset($_GET['lang'])) {

  $lang = $_GET['lang'];

}else {
  $lang = "FR"; 
}
?>

<div class="cardAccueil">
  <h3><?php echo AP; ?></h3>
  <p><?php echo CARDACC; ?></p>
</div>

<h3><?php echo TLECAROU; ?></h3>

<div class="wrapper">
    <i id="left" class="fa-solid fa-angle-left"></i>
    <ul class="carousel">
      <?php foreach ($oeuvresNow as $oeuvre) : ?>
        <li class="card">
          <div class="img"><img src="../assets/images/artwork/<?= $oeuvre['chemin_Image']; ?>" alt="<?= $oeuvre['chemin_Image']; ?>"></div>
          <div class="btn-voir-plus">
            <button class="btn-afficher">
              <a href="descriptionOeuvre.php?id=<?= $oeuvre["Id_Oeuvres"]; ?>&lang=<?php echo $lang ?>"><?php echo AFFICHE; ?></a>
            </button>
            <button class="btn-afficher"><a href="descriptionOeuvrefalc.php?id=<?= $oeuvre["Id_Oeuvres"]; ?>&lang=<?php echo $lang ?>"><?php echo FALC; ?></a></button>
          </div>
        </li>
      <?php endforeach; ?>
    </ul>
    <i id="right" class="fa-solid fa-angle-right"></i>
  </div>
  <script src="../assets/javascript/script2.js"></script>
