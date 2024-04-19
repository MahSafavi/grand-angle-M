<?php 

$sql = "SELECT * FROM langue";
$requeteLangue = $db->query($sql);
$langues = $requeteLangue->fetchAll(PDO::FETCH_ASSOC);


$sql = "SELECT oeuvres.Id_Oeuvres, oeuvres.libelle_Oeuvre, artiste.Nom_Artiste, artiste.Prenom_Artiste
        FROM oeuvres 
        JOIN artiste ON oeuvres.Id_Artiste = artiste.Id_Artiste";
$requeteOeuvre = $db->query($sql);
$oeuvres = $requeteOeuvre->fetchAll(PDO::FETCH_ASSOC);


if($_SERVER["REQUEST_METHOD"] == "POST") {

    if(isset($_POST['description-submit'])) {
        if(isset($_POST["description"], $_POST["langues"], $_POST["oeuvreConc"], $_POST["libelleContenu"], $_POST["auteur"])
        && !empty($_POST["description"]) && !empty($_POST["langues"]) && !empty($_POST["libelleContenu"]) && !empty($_POST["auteur"]) && !empty($_POST["oeuvreConc"])) {
    
            $description = filtrage($_POST["description"]);
    
            $sqlDescr = "INSERT INTO contenu(description_Contenu, Auteur_Contenu, libelle_contenu, Id_Oeuvres, Id_Langue) VALUES (:description_Contenu, :Auteur_Contenu, :libelle_contenu, :Id_oeuvre, :Id_Langue)";
            $query = $db->prepare($sqlDescr);
            $query->bindValue(":description_Contenu", $_POST["description"], PDO::PARAM_STR);
            $query->bindValue(":Auteur_Contenu", $_POST["auteur"], PDO::PARAM_STR);
            $query->bindValue(":libelle_contenu", $_POST["libelleContenu"], PDO::PARAM_STR);
            $query->bindValue(":Id_oeuvre", $_POST["oeuvreConc"], PDO::PARAM_INT);
            $query->bindValue(":Id_Langue", $_POST["langues"], PDO::PARAM_INT);
            $query->execute();
    
            $idDesc = $db->lastInsertId();
    
        } else {
            die("Wrong");
        }
    }
    
    }

;?>

<div class="oeuvre-contenu-supp">
    <div class="btn-page-contenu">
        <button><a href="contenu-enrichi.php">Voir le contenu enrichi</a></button>
    </div>
    <div class="div-qrcode">
        <button><a href="qr.php">Créer un QR Code</a></button>
    </div>
</div>


<form action="" method="POST">
    <div class="add-oeuvre-descr">
        <div class="add-description">
            <div>
                <h2>Ajouter une description ou une traduction :</h2>
            </div>
            <div class="libelle-contenu">
                <label for="libelleContenu">Nom de la description</label>
                <input type="text" name="libelleContenu" id="libelleContenu">
            </div>
            <label for="description">Description  </label>
            <textarea name="description" id="description" cols="40" rows="10"></textarea>
        </div>

        <div class="div-select-oeuvre">
            <label for="oeuvreConc">Oeuvre concernée : </label>
            <select name="oeuvreConc" id="oeuvreConc">
                <?php foreach($oeuvres as $oeuvre) :?>
                <option value="<?php echo $oeuvre["Id_Oeuvres"];?>"><?= $oeuvre["libelle_Oeuvre"]?> - <?php echo $oeuvre["Nom_Artiste"];?> <?php echo $oeuvre["Prenom_Artiste"] ;?></option>
                <?php endforeach ;?>
            </select>
        </div>
                
        <div class="div-select-langue">
            <label for="langues">Langues : </label>
            <select name="langues" id="langues">
                <?php foreach($langues as $langue) :?>
                <option value="<?php echo $langue["Id_Langue"] ;?>"><?php echo $langue["libelle_Langue"];?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="auteur-contain">
            <label for="auteur">Auteur :</label>
            <input type="text" name="auteur" id="auteur">
        </div>
        <div class="btn-submit-add-oeuvre btn-add-descr">
            <input type="submit" name="description-submit" id="description-submit" value="Valider">
        </div>  
    </div>   
</form>   
            
       