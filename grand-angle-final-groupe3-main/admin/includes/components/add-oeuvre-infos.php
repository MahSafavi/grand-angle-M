<?php 

function numInt($data) {
    $data = preg_match('/^[0-9]+$/', $data);
    return $data;
}

$sql = "SELECT * FROM exposition";
$requeteExposition = $db->query($sql);
$expositions = $requeteExposition->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT * FROM type_oeuvre";
$requeteType = $db->query($sql);
$types = $requeteType->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT * FROM position";
$requetePosition = $db->query($sql);
$positions = $requetePosition->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT Id_Artiste, Nom_Artiste, Prenom_Artiste FROM artiste";
$requeteArtiste = $db->query($sql);
$artistes = $requeteArtiste->fetchAll(PDO::FETCH_ASSOC); 

    if(isset($_POST['submit-type'])) {
        if(!empty($_POST)) {
            if(isset($_POST['add-type']) && !empty($_POST['add-type'])) {
            $sql = "INSERT INTO type_oeuvre(libelle_Type) VALUES(:libelle_Type)";
            $query = $db->prepare($sql);
            $query->bindValue(":libelle_Type", $_POST['add-type'], PDO::PARAM_STR);
            $query->execute();
            
            $idType = $db->lastInsertId();
        
        } else {
            die("L'ajout n'a pas fonctionné");
        } 
        }
    }


    if(isset($_POST["infos-submit"])) {
        if(isset($_POST["libelle"], $_FILES["imgOeuvre"], $_POST["type"], $_POST["artiste"], $_POST["exposition"], $_POST["position"])
        && !empty($_POST["libelle"]) && !empty($_FILES["imgOeuvre"]) && !empty($_POST["type"]) && !empty($_POST["artiste"]) && !empty($_POST["exposition"]) && !empty($_POST["position"])
        ){
            
       $libelle = filtrage($_POST["libelle"]);
       $libelleImg = filtrage($_POST["libelleImg"]);

        if(strlen($libelle) >= 150) {
           $error["libelle"] = "Le libellé est trop long";
       }

       if(strlen($libelleImg) >= 50) {
           $error["libelle"] = "Le libellé est trop long";
       }

       if(!numInt($_POST["hauteur"])) {
           $error = "La hauteur ne doit contenir que des numéros";
       }

       if(!numInt($_POST["largeur"])) {
           $error = "La largeur ne doit contenir que des numéros";
       }

       if(!numInt($_POST["profondeur"])) {
           $error = "La profondeur ne doit contenir que des numéros";
       }

       if(!numInt($_POST["poids"])) {
           $error = "Le poids ne doit contenir que des numéros";
       }

       if(!numInt($_POST["prix"])) {
           $error = "Le prix ne doit contenir que des numéros";
       } 

       if(isset($_POST["state"]) && $_POST["state"]) {
           $_POST["state"] = 1;
           
       } else {
           $_POST["state"] = 0;
       }

       $flash = "flash_temp";
      
       $sql = "INSERT INTO oeuvres(libelle_Oeuvre, hauteur_Oeuvre, largeur_Oeuvre, profondeur_Oeuvre, poids_Oeuvre, prix, etat_Oeuvre, Id_Exposition, Id_position, Id_Type, Id_Artiste, chemin_Flashcode) VALUES (:libelle_Oeuvre, :hauteur_Oeuvre, :largeur_Oeuvre, :profondeur_Oeuvre, :poids_Oeuvre, :prix, :etat_Oeuvre, :Id_Exposition, :Id_Position, :Id_Type, :Id_Artiste, :chemin_Flashcode)";
       try{
        $query = $db->prepare($sql);
       $query->bindValue(":libelle_Oeuvre", $libelle, PDO::PARAM_STR);
       $query->bindValue(":hauteur_Oeuvre", $_POST["hauteur"], PDO::PARAM_STR);
       $query->bindValue(":largeur_Oeuvre", $_POST["largeur"], PDO::PARAM_STR);
       $query->bindValue(":profondeur_Oeuvre", $_POST["profondeur"], PDO::PARAM_STR);
       $query->bindValue(":poids_Oeuvre", $_POST["poids"], PDO::PARAM_STR);
       $query->bindValue(":prix", $_POST["prix"], PDO::PARAM_STR);
       $query->bindValue(":etat_Oeuvre", $_POST["state"], PDO::PARAM_INT);
       $query->bindValue(":Id_Exposition", $_POST["exposition"], PDO::PARAM_INT);
       $query->bindValue(":Id_Position", $_POST["position"], PDO::PARAM_INT);
       $query->bindValue(":Id_Type", $_POST["type"], PDO::PARAM_INT);
       $query->bindValue(":Id_Artiste", $_POST["artiste"], PDO::PARAM_INT);
       $query->bindValue(":chemin_Flashcode", $flash, PDO::PARAM_STR);
       $query->execute();

       echo 'done';
       } catch (PDOException $e) {
        echo "erreur sql" . $e->getMessage();
       }
       

       
       $idOeuvre = $db->lastInsertId();

       if(!empty($_FILES['imgOeuvre']['name'])) {
        $cheminImage = '../assets/images/artwork/' . $_FILES['imgOeuvre']['name'];
        move_uploaded_file($_FILES['imgOeuvre']['tmp_name'], $cheminImage);

        $sql = "INSERT INTO image(libelle_Image, chemin_Image, Id_Oeuvres) VALUES (:libelle_Image, :chemin_Image, :Id_Oeuvre)";
        $query = $db->prepare($sql);
        $query->bindValue(":libelle_Image", $_POST['libelleImg'], PDO::PARAM_STR); 
        $query->bindValue(":chemin_Image", $_FILES['imgOeuvre']['name']); 
        $query->bindValue(":Id_Oeuvre", $idOeuvre, PDO::PARAM_INT);
        $query->execute();

        $idImage = $db->lastInsertId();
       }

   } else {
       die('oups');
   }
}

;?>
            <div id="container-princip-type">
                <div class="box-add-type">
                    <div class="close-add-type">
                        <svg id="close-type-btn" viewBox="0 0 384 512"><path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/></svg>
                    </div>
                    <div class="container-add-type">
                        <h3>Ajouter un type d'oeuvre</h3>
                        <form action="" method="POST">
                            <label for="add-type">Nom du type d'oeuvre :</label>
                            <input type="text" id="add-type" name="add-type">
                            <div class="button-add-type">
                                <button type="submit" name="submit-type" id="submit-type">Valider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 

    <form action="" method="POST" enctype="multipart/form-data">

        <div id="blur-container">

            <div class="div-libelle-add-oeuvre">
                <label for="libelle">Nom de l'oeuvre :</label>
                <input type="text" name="libelle" id="libelle" class="field-add-oeuvre">
                <span>*</span>
            </div>

            <div class="div-photo-add-oeuvre">
                <div class="container-img-oeuvre">
                    
                    <div class="image-svg-container">
                    <img id="preview-img" src="../assets/images/artwork/imgvide.webp" alt="Affiche de l'exposition" class="preview-image">  
                    </div>
                </div>
            </div>
            <div class="add-ipt">
                <span>*</span>
                <label for="imgOeuvre">Image :</label>
                <input type="file" name="imgOeuvre" id="imgOeuvre" accept="image/*" onchange="previewImage(this)">
                <input type="text" name="libelleImg" id="libelleImg" placeholder="Libellé de l'image">
            </div>
            <div class="div-infos-oeuvre">
                <div class="select-type-add-oeuvre">
                    <label for="artiste">Artiste :</label>
                    <select name="artiste" id="artiste">
                        <?php foreach($artistes as $artiste) :?>
                        <option value="<?php echo $artiste["Id_Artiste"]?>"><?php echo $artiste["Nom_Artiste"]?> <?php echo $artiste["Prenom_Artiste"]?></option>
                        <?php endforeach;?>
                    </select>
                    <span>*</span>
                    <div class="add-type-plus">
                        <a href="add-artiste.php">
                            <svg  viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
                            <span>Créer</span>
                        </a>
                    </div>
                </div>
            
                <div class="select-type-add-oeuvre">
                    <label for="type">Type d'oeuvre :</label>
                    <select name="type" id="type">
                        <?php foreach($types as $type) :?>
                        <option value="<?php echo$type["Id_Type"]?>"><?php echo $type["libelle_Type"]?></option>
                        <?php endforeach;?>
                    </select>
                    <span>*</span>
                    <div class="add-type-plus">
                        <div id="add-type-btn">
                            <svg  viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
                            <span>Créer</span>
                        </div>
                    </div>
                </div>

                <div class="select-type-add-oeuvre">
                    <label for="exposition">Exposition: </label>
                    <select name="exposition" id="exposition">
                        <?php foreach($expositions as $exposition) :?>
                        <option value="<?php echo $exposition["Id_Exposition"]?>"><?php echo $exposition["libelle_Exposition"]?></option>
                        <?php endforeach;?>
                    </select>
                    <span>*</span>
                    <div class="add-type-plus">
                        <a href="add-expo.php">
                            <svg  viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
                            <span>Créer</span>
                        </a>
                    </div>
                </div>
                <div class="select-type-add-oeuvre">
                    <label for="position">Position :</label>
                    <select name="position" id="position">
                        <?php foreach($positions as $position) :?>
                        <option value="<?php echo $position["Id_Position"]?>"><?php echo $position["libelle_Position"]?></option>
                        <?php endforeach;?>
                    </select>
                    <span>*</span>
                </div>
                
                <div class="input-dimensions multi">
                    <div class="haut-oeuvre-add position">
                        <input type="text" class="dim-add-oeuvre" name="hauteur" id="hauteur" value="" placeholder="Hauteur">
                    </div>
                    <div class="larg-oeuvre-add position">
                        <input type="text" class="dim-add-oeuvre" name="largeur" id="largeur" value="" placeholder="Largeur">
                    </div>
                    <div class="prof-oeuvre-add position">
                        <input type="text" class="dim-add-oeuvre" name="profondeur" id="profondeur" value="" placeholder="Profondeur">
                    </div>
                </div>

                <div class="input-infos-supp multi">
                    <div class="info-poids-add">
                        <input type="text"  class="dim-add-oeuvre" name="poids" id="poids" value="" placeholder="Poids">
                    </div>
                    <div class="info-prix-add">
                        <input type="text"  class="dim-add-oeuvre" name="prix" id="prix" value="" placeholder="Prix">
                    </div>
                </div>

                <div>
                    <label for="state">Livrée</label>
                    <input type="checkbox" name="state" id="state">
                </div>
                
            </div>

            <div class="btn-submit-add-oeuvre">
                <button class="button" type="submit" name="infos-submit" id="infos-submit">Valider</button>
            </div>
        </div>
    </form>

<script>

const boxAddType = document.getElementById('container-princip-type');
    const container = document.getElementById('blur-container');

    document.getElementById("add-type-btn").addEventListener('click', function () {
        boxAddType.style.display = 'block';
        container.classList.add('blur');
    });

    document.getElementById('close-type-btn').addEventListener('click', function () {
        boxAddType.style.display = 'none';
        container.classList.remove('blur');
    });
</script>

<script>
    function previewImage(input) {
        const imgElement = document.getElementById('preview-img');
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
