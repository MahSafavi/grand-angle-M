<?php

session_start();

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";

$title = "Générer un QR Code";

require_once '../config/pdo.php';

$url = $nom = $noma = $prenom = '';
$errors = array('nom' => '', 'prenom' => '', 'noma' => '');

if (isset($_POST['submit'])) {
    if (empty($_POST['nom'])) {
        $errors['nom'] = "Le Nom de l'oeuvre est obligatoire. ";
    } else {
        $nom = $_POST['nom'];
    }

    if (empty($_POST['noma'])) {
        $errors['noma'] = "Le Nom de l'artiste est obligatoire. ";
    } else {
        $noma = $_POST['noma'];
    }

    if (empty($_POST['prenom'])) {
        $errors['prenom'] = "Le prenom de l'artiste est obligatoire. ";
    } else {
        $prenom = $_POST['prenom'];
    }

    if (!array_filter($errors)) {


$sqlART ="SELECT * FROM artiste WHERE  Nom_Artiste = :noma AND Prenom_Artiste = :prenom";

        $queryArt = $db->prepare($sqlART);
        $queryArt->bindParam(':noma', $noma);
        $queryArt->bindParam(':prenom', $prenom);
        $queryArt->execute();
        $art = $queryArt->fetch(PDO::FETCH_ASSOC);
        $id_art = $art['Id_Artiste'];


        $sqlqrcode = "SELECT * FROM oeuvres WHERE libelle_Oeuvre = :nom AND Id_Artiste = $id_art";
        $queryQR = $db->prepare($sqlqrcode);
        $queryQR->bindParam(':nom', $nom);
        $queryQR->execute();

    
        $ov= $queryQR->fetch(PDO::FETCH_ASSOC);
        $id_ov = $ov['Id_Oeuvres'];

        $url = "http://localhost:8888/fusion-grand-angle/public/descriptionOeuvre.php?id=$id_ov&lang=FR";

    } else {
        echo "noooooo";
    }
}
?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="class="art-contain-by-btn"">
    <div class="sizing-qr"> 
        <form action="" method="POST" class="hide-on-print">
            <h2 class="title-form-add-dirart">Génerer un QR Code: </h2>
            <div class="form-divs-artist">
                <label for="nom" >Nom de l'oeuvre: <span class="star">*</span></label>
            </div>
            <div class="form-divs-artist">
                <input type="text"  id="nom" class="field-add-artist"  name="nom" value="<?php echo $nom;?>">
                <div class="red"><?php echo $errors['nom'];?></div>
            </div>
            <div class="form-divs-artist">
                <label for="noma" >Nom de l'artiste: <span class="star">*</span></label>
            </div>
            <div class="form-divs-artist">
                <input type="text"  id="noma" class="field-add-artist"  name="noma" value="<?php echo $noma;?>">
                <div class="red"><?php echo $errors['noma'];?></div>
            </div>
            <div class="form-divs-artist">
                <label for="prenom" >Prenom de l'artiste:<span class="star">*</span></label>
            </div>
            <div class="form-divs-artist">
                <input type="text" id="prenom" class="field-add-artist"  name="prenom" value="<?php echo $prenom;?>" placeholder="">
                <div class="red"><?php echo $errors['prenom'];?></div>
            </div>
            <div class="form-divs-artist login-input" >
                <input class="button" type="submit" name="submit" class="" value="Valider">
            </div>
        </form>  
        <div class="qr-container hide-on-print">
            <p>Entrer une URL ou remplir les informations et cliquer sur valider</p>
            <input type="text" placeholder="URL" id="qrText" value="<?= $url; ?>">
        </div>

        <div id="imgBox">
            <img src="" id="qrImage">
        </div>
 
        <div class="hide-on-print">
            <button class="button" type="button" id="generateBtn">Générer QR code</button>
            <button class="button" id="btnPrint">Imprimer</button>
        </div>
    </div>
 </div> 

<script>
let imgBox = document.getElementById("imgBox");
let qrImage = document.getElementById("qrImage");
let qrText = document.getElementById("qrText");
let generateBtn = document.getElementById("generateBtn");

generateBtn.addEventListener("click", generateQR);

function generateQR() {
    if (qrText.value.length > 0) {
        qrImage.src = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" + encodeURIComponent(qrText.value);
        imgBox.classList.add("show-img");
        saveQRCode(qrImage.src);
    } else {
        qrText.classList.add('error');
        setTimeout(() => {
            qrText.classList.remove('error');
        }, 1000);
    }
}

document.getElementById("btnPrint").addEventListener("click", function() {   window.print(); });
</script>



