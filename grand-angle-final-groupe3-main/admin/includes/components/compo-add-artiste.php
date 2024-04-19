<?php
 
require_once "../config/pdo.php";
 
$sqlDirArt = "SELECT * FROM dirart";
$requeteDirArt = $db->query($sqlDirArt);
$dirarts = $requeteDirArt->fetchAll(PDO::FETCH_ASSOC);
 
if(isset($_POST['submit-add-artiste'])) {
    if(!empty($_POST)) {
        if(isset($_POST['nom-artiste'], $_POST['prenom-artiste'])
        && !empty($_POST['nom-artiste']) && !empty($_POST['prenom-artiste'])
        ){
            $nom = $_POST['nom-artiste'];
            $prenom = $_POST['prenom-artiste'];
 
            if(isset($_POST['email-artiste']) && !empty($_POST['email-artiste'])) {
                $email = $_POST['email-artiste'];
            } else {
                $email = "";
            }
 
            if(isset($_POST['tel-artiste']) && !empty($_POST['tel-artiste'])) {
                $tel = $_POST['tel-artiste'];
            } else {
                $tel = "";
            }
 
            if(isset($_POST['dirart-add-artiste']) && !empty($_POST['dirart-add-artiste'])) {
                $dirartiste = $_POST['dirart-add-artiste'];
            } else {
 
                $dirartiste = NULL;
            }
 
 
            if ($dirartiste === NULL) {
                $sqlAddArtiste = "INSERT INTO artiste(Nom_Artiste, Prenom_Artiste, Email_Artiste, tel_Artiste) VALUES(:Nom_Artiste, :Prenom_Artiste, :Email_Artiste, :tel_Artiste)";
            } else {
                $sqlAddArtiste = "INSERT INTO artiste(Nom_Artiste, Prenom_Artiste, Email_Artiste, tel_Artiste, id_DirArt) VALUES(:Nom_Artiste, :Prenom_Artiste, :Email_Artiste, :tel_Artiste, :id_DirArt)";
            }
 
            try {
                $requeteAddArtiste = $db->prepare($sqlAddArtiste);
                $requeteAddArtiste->bindParam(":Nom_Artiste", $nom);
                $requeteAddArtiste->bindParam(":Prenom_Artiste", $prenom);
                $requeteAddArtiste->bindParam(":Email_Artiste", $email);
                $requeteAddArtiste->bindParam(":tel_Artiste", $tel);
 
                if ($dirartiste !== NULL) {
                    $requeteAddArtiste->bindParam(":id_DirArt", $dirartiste);
                }
                $requeteAddArtiste->execute();
                $idArtiste = $db->lastInsertId();
                echo 'Ajout réussi';
            } catch (PDOException $e) {
                echo "erreur d'ajout" . $e->getMessage();
            }
        }
    } else {
        die("Ça n'a pas marché");
    }
}
 
;?>
 
 
<div class="artiste-infos">
    <div class="title-add-artiste">
        <h2>Ajouter les informations d'un nouvel artiste :</h2>
    </div>
   
    <form action="" method="POST">
 
        <div>
            <div class="main-info-add-artiste">
 
                <div class="div-nom-artiste">
                    <label for="nom-artiste">Nom :</label>
                    <input type="text" id="nom-artiste" name="nom-artiste">
                </div>
                <div class="div-prenom-artiste">
                    <label for="prenom-artiste">Prénom :</label>
                    <input type="text" id="prenom-artiste" name="prenom-artiste">
                </div>
 
            </div>
 
            <div class="sub-infos-add-artiste">
 
                <div class="div-email-artiste">
                    <label for="email-artiste">Email :</label>
                    <input type="email" id="email-artiste" name="email-artiste">
                </div>
               
                <div class="div-tel-artiste">
                    <label for="tel-artiste">Téléphone :</label>
                    <input type="text" id="tel-artiste" name="tel-artiste">
                </div>
 
                <div class="div-dir-artiste">
                    <label for="dirart-add-artiste">Directeur Artistique :</label>
                    <select name="dirart-add-artiste" id="dirart-add-artiste">
                        <option value="">Sélectionner un directeur artistique</option>
                        <option value="">Aucun</option>
                        <?php foreach($dirarts as $dirart):?>
                        <option id="dirart-add-artiste" value="<?= $dirart['id_DirArt']?>"><?= $dirart['nom_DirArt'] . " " . $dirart['prenom_DirArt']?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
           
            </div>
            <div class="div-btn-add-artiste">
                <button type="submit" name="submit-add-artiste" id="submit-add-artiste">Créer la fiche artiste</button>
            </div>
        </div>
 
    </form>
</div>