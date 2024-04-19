<?php

session_start();
require_once "../config/pdo.php";

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";
 
$sql= "SELECT * FROM dirart
ORDER BY nom_DirArt ASC";

if(isset($_GET['filter-dirArt']) && !empty($_GET['filter-dirArt'])) {

  $searchQuery = htmlspecialchars($_GET['filter-dirArt']);
  $sql = "SELECT *
          FROM dirart 
          WHERE nom_DirArt LIKE '%$searchQuery%'
          ORDER BY nom_DirArt ASC";
}
$requete = $db -> query($sql);
$dirArts = $requete->fetchAll(PDO::FETCH_ASSOC);
// $db = null;
?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="art-contain-by-btn">
    <h2 class="title-page-artist">Liste des Directeurs Artistique : </h2>

    <div class="art-content-now">
        <div class="expo-content-now">
        <div class="search-container form-divs-list-artist">
            <form action="" method="GET">
                <label for="filter-dirArt">Filtrer par nom :</label>
                <input type="text" class="search-bar" id="filter-dirArt" name="filter-dirArt" placeholder="Entrer le nom du directeur artistique">
                <button type="submit" class="search-btn"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg></button>
            </form>
        </div>
            <div class="container-cards-art-now">
                <?php foreach($dirArts  as $dir) : ?>
                    <div class="card-art-now-expo" id="<?= $dir['id_DirArt'] ?>">
                    <div class="card-row1">
                        <h2><?= $dir['nom_DirArt']." ".$dir['prenom_DirArt'];?></h2>
                    </div>
                    <div class="card-row2">
                        <div class="content-infos-oeuvre-ongoing">
                            <div class="infos-oeuvre-ongoing artist-info-content">
                                <p class=""><span class='info-atists'>Email :</span> <a href="mailto:<?= $dir["email_DirArt"];?>"><?= $dir["email_DirArt"];?></a>
                                <p><span class='info-atists'>Téléphone :</span> <?=  $dir["tel_DirArt"];?> </p>
                            </div>
                            <div class="action-oeuvre-ongoing">
                                <div class="modify-art-ongoing">
                                    <a href="dirart-update.php?id=<?= $dir['id_DirArt']; ?>">
                                        <svg viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
                <?php endforeach ;?>
                        </div>
                    </div>
                    <div class="container-button-art-ongoing">
                        <button type="button" id="add-oeuvre-expo-now">
                        <a href="./form_add_dirart.php">Ajouter un directeur artistique</a><svg viewBox="0 0 448 512"><path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg></button>
                    </div>
            </div>
        </div>



   

<?php 

include "includes/pages/footer.php";

;?>