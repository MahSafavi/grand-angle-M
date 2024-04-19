<?php 

$id = $_GET['id'];


$sqlLangues = "SELECT langue.Id_Langue, langue.libelle_Langue, oeuvres.Id_Oeuvres, oeuvres.libelle_Oeuvre, contenu.Id_Langue, contenu.libelle_contenu, contenu.description_Contenu, contenu.Auteur_Contenu
FROM oeuvres 
LEFT JOIN contenu ON oeuvres.Id_Oeuvres = contenu.Id_Oeuvres
JOIN langue ON contenu.Id_Langue = langue.Id_Langue
WHERE oeuvres.Id_Oeuvres = :Id_oeuvre
AND contenu.Id_langue = :Id_langue";
$requeteLangues = $db->prepare($sqlLangues);
$requeteLangues->bindValue(":Id_oeuvre", $id, PDO::PARAM_INT);
$requeteLangues->bindValue(":Id_langue", $fr, PDO::PARAM_INT);
$requeteLangues->execute();
$languesTest = $requeteLangues->fetch();

;?>

<div class="fr">
    <form action="" method="POST" class="form">
        <div class="add-oeuvre-descr">
            <div class="add-description">
                <div class="div-select-oeuvre">
                    <label for="oeuvreConcFr">Oeuvre concernée : </label>
                    <select name="oeuvreConcFr" id="oeuvreConcFr">
                        <option value="<?php echo isset($languesTest['Id_Oeuvres']) ? $languesTest['Id_Oeuvres'] : " ";?>"><?php echo isset($languesTest['libelle_Oeuvre']) ? $languesTest['libelle_Oeuvre'] : " " ;?></option>
                    </select>
                </div>
                <div class="libelle-contenu">
                    <label for="libelleContenuFr">Nom de la description : </label>
                    <input type="text" name="libelleContenuFr" id="libelleContenuFr" value="<?php echo isset($languesTest['libelle_contenu']) ? $languesTest['libelle_contenu'] : " ";?>">
                </div>
                <label for="descriptionFr">Description :</label>
                <textarea name="descriptionFr" id="descriptionFr" cols="40" rows="10" value="<?php echo isset($languesTest['description_Contenu']) ? $languesTest['description_Contenu'] : " ";?>"><?php echo isset($languesTest['description_Contenu']) ? $languesTest['description_Contenu'] : " ";?></textarea>
            </div>
            <div class="auteur-contain">
                <label for="auteurFr">Auteur :</label>
                <input type="text" name="auteurFr" id="auteurFr" value="<?php echo isset($languesTest['Auteur_Contenu']) ? $languesTest['Auteur_Contenu'] : " ";?>">
            </div>
            <div class="btn-submit-add-oeuvre btn-add-descr">
                <input type="submit" name="fr-description-submit" id="fr-description-submit" value="Valider">
            </div>  
        </div>   
    </form> 
</div>