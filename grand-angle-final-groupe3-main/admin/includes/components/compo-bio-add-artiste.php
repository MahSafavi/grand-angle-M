<?php 

include "./functions/filter.php";

$sqlArtConc = "SELECT * FROM artiste";
try {
    $queryArtConc = $db->query($sqlArtConc);
    $artisteConc = $queryArtConc->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo 'erreur sql' . $e->getMessage();
}

$sql = "SELECT * FROM langue";
$requeteLangue = $db->query($sql);
$langues = $requeteLangue->fetchAll(PDO::FETCH_ASSOC);


if($_SERVER["REQUEST_METHOD"] == "POST") {

    if(isset($_POST['bio-submit'])) {

        if(isset($_POST["bio"], $_POST["langues-bio"], $_POST["artisteConc"], $_FILES["photo-artiste-add-bio"])
        && !empty($_POST["bio"]) && !empty($_POST["langues-bio"]) && !empty($_POST["artisteConc"]) && !empty($_FILES["photo-artiste-add-bio"])) {

            $cheminImage = '../assets/images/img-artiste/' . $_FILES['photo-artiste-add-bio']['name'];
            move_uploaded_file($_FILES['photo-artiste-add-bio']['tmp_name'], $cheminImage);
    
            $bio = filtrage($_POST["bio"]);
    
            $sqlBio = "INSERT INTO bio_artist(description_artist, chemin_Imgart, Id_Langue, Id_Artiste) VALUES (:description_artist, :chemin_Imgart, :Id_Langue, :Id_Artiste)";
            $query = $db->prepare($sqlBio);
            try{
                $query->bindValue(":description_artist", $bio, PDO::PARAM_STR);
                $query->bindValue(":chemin_Imgart", $_FILES['photo-artiste-add-bio']['name'], PDO::PARAM_STR);
                $query->bindValue(":Id_Langue", $_POST["langues-bio"], PDO::PARAM_INT);
                $query->bindValue(":Id_Artiste", $_POST["artisteConc"], PDO::PARAM_INT);
                $query->execute();
    
                $idBio = $db->lastInsertId(); 
            } catch (PDOException $e) {
                echo ("erreur d'insertion") . $e->getMessage();
            }
            
            echo("Ajout en bdd réussi");
    
        } else {
            die("Wrong");
        }
    }
    
    }

;?>

<form action="" method="POST" enctype="multipart/form-data">
    <div class="add-oeuvre-descr">
        <div class="add-description">
            <div>
                <h2>Ajouter une biographie :</h2>
            </div>
            <div class="img-container-add-artiste">
                <div class="img-content-add-artiste">
                    <img id="preview-img-artiste-add" src="./assets/img/imgvide.webp" alt="">  
                </div>
                <div class="input-photo-artiste">
                    <label for="photo-artiste-add-bio">Photo de l'artiste :</label>
                    <input type="file" id="photo-artiste-add-bio" name="photo-artiste-add-bio" accept="image/*" onchange="previewImage(this)">
                </div>
            </div>
            
            <label for="bio">Biographie :</label>
            <textarea name="bio" id="bio" cols="40" rows="10"></textarea>
        </div>

        <div class="div-select-oeuvre">
            <label for="artisteConc">Artiste concerné : </label>
            <select name="artisteConc" id="artisteConc">
                <?php foreach($artisteConc as $artisteC) :?>
                <option value="<?= $artisteC["Id_Artiste"] ?>"><?= $artisteC["Nom_Artiste"] ?> <?= $artisteC["Prenom_Artiste"] ?></option>
                <?php endforeach ;?>
            </select>
        </div>
                
        <div class="div-select-langue">
            <label for="langues-bio">Langues : </label>
            <select name="langues-bio" id="langues-bio">
                <?php foreach($langues as $langue) :?>
                <option value="<?= $langue["Id_Langue"] ?>"><?= $langue["libelle_Langue"] ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="btn-submit-add-oeuvre btn-add-descr">
            <input type="submit" name="bio-submit" id="bio-submit" value="Valider">
        </div>  
    </div>   
</form>   
            
<script>
    function previewImage(input) {
        const imgElement = document.getElementById('preview-img-artiste-add');
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
            imgElement.src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]); 
        } else {
            imgElement.src = "placeholder.jpg"; 
        }
}
</script>
