<?php 

$id = $_GET['id'];

$sqlfr = "SELECT Id_Langue, libelle_Langue FROM langue
WHERE Id_Langue = 1";
$requeteLangue = $db->query($sqlfr);
$langueFr = $requeteLangue->fetch();
$fr = $langueFr['Id_Langue'];

$sqlen = "SELECT Id_Langue, libelle_Langue FROM langue
WHERE Id_Langue = 2";
$requeteLangue = $db->query($sqlen);
$langueEn = $requeteLangue->fetch();
$en = $langueEn['Id_Langue'];

$sqlde = "SELECT Id_Langue, libelle_Langue FROM langue
WHERE Id_Langue = 3";
$requeteLangue = $db->query($sqlde);
$langueDe = $requeteLangue->fetch();
$de = $langueDe['Id_Langue'];

$sqlfa = "SELECT Id_Langue, libelle_Langue FROM langue
WHERE Id_Langue = 4";
$requeteLangue = $db->query($sqlfa);
$langueFa = $requeteLangue->fetch();
$fa = $langueFa['Id_Langue'];

$sqlch = "SELECT Id_Langue, libelle_Langue FROM langue
WHERE Id_Langue = 6";
$requeteLangue = $db->query($sqlch);
$langueCh = $requeteLangue->fetch();
$ch = $langueCh['Id_Langue'];


if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if(isset($_POST['fr-description-submit'])) {
        $sqlDesc = "UPDATE contenu SET contenu.description_Contenu = :description, contenu.Auteur_Contenu = :auteur, contenu.libelle_contenu = :libelle
        WHERE contenu.Id_Oeuvres = :id_oeuvre
        AND contenu.Id_langue = :id_langue";
        try{
            $requeteDesc = $db->prepare($sqlDesc);
            $requeteDesc->bindValue(":id_oeuvre", $id, PDO::PARAM_INT);
            $requeteDesc->bindValue(":id_langue", $fr, PDO::PARAM_INT);
            $requeteDesc->bindValue(":description", $_POST['descriptionFr'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":libelle", $_POST['libelleContenuFr'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":auteur", $_POST['auteurFr'], PDO::PARAM_STR);
            $requeteDesc->execute();
    

        } catch (PDOException $e){
            echo 'erreur' . $e->getMessage();
            exit();
        }

    } elseif (isset($_POST['en-description-submit'])) {
        $sqlDesc = "UPDATE contenu SET contenu.description_Contenu = :description, contenu.Auteur_Contenu = :auteur, contenu.libelle_contenu = :libelle
        WHERE contenu.Id_Oeuvres = :id_oeuvre
        AND contenu.Id_langue = :id_langue";
        try{
           $requeteDesc = $db->prepare($sqlDesc);
            $requeteDesc->bindValue(":id_oeuvre", $id, PDO::PARAM_INT);
            $requeteDesc->bindValue(":id_langue", $en, PDO::PARAM_INT);
            $requeteDesc->bindValue(":description", $_POST['descriptionEn'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":libelle", $_POST['libelleContenuEn'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":auteur", $_POST['auteurEn'], PDO::PARAM_STR);
            $requeteDesc->execute();
        } catch (PDOException $e){
            echo 'erreur' . $e->getMessage();
            exit();
        }
        
        
    } elseif (isset($_POST['de-description-submit'])) {
        $sqlDesc = "UPDATE contenu SET contenu.description_Contenu = :description, contenu.Auteur_Contenu = :auteur, contenu.libelle_contenu = :libelle
        WHERE contenu.Id_Oeuvres = :id_oeuvre
        AND contenu.Id_langue = :id_langue";
        try{
            $requeteDesc = $db->prepare($sqlDesc);
            $requeteDesc->bindValue(":id_oeuvre", $id, PDO::PARAM_INT);
            $requeteDesc->bindValue(":id_langue", $de, PDO::PARAM_INT);
            $requeteDesc->bindValue(":description", $_POST['descriptionDe'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":libelle", $_POST['libelleContenuDe'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":auteur", $_POST['auteurDe'], PDO::PARAM_STR);
            $requeteDesc->execute();
        } catch (PDOException $e){
            echo 'erreur' . $e->getMessage();
            exit();
        }
    } elseif (isset($_POST['fa-description-submit'])) {
        $sqlDesc = "UPDATE contenu SET contenu.description_Contenu = :description, contenu.Auteur_Contenu = :auteur, contenu.libelle_contenu = :libelle
        WHERE contenu.Id_oeuvre = :id_oeuvre
        AND contenu.Id_langue = :id_langue";
        try{
            $requeteDesc = $db->prepare($sqlDesc);
            $requeteDesc->bindValue(":id_oeuvre", $id, PDO::PARAM_INT);
            $requeteDesc->bindValue(":id_langue", $fa, PDO::PARAM_INT);
            $requeteDesc->bindValue(":description", $_POST['descriptionFa'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":libelle", $_POST['libelleContenuFa'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":auteur", $_POST['auteurFa'], PDO::PARAM_STR);
            $requeteDesc->execute();
        } catch (PDOException $e){
            echo 'erreur' . $e->getMessage();
            exit();
        }
        
    } elseif (isset($_POST['ch-description-submit'])) {
        $sqlDesc = "UPDATE contenu SET contenu.description_Contenu = :description, contenu.Auteur_Contenu = :auteur, contenu.libelle_contenu = :libelle
        WHERE contenu.Id_Oeuvres = :id_oeuvre
        AND contenu.Id_langue = :id_langue";
        try{
            $requeteDesc = $db->prepare($sqlDesc);
            $requeteDesc->bindValue(":id_oeuvre", $id, PDO::PARAM_INT);
            $requeteDesc->bindValue(":id_langue", $ch, PDO::PARAM_INT);
            $requeteDesc->bindValue(":description", $_POST['descriptionCh'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":libelle", $_POST['libelleContenuCh'], PDO::PARAM_STR);
            $requeteDesc->bindValue(":auteur", $_POST['auteurCh'], PDO::PARAM_STR);
            $requeteDesc->execute();
        } catch (PDOException $e){
            echo 'erreur' . $e->getMessage();
            exit();
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

<div class="btn-update-description">
    <div id="fr-btn" class="btn-langue">
        <button>Français</button>
    </div>
    <div id="en-btn" class="btn-langue">
        <button>Anglais</button>
    </div>
    <div id="de-btn" class="btn-langue">
        <button>Allemand</button>
    </div>
    <div id="fa-btn" class="btn-langue">
        <button>Farsi</button>
    </div>
    <div id="ch-btn" class="btn-langue">
        <button>Chinois</button>
    </div>
</div>

<div class="update-description-by-btn">
    <div class="composant">
        <?php include "includes/components/fr-desc.php";?>
    </div>

    <div class="composant">
        <?php include "includes/components/en-desc.php";?>
    </div>

    <div class="composant">
        <?php include "includes/components/de-desc.php";?>
    </div>

    <div class="composant">
        <?php include "includes/components/fa-desc.php";?>
    </div>

    <div class="composant">
        <?php include "includes/components/ch-desc.php";?>
    </div>
</div>


<script>

    const divFr = document.querySelector('.fr');
    const divEn = document.querySelector('.en');
    const divDe = document.querySelector('.de');
    const divFa = document.querySelector('.fa');
    const divCh = document.querySelector('.ch');

   document.addEventListener("DOMContentLoaded", function() {
        divEn.style.display = 'none';
        divDe.style.display = 'none';
        divFa.style.display = 'none';
        divCh.style.display = 'none';
        divFr.style.display = 'block';
    }) 

    const btnFr = document.getElementById('fr-btn')
    btnFr.addEventListener('click', function () {
        divEn.style.display = 'none';
        divDe.style.display = 'none';
        divFa.style.display = 'none';
        divCh.style.display = 'none';
        divFr.style.display = 'block';
    })

    const btnEn = document.getElementById('en-btn')
    btnEn.addEventListener('click', function () {
        divEn.style.display = 'block';
        divDe.style.display = 'none';
        divFa.style.display = 'none';
        divCh.style.display = 'none';
        divFr.style.display = 'none';
    })

    const btnDe = document.getElementById('de-btn')
    btnDe.addEventListener('click', function () {
        divEn.style.display = 'none';
        divDe.style.display = 'block';
        divFa.style.display = 'none';
        divCh.style.display = 'none';
        divFr.style.display = 'none';
    })

    const btnFa = document.getElementById('fa-btn')
    btnFa.addEventListener('click', function () {
        divEn.style.display = 'none';
        divDe.style.display = 'none';
        divFa.style.display = 'block';
        divCh.style.display = 'none';
        divFr.style.display = 'none';
    })

    const btnCh = document.getElementById('ch-btn')
    btnCh.addEventListener('click', function () {
        divEn.style.display = 'none';
        divDe.style.display = 'none';
        divFa.style.display = 'none';
        divCh.style.display = 'block';
        divFr.style.display = 'none';
    })


</script>