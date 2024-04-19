<?php 

$id = $_GET['id'];

require_once "../config/pdo.php";

$sqldirart = "SELECT * FROM dirart";
$requetedirart = $db->query($sqldirart);
$dirarts = $requetedirart->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT artiste.Nom_Artiste, artiste.Prenom_Artiste, artiste.Email_Artiste, artiste.tel_Artiste, artiste.id_DirArt
FROM artiste
WHERE artiste.Id_Artiste = :Id_Artiste";
$requeteUpArtiste = $db->prepare($sql);
$requeteUpArtiste->bindValue(":Id_Artiste", $id, PDO::PARAM_INT);
$requeteUpArtiste->execute();
$artisteUp = $requeteUpArtiste->fetch();

if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit-up-artiste'])) {

    $nom = $_POST['nom-artiste-up'];
    $prenom = $_POST['prenom-artiste-up'];
    $email = $_POST['email-artiste-up'];
    $tel = $_POST['tel-artiste-up'];
    $dirart = null;

    if(empty($_POST['dirart-up-artiste'])) {
        $sqlUp = "UPDATE artiste SET artiste.Nom_Artiste = :Nom_Artiste, artiste.Prenom_Artiste = :Prenom_Artiste, artiste.Email_Artiste = :Email_Artiste, artiste.tel_Artiste = :tel_Artiste, artiste.id_DirArt = :id_DirArt
        WHERE artiste.Id_Artiste = :Id_Artiste";
        try {
            $requeteUp = $db->prepare($sqlUp);
            $requeteUp->execute([
                ":Nom_Artiste" => $nom,
                ":Prenom_Artiste" => $prenom,
                ":Email_Artiste" => $email,
                ":tel_Artiste" => $tel,
                ":id_DirArt" => $dirart,
                ":Id_Artiste" => $id
            ]);

            echo ('Modification effectuée');
        } catch (PDOException $e) {
            echo ('Erreur lors de la modification') . $e->getMessage();
            exit();
    }
    } else {
        $sqlUp = "UPDATE artiste SET artiste.Nom_Artiste = :Nom_Artiste, artiste.Prenom_Artiste = :Prenom_Artiste, artiste.Email_Artiste = :Email_Artiste, artiste.tel_Artiste = :tel_Artiste, artiste.id_DirArt = :id_DirArt
        WHERE artiste.Id_Artiste = :Id_Artiste";
        try {
            $requeteUp = $db->prepare($sqlUp);
            $requeteUp->execute([
                ":Nom_Artiste" => $nom,
                ":Prenom_Artiste" => $prenom,
                ":Email_Artiste" => $email,
                ":tel_Artiste" => $tel,
                ":id_DirArt" => $_POST['dirart-up-artiste'],
                ":Id_Artiste" => $id
            ]);

            echo ('Modification effectuée');
        } catch (PDOException $e) {
            echo ('Erreur lors de la modification') . $e->getMessage();
            exit();
    }
    }

    
} 

;?>

<div class="artiste-infos">
    <div class="title-add-artiste">
        <h2>Modifier les informations d'un artiste :</h2> 
    </div>
    
    <form action="" method="POST">

        <div>
            <div class="main-info-add-artiste">

                <div class="div-nom-artiste">
                    <label for="nom-artiste-up">Nom :</label>
                    <input type="text" id="nom-artiste-up" name="nom-artiste-up" value="<?php echo $artisteUp['Nom_Artiste'];?>">
                </div>
                <div class="div-prenom-artiste">
                    <label for="prenom-artiste-up">Prénom :</label>
                    <input type="text" id="prenom-artiste-up" name="prenom-artiste-up" value="<?php echo $artisteUp['Prenom_Artiste'];?>">
                </div>

            </div>

            <div class="sub-infos-add-artiste">

                <div class="div-email-artiste">
                    <label for="email-artiste-up">Email :</label>
                    <input type="email" id="email-artiste-up" name="email-artiste-up" value="<?php echo $artisteUp['Email_Artiste'];?>">
                </div>
                
                <div class="div-tel-artiste">
                    <label for="tel-artiste-up">Téléphone :</label>
                    <input type="text" id="tel-artiste-up" name="tel-artiste-up" value="<?php echo $artisteUp['tel_Artiste'];?>">
                </div>

                <div class="div-dir-artiste">
                    <label for="dirart-up-artiste">Directeur Artistique</label>
                    <select name="dirart-up-artiste" id="dirart-up-artiste">
                        <option value="">Sélectionner un directeur artistique</option>
                        <option value="">Aucun</option>
                        <?php foreach($dirarts as $dirart):?>
                        <option id="dirart-up-artiste" value="<?php echo $dirart['id_DirArt'];?>" <?= ($dirart["id_DirArt"] == $artisteUp["id_DirArt"]) ? 'selected' : '' ?>> <?= $dirart['nom_DirArt'] . " " . $dirart['prenom_DirArt']?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
             
            </div>
            <div class="div-btn-add-artiste">
                <button type="submit" name="submit-up-artiste" id="submit-up-artiste">Modifier la fiche artiste</button>
            </div>
        </div>

    </form>
</div>