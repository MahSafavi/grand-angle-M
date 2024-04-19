<?php 

$id = $_GET["id"];

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

$sql = "SELECT oeuvres.Id_Oeuvres, oeuvres.libelle_Oeuvre, oeuvres.hauteur_Oeuvre, oeuvres.largeur_Oeuvre, oeuvres.profondeur_Oeuvre, oeuvres.poids_Oeuvre, oeuvres.prix, oeuvres.etat_Oeuvre, oeuvres.Id_Exposition, oeuvres.Id_Position, oeuvres.Id_Type, oeuvres.Id_Artiste, image.chemin_Image, image.libelle_Image
FROM oeuvres
JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
WHERE oeuvres.Id_Oeuvres = :id";

try {
    $requete = $db->prepare($sql);
    $requete->bindValue(":id", $id, PDO::PARAM_INT);
    $requete->execute();
    $oeuvre = $requete->fetch();
} catch (PDOException $e) {
    echo "Erreur de lors de la récupération du projet" . $e->getMessage();
}

if(isset($_POST['submit-type'])) {
    if(isset($_POST['add-type']) && !empty($_POST['add-type'])) {
        $sql = "INSERT INTO type_oeuvre(libelle_Type) VALUES(:libelle_Type)";
        $query = $db->prepare($sql);
        $query->bindValue(":libelle_Type", $_POST['add-type'], PDO::PARAM_STR);
        $query->execute();
    
        $idType = $db->lastInsertId();
    
        echo ("Done");
    } 
       
}
    

if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['infos-submit'])) {
     
    $libelleOeuvre = $_POST['libelle'];
    $img = $_FILES['imgOeuvre'];
    $libelleImg = $_POST['libelleImg'];
    $artiste = $_POST['artiste'];
    $type = $_POST['type'];
    $exposition = $_POST['exposition'];
    $position = $_POST['position'];
    $hauteur = $_POST['hauteur'];
    $profondeur = $_POST['profondeur'];
    $largeur = $_POST['largeur'];
    $poids = $_POST['poids'];
    $prix = $_POST['prix'];
    $etat = isset($_POST['state']) ? 1 : 0;
    $flash = 'flash_temp';
    $ancienneImage = $oeuvre['chemin_Image'];

if (!empty($_FILES['imgOeuvre']['name'])) {
    $cheminImage = '../assets/images/artwork/' . $_FILES['imgOeuvre']['name'];
    move_uploaded_file($_FILES['imgOeuvre']['tmp_name'], $cheminImage);

    $sql = ('UPDATE oeuvres SET oeuvres.libelle_Oeuvre = ?, oeuvres.hauteur_Oeuvre = ?, oeuvres.largeur_Oeuvre = ?, oeuvres.profondeur_Oeuvre = ?, oeuvres.poids_Oeuvre = ?, oeuvres.prix = ?, oeuvres.etat_Oeuvre = ?, oeuvres.Id_Exposition = ?, oeuvres.Id_Position = ?, oeuvres.Id_Type = ?, oeuvres.Id_Artiste = ?, oeuvres.chemin_Flashcode = ? 
    WHERE Id_Oeuvres = ?');
    try {
        $requete = $db->prepare($sql);
        $requete->execute([
            $libelleOeuvre,
            $hauteur, 
            $largeur, 
            $profondeur,
            $poids,
            $prix,
            $etat,
            $exposition, 
            $position,
            $type,
            $artiste,
            $flash, 
            $id
        ]);

        $message = "Succès de la modification";
    } catch (PDOException $e) {
        echo 'Erreur lors de la mise à jour du projet 1' . $e->getMessage();
        exit();
    }

    $sql = ('UPDATE image SET image.libelle_Image = ?, image.chemin_Image = ? WHERE Id_Oeuvres = ?');
    try {
        $requeteImg = $db->prepare($sql);
        $requeteImg->execute([
            $libelleImg,
            $_FILES['imgOeuvre']['name'],
            $id
        ]);

        $message = "Succès de la modification";

    } catch (PDOException $e) {
        echo "Erreur lors de la mise à jour de l'image" . $e->getMessage();
        exit();
    }
} else {
    $sql2 = "UPDATE oeuvres SET libelle_Oeuvre = :libelle_Oeuvre, hauteur_Oeuvre = :hauteur_Oeuvre, largeur_Oeuvre = :largeur_Oeuvre, profondeur_Oeuvre = :profondeur_Oeuvre, prix = :prix, etat_Oeuvre = :etat_Oeuvre, Id_Exposition = :Id_Exposition, Id_Position = :Id_Position, Id_Type = :Id_Type, Id_Artiste = :Id_Artiste, chemin_flashcode = :chemin_Flashcode 
    WHERE Id_Oeuvres = :Id_Oeuvre";
    try {
        $requete2 = $db->prepare($sql2);
        $requete2->execute([
            ':libelle_Oeuvre' => $libelleOeuvre,
            ':hauteur_Oeuvre' => $hauteur,
            ':largeur_Oeuvre' => $largeur,
            ':profondeur_Oeuvre' => $profondeur,
            ':prix' => $prix,
            ':etat_Oeuvre' => $etat,
            ':Id_Exposition' => $exposition,
            ':Id_Position' => $position,
            ':Id_Type' => $type, 
            ':Id_Artiste' => $artiste,
            ':chemin_Flashcode' => $flash,
            ':Id_Oeuvre' => $id
        ]);

        $message = "La mise à jour du projet a bien été effectuée";

        
    } catch (PDOException $e) {
        echo "Erreur lors de la mise à jour du projet 2" . $e->getMessage();
        exit();
    }

    $sql2 = "UPDATE image SET libelle_Image = :libelle_Image, chemin_Image = :chemin_Image
    WHERE Id_Oeuvres = :Id_Oeuvre";
    try {
        $requeteImg2 = $db->prepare($sql2);
        $requeteImg2->execute([
            ':libelle_Image' => $libelleImg,
            ':chemin_Image' => $ancienneImage,
            ':Id_Oeuvre' => $id
        ]);
    } catch (PDOException $e) {
        echo "La mise à jour a bien été effectué " . $e->getMessage();
        exit();
    }
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
                        <form method="POST">
                            <label for="add-type">Nom du type d'oeuvre :</label>
                            <input type="text" id="add-type" name="add-type">
                            <div class="button-add-type">
                                <button type="submit" id="submit-type" name="submit-type">Valider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


<form action="" method="POST" enctype="multipart/form-data">

            <div id="blur-container">

                <div class="div-libelle-add-oeuvre">
                    <label for="libelle">Nom de l'oeuvre :</label>
                    <input type="text" name="libelle" id="libelle" class="field-add-oeuvre" value="<?php echo $oeuvre["libelle_Oeuvre"]?>">
                    <span>*</span>
                </div>

                <div class="div-photo-add-oeuvre">
                    <div class="container-img-oeuvre">
                        <span>*</span>
                        <div class="image-svg-container">
                            <img src="../assets/images/artwork/<?php echo $oeuvre["chemin_Image"];?>" alt="">
                        </div>
                    </div>
                </div>
                <div>
                    <label class="svg-add-img" for="imgOeuvre">
                        <svg  viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
                    </label>
                    <input type="file" name="imgOeuvre" id="imgOeuvre" accept="image/*" onchange="previewImage(this)">
                    <input type="text" name="libelleImg" id="libelleImg" placeholder="Libellé de l'image" value="<?= $oeuvre["libelle_Image"];?>">
                </div>
                <div class="div-infos-oeuvre">
                    <div class="select-type-add-oeuvre">
                        <label for="artiste">Artiste :</label>
                        <select name="artiste" id="artiste">
                            <?php foreach($artistes as $artiste) :?>
                            <option value="<?= $artiste["Id_Artiste"]?>" <?= ($artiste["Id_Artiste"] == $oeuvre["Id_Artiste"]) ? 'selected' : ''?>><?php echo $artiste["Nom_Artiste"]?> <?php echo $artiste["Prenom_Artiste"]?></option>
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
                            <option value="<?= $type["Id_Type"]?>" <?= ($type["Id_Type"] == $oeuvre["Id_Type"]) ? 'selected' : ''?>><?= $type["libelle_Type"]?></option>
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
                            <option value="<?= $exposition["Id_Exposition"]?>" <?= ($exposition["Id_Exposition"] == $oeuvre["Id_Exposition"]) ? 'selected' : ''?>><?= $exposition["libelle_Exposition"]?></option>
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
                            <option value="<?= $position["Id_Position"]?>" <?= ($position["Id_Position"] == $oeuvre["Id_Position"]) ? 'selected' : ''?>><?= $position["libelle_Position"]?></option>
                            <?php endforeach;?>
                        </select>
                        <span>*</span>
                    </div>
                    
                    <div class="input-dimensions multi">
                        <div class="haut-oeuvre-add position">
                            <label for="hauteur">Hauteur :</label>
                            <input type="text" class="dim-add-oeuvre" name="hauteur" id="hauteur" value="<?= $oeuvre["hauteur_Oeuvre"]?>">
                        </div>
                        <div class="larg-oeuvre-add position">
                            <label for="largeur">Largeur :</label>
                            <input type="text" class="dim-add-oeuvre" name="largeur" id="largeur" value="<?= $oeuvre["largeur_Oeuvre"]?>">
                        </div>
                        <div class="prof-oeuvre-add position">
                            <label for="profondeur">Profondeur :</label>
                            <input type="text" class="dim-add-oeuvre" name="profondeur" id="profondeur" value="<?= $oeuvre["profondeur_Oeuvre"]?>">
                        </div>
                    </div>

                    <div class="input-infos-supp multi">
                        <div class="info-poids-add">
                            <label for="poids">Poids :</label>
                            <input type="text"  class="dim-add-oeuvre" name="poids" id="poids" value="<?= $oeuvre["poids_Oeuvre"]?>">
                        </div>
                        <div class="info-prix-add">
                            <label for="prix">Prix :</label>
                            <input type="text"  class="dim-add-oeuvre" name="prix" id="prix" value="<?= $oeuvre["prix"]?>">
                        </div>
                    </div>
                    
                    <div>
                        <label for="state">Livrée</label>
                        <?php if($oeuvre['etat_Oeuvre'] == 1) :?>
                            <input type="checkbox" name="state" id="state" checked>
                        <?php else :?>
                            <input type="checkbox" name="state" id="state">
                        <?php endif;?>
                    </div>
                    
                </div>

                <div class="btn-submit-add-oeuvre">
                    <input type="submit" name="infos-submit" id="infos-submit" value="Valider">
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
        const imgElement = document.getElementById('preview-image');
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
