<?php
require_once "../config/pdo.php";

$titre = "listeCollection";
$nav = "listeCollection";
include_once "includes/pages/nav.php";

if (isset($_GET['lang'])) {
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
          JOIN langue ON contenu.Id_Langue = langue.Id_Langue 
          JOIN type_oeuvre ON oeuvres.Id_Type = type_oeuvre.Id_Type
          WHERE langue.Id_Langue = $id_L";
  $request = $db->query($sql);
  $Collecs = $request->fetchAll(PDO::FETCH_ASSOC);
} elseif (!isset($_GET['lang'])) {

  $id_L = 1;
  $sql1 = "SELECT *
  FROM oeuvres
  JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
  JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
  JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition
  JOIN contenu ON contenu.Id_Oeuvres = oeuvres.Id_Oeuvres
  JOIN langue ON contenu.Id_Langue = langue.Id_Langue
  JOIN type_oeuvre ON oeuvres.Id_Type = type_oeuvre.Id_Type
  WHERE langue.Id_Langue = $id_L";
  $request1 = $db->query($sql1);
  $Collecs = $request1->fetchAll(PDO::FETCH_ASSOC);
}
?>

<div class="container-infos-expo">
  <div class="expo-infos">
    <div class="expo-header">
      <h2 class=""><?php echo COLD; ?></h2>
      <p class="date-time"><?php include_once "date.php" ?></p>
    </div>
    <div class="expo-lineinfos">
      <div class="expo-status">
        <div class="item-status">
          <span class="status-number"><?php echo count($Collecs); ?></span>
          <span class="type-status"><?php echo NTOE; ?></span>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="filter">

  <span><?php echo COLFIL; ?></span>
  <select id="select-filter">
    <?php
    $currentType = null;
    foreach ($Collecs as $Collec) :
      if ($Collec['libelle_Type'] != $currentType) :
        $currentType = $Collec['libelle_Type']; ?>
        <option value="<?php echo $Collec['libelle_Type']; ?>"><?php echo $Collec['libelle_Type']; ?></option>
      <?php endif; ?>
    <?php endforeach; ?>
  </select>
</div>

<div class="expo-wrapper">
  <?php
  $currentType = null;
  foreach ($Collecs as $Collec) :
    if ($Collec['libelle_Type'] != $currentType) :
      $currentType = $Collec['libelle_Type'];
  ?>

      <div class="rotate">
        <h2 id="<?= str_replace(' ', '-', strtolower($currentType)); ?>" class="colect-name"><?= $currentType; ?> <a href=""><i class="fa-solid fa-arrow-up"></i></a></h2>
      </div>
    <?php endif; ?>
    <div class="card-keeper-expo">
      <div class="card-expo" id="card-artiste">
        <div class="card-row2">
          <div class="image-artiste-ongoing" id="art-img">
            <img src="../assets/images/artwork/<?= $Collec['chemin_Image']; ?>" alt="image collection">
          </div>
        </div>
        <div class="card-content-expo">
          <h4 class="libelle-expo"><?= $Collec["libelle_contenu"]; ?></h4>
          <div class="keep-expo-btn">
            <button class="voir-plus-expo">
              <a href="descriptionOeuvre.php?id=<?= $Collec["Id_Oeuvres"]; ?>"><?php echo AFFICHE; ?></a>
            </button>
          </div>
        </div>
      </div>
    </div >
  <?php endforeach; ?>
</div>


<?php
include_once "includes/pages/footer.php";
?>