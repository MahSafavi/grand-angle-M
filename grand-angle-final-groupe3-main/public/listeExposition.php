<?php

require_once "../config/pdo.php";


$titre = "listeExposition";
$nav = "listeExposition";
include_once "includes/pages/nav.php";


$sqlExpo = "SELECT *
FROM exposition ";
$requeteExpo = $db->query($sqlExpo);
$Expos = $requeteExpo->fetchAll(PDO::FETCH_ASSOC);

$sqlExpoTotal = "SELECT *
FROM exposition ";
$requeteExpoT = $db->query($sqlExpoTotal);
$ExposT = $requeteExpoT->fetchAll(PDO::FETCH_ASSOC);

$sqlExpoCours = "SELECT *FROM exposition WHERE exposition.Date_Debut <= CURRENT_DATE() AND CURRENT_DATE() <= exposition.Date_Fin";
$requeteExpoC = $db->query($sqlExpoCours);
$ExposC = $requeteExpoC->fetchAll(PDO::FETCH_ASSOC);

$sqlExpoFutur = "SELECT *
FROM exposition
WHERE exposition.Date_Debut > CURRENT_DATE()";
$requeteExpoF = $db->query($sqlExpoFutur);
$ExposF = $requeteExpoF->fetchAll(PDO::FETCH_ASSOC);


?>


<div class="container-infos-expo">
  <div class="expo-infos">
    <div class="expo-header">
      <h2 class=""><?php echo NEXPO;?></h2>
      <p class="date-time"><?php include_once "date.php" ?></p>
    </div>
    <div class="expo-lineinfos">
      <div class="expo-status">
        <div class="item-status">
          <span class="status-number"><?php echo count($ExposT);?></span>
          <span class="type-status"><?php echo NTEXPO;?></span>
        </div>  
        <div class="item-status">
          <span class="status-number"><?php echo count($ExposC);?></span>
          <span class="type-status"><?php echo EXPOC;?></span>
        </div>
        <div class="item-status">
          <span class="status-number"><?php echo count($ExposF);?></span>
          <span class="type-status"><?php echo EXPOV;?></span>
        </div>
      </div>
    </div>
  </div>
</div>


<div class="expo-wrapper">
  <?php foreach ($Expos as $Expo) : ?>
    <div class="card-keeper-expo">
      <div class="card-expo">
        <div class="image-content-expo">
          <div class="card-image-expo">
            <img src="../assets/images/exposition/<?= $Expo["chemin_Affiche"]; ?>" class="card-img-expo" alt="Images de l'exposition">
          </div>
        </div>
        <div class="card-content-expo">
          <h4 class="libelle-expo"><?= $Expo["libelle_Exposition"]; ?></h4>
          <h4 class="libelle-expo">Date de l'exposition : 
          
          <span class="date-expo"><?= date('d-m-y', strtotime($Expo['Date_Debut'])) . " "; ?>-<?= " " . date('d-m-y', strtotime($Expo['Date_Fin'])); ?></span></h4>
          
          <div class="keep-expo-btn">
          <button class="voir-plus-expo">
            <a href="ficheExpo.php?id=<?= $Expo["Id_Exposition"];?>"><?php echo AFFICHE;?></a>
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