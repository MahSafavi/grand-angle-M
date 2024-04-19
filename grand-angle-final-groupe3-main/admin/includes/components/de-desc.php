<?php 

$id = $_GET['id'];

$sqlLangues = "SELECT langue.Id_Langue, langue.libelle_Langue, oeuvres.Id_Oeuvres, oeuvres.libelle_Oeuvre, contenu.Id_Langue, contenu.libelle_Contenu, contenu.description_Contenu, contenu.Auteur_Contenu
FROM oeuvres 
JOIN contenu ON oeuvres.Id_Oeuvres = contenu.Id_Oeuvres
JOIN langue ON contenu.Id_Langue = langue.Id_Langue
WHERE oeuvres.Id_Oeuvres = :Id_oeuvre
AND contenu.Id_Langue = :Id_langue";
$requeteLangues = $db->prepare($sqlLangues);
$requeteLangues->bindValue(":Id_oeuvre", $id, PDO::PARAM_INT);
$requeteLangues->bindValue(":Id_langue", $de, PDO::PARAM_INT);
$requeteLangues->execute();
$languesTest = $requeteLangues->fetch();

;?>


<div class="de">
    <form action="" method="POST" class="form">
        <div class="add-oeuvre-descr">
            <div class="add-description">
                <div class="div-select-oeuvre">
                    <label for="oeuvreConcDe">Oeuvre concernée : </label>
                    <select name="oeuvreConcDe" id="oeuvreConcDe">
                        <option value="<?php echo isset($languesTest['Id_Oeuvres']) ? $languesTest['Id_Oeuvres'] : " ";?>"><?php echo isset($languesTest['libelle_Oeuvre']) ? $languesTest['libelle_Oeuvre'] : " " ;?></option>
                    </select>
                </div>
                <div class="libelle-contenu">
                    <label for="libelleContenuDe">Nom de la description : </label>
                    <input type="text" name="libelleContenuDe" id="libelleContenuDe" value="<?php echo isset($languesTest['libelle_Contenu']) ? $languesTest['libelle_Contenu'] : " ";?>">
                </div>
                <label for="descriptionDe">Description :</label>
                <textarea name="descriptionDe" id="descriptionDe" cols="40" rows="10" value="<?php echo isset($languesTest['description_Contenu']) ? $languesTest['description_Contenu'] : " ";?>"><?php echo isset($languesTest['description_Contenu']) ? $languesTest['description_Contenu'] : " ";?></textarea>
            </div>
            <div class="auteur-contain">
                <label for="auteurDe">Auteur :</label>
                <input type="text" name="auteurDe" id="auteurDe" value="<?php echo isset($languesTest['Auteur_Contenu']) ? $languesTest['Auteur_Contenu'] : " ";?>">
            </div>
            <div class="btn-submit-add-oeuvre btn-add-descr">
                <input type="submit" name="de-description-submit" id="de-description-submit" value="Valider">
            </div>  
        </div>   
    </form> 
</div>