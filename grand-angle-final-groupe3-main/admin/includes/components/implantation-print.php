<?php 

require_once "../config/pdo.php";

$sqlImplant = "SELECT exposition.libelle_Exposition, exposition.Date_Debut, exposition.Date_Fin, oeuvres.libelle_Oeuvre, oeuvres.hauteur_Oeuvre, oeuvres.largeur_Oeuvre, oeuvres.profondeur_Oeuvre, oeuvres.poids_Oeuvre, image.chemin_Image
FROM exposition
JOIN oeuvres ON exposition.Id_Exposition = oeuvres.Id_Exposition
JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
WHERE CURRENT_DATE() BETWEEN exposition.Date_Debut AND exposition.Date_Fin";
$requeteImplant = $db->query($sqlImplant);
$implantations = $requeteImplant->fetchAll(PDO::FETCH_ASSOC);

$sqlLibelle = "SELECT exposition.libelle_Exposition, exposition.Date_Debut, exposition.Date_Fin
FROM exposition
WHERE CURRENT_DATE() BETWEEN exposition.Date_Debut AND exposition.Date_Fin";
$requeteLibelle = $db->query($sqlLibelle);
$libelle = $requeteLibelle->fetch(PDO::FETCH_ASSOC);

;?>

<div class="scroll-container-principal">
    <div class="container-principal">
       <h1 class="hide-on-print">Créer une implantation :</h1>
        <div class="plan-visuel hide-on-print">
            <div class="search-bar-plan hide-on-print">
                <input type="text" placeholder="Rechercher une exposition...">
            </div>
            <div class="plan-grille hide-on-print">
                <img src="../assets/images/plan-grille-visuel.png" alt="">
            </div>
        </div>

        <div class="scroll-plan-list" id="print-list">
            <div class="plan-list-print">
                <h2>Liste de l'implantation pour l'exposition :</h2>
                <h3> <?= $libelle['libelle_Exposition']?></h3>
                <div class="container-liste-oeuvres">
                    <?php foreach($implantations as $implantation) :?>
                    <div class="oeuvres-implant">
                        <div class="oeuvres-implant-infos">
                            <p class="libelle-oeuvre-implant"><?= $implantation['libelle_Oeuvre']?></p>
                            <p>H / L / P :<?= $implantation['hauteur_Oeuvre'] . "x" . $implantation['largeur_Oeuvre'] . "x" . $implantation['profondeur_Oeuvre']?></p>
                            <p>Poids :<?= $implantation['poids_Oeuvre']?></p>
                        </div>
                        <div class="oeuvres-implant-img">
                            <img src="../assets/images/artwork/<?= $implantation['chemin_Image']?>" alt="">
                        </div>
                        <div class="oeuvres-implant-position">
                            <input type="text">
                        </div>
                    </div>
                    <?php endforeach ;?>
                </div>
                
            </div>
        </div>
    </div>
    <div class="btn-print">
            <button class="button" onclick="window.print()">Imprimer la liste</button>
        </div>
    
</div>

<script>

</script>