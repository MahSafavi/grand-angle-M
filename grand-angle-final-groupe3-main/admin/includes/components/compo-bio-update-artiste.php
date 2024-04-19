<?php 

require_once "../config/pdo.php";

$id = $_GET['id'];

$sqlArtConc = "SELECT * FROM artiste
WHERE artiste.Id_Artiste = :Id_Artiste";
try {
    $queryArtConc = $db->prepare($sqlArtConc);
    $queryArtConc->bindValue(":Id_Artiste", $id, PDO::PARAM_INT);
    $queryArtConc->execute();
    $artisteConc = $queryArtConc->fetch();
} catch (PDOException $e) {
    echo 'erreur sql' . $e->getMessage();
}

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

$sqlBioFr = "SELECT bio_artist.description_artist, bio_artist.chemin_Imgart, bio_artist.Id_Langue, bio_artist.Id_Artiste
FROM bio_artist
WHERE bio_artist.Id_Artiste = :Id_Artiste
AND bio_artist.Id_Langue = :Id_Langue";
$requeteBioFr = $db->prepare($sqlBioFr);
$requeteBioFr->bindValue(":Id_Artiste", $id, PDO::PARAM_INT);
$requeteBioFr->bindValue(":Id_Langue", $fr, PDO::PARAM_INT);
$requeteBioFr->execute();
$bioFr = $requeteBioFr->fetch();


$ancienneImageFr = $bioFr['chemin_Imgart'];

$sqlBioEn = "SELECT bio_artist.description_artist, bio_artist.chemin_Imgart, bio_artist.Id_Langue, bio_artist.Id_Artiste
FROM bio_artist
WHERE bio_artist.Id_Artiste = :Id_Artiste
AND bio_artist.Id_Langue = :Id_Langue";
$requeteBioEn = $db->prepare($sqlBioEn);
$requeteBioEn->bindValue(":Id_Artiste", $id, PDO::PARAM_INT);
$requeteBioEn->bindValue(":Id_Langue", $en, PDO::PARAM_INT);
$requeteBioEn->execute();
$bioEn = $requeteBioEn->fetch();

$ancienneImageEn = $bioEn['chemin_Imgart'];

$sqlBioFa = "SELECT bio_artist.description_artist, bio_artist.chemin_Imgart, bio_artist.Id_Langue, bio_artist.Id_Artiste
FROM bio_artist
WHERE bio_artist.Id_Artiste = :Id_Artiste
AND bio_artist.Id_Langue = :Id_Langue";
$requeteBioFa = $db->prepare($sqlBioFa);
$requeteBioFa->bindValue(":Id_Artiste", $id, PDO::PARAM_INT);
$requeteBioFa->bindValue(":Id_Langue", $fa, PDO::PARAM_INT);
$requeteBioFa->execute();
$bioFa = $requeteBioFa->fetch();

$ancienneImageFa = $bioFa['chemin_Imgart'];

$sqlBioDe = "SELECT bio_artist.description_artist, bio_artist.chemin_Imgart, bio_artist.Id_Langue, bio_artist.Id_Artiste
FROM bio_artist
WHERE bio_artist.Id_Artiste = :Id_Artiste
AND bio_artist.Id_Langue = :Id_Langue";
$requeteBioDe = $db->prepare($sqlBioDe);
$requeteBioDe->bindValue(":Id_Artiste", $id, PDO::PARAM_INT);
$requeteBioDe->bindValue(":Id_Langue", $de, PDO::PARAM_INT);
$requeteBioDe->execute();
$bioDe = $requeteBioDe->fetch();

$ancienneImageDe = $bioDe['chemin_Imgart'];

$sqlBioCh = "SELECT bio_artist.description_artist, bio_artist.chemin_Imgart, bio_artist.Id_Langue, bio_artist.Id_Artiste
FROM bio_artist
WHERE bio_artist.Id_Artiste = :Id_Artiste
AND bio_artist.Id_Langue = :Id_Langue";
$requeteBioCh = $db->prepare($sqlBioCh);
$requeteBioCh->bindValue(":Id_Artiste", $id, PDO::PARAM_INT);
$requeteBioCh->bindValue(":Id_Langue", $ch, PDO::PARAM_INT);
$requeteBioCh->execute();
$bioCh = $requeteBioCh->fetch();

$ancienneImageCh = $bioCh['chemin_Imgart'];


if($_SERVER['REQUEST_METHOD'] == 'POST') {

    if(isset($_POST['submit-bio-fr'])) {

        if(!empty($_FILES['photo-artiste-fr']['name'])) {
            $img = $_FILES['photo-artiste-fr']['name'];
            $cheminImage = '../assets/images/img-artiste/' . $_FILES['photo-artiste-fr']['name'];
            move_uploaded_file($_FILES['photo-artiste-fr']['tmp_name'], $cheminImage);
            
            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = ?, bio_artist.chemin_Imgart = ?
            WHERE bio_artist.Id_Artiste = ?
            AND bio_artist.Id_Langue = ?";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->execute([
                    $_POST['bio-fr'],
                    $img,
                    $id, 
                    $fr
                ]);
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Français'" . $e->getMessage();
                exit();
            }
        } else {
            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = :bio, bio_artist.chemin_Imgart = :imageArt
            WHERE bio_artist.Id_Artiste = :Id_Artiste
            AND bio_artist.Id_Langue = :Id_Langue";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->bindValue(":bio", $_POST['bio-fr'], PDO::PARAM_STR);
                $requeteBio->bindValue(":imageArt", $ancienneImageFr, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Langue", $fr, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Artiste", $id, PDO::PARAM_STR);
                $requeteBio->execute();
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Français'" . $e->getMessage();
                exit();
        }
        }

    } elseif(isset($_POST['submit-bio-en'])) {
        if(!empty($_FILES['photo-artiste-en']['name'])) {
        $img = $_FILES['photo-artiste-en']['name'];
        $cheminImage = '../assets/images/img-artiste/' . $_FILES['photo-artiste-fr']['name'];
        move_uploaded_file($_FILES['photo-artiste-en']['tmp_name'], $cheminImage);

        $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = ?, bio_artist.chemin_Imgart = ?
        WHERE bio_artist.Id_Artiste = ?
        AND bio_artist.Id_Langue = ?";
        try {
            $requeteBio = $db->prepare($sqlBio);
            $requeteBio->execute([
                $_POST['bio-en'],
                $img,
                $id, 
                $en
            ]);
        } catch (PDOException $e){
            echo "Erreur de la modification langue 'Anglais'" . $e->getMessage();
            exit();
        }
    } else {
        $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = :bio, bio_artist.chemin_Imgart = :imageArt
        WHERE bio_artist.Id_Artiste = :Id_Artiste
        AND bio_artist.Id_Langue = :Id_Langue";
        try {
            $requeteBio = $db->prepare($sqlBio);
            $requeteBio->bindValue(":bio", $_POST['bio-en'], PDO::PARAM_STR);
            $requeteBio->bindValue(":imageArt", $ancienneImageEn, PDO::PARAM_STR);
            $requeteBio->bindValue(":Id_Langue", $en, PDO::PARAM_STR);
            $requeteBio->bindValue(":Id_Artiste", $id, PDO::PARAM_STR);
            $requeteBio->execute();
        } catch (PDOException $e){
            echo "Erreur de la modification langue 'Anglais'" . $e->getMessage();
            exit();
        }
    }
        
    } elseif(isset($_POST['submit-bio-fa'])) {

        if(!empty($_FILES['photo-artiste-fa']['name'])) {
            $img = $_FILES['photo-artiste-fa']['name'];
            $cheminImage = '../assets/images/img-artiste/' . $_FILES['photo-artiste-fr']['name'];
            move_uploaded_file($_FILES['photo-artiste-fa']['tmp_name'], $cheminImage);

            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = ?, bio_artist.chemin_Imgart = ?
            WHERE bio_artist.Id_Artiste = ?
            AND bio_artist.Id_Langue = ?";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->execute([
                    $_POST['bio-fa'],
                    $img,
                    $id, 
                    $fa
                ]);
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Farsi'" . $e->getMessage();
                exit();
            }

        } else {
            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = :bio, bio_artist.chemin_Imgart = :imageArt
            WHERE bio_artist.Id_Artiste = :Id_Artiste
            AND bio_artist.Id_Langue = :Id_Langue";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->bindValue(":bio", $_POST['bio-fa'], PDO::PARAM_STR);
                $requeteBio->bindValue(":imageArt", $ancienneImageFa, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Langue", $fa, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Artiste", $id, PDO::PARAM_STR);
                $requeteBio->execute();
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Farsi'" . $e->getMessage();
                exit();
            }
        }

    } elseif(isset($_POST['submit-bio-de'])) {

        if(!empty($_FILES['photo-artiste-de']['name'])) {
            $img = $_FILES['photo-artiste-de']['name'];
            $cheminImage = '../assets/images/img-artiste/' . $_FILES['photo-artiste-fr']['name'];
            move_uploaded_file($_FILES['photo-artiste-de']['tmp_name'], $cheminImage);

            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = ?, bio_artist.chemin_Imgart = ?
            WHERE bio_artist.Id_Artiste = ?
            AND bio_artist.Id_Langue = ?";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->execute([
                    $_POST['bio-de'],
                    $img,
                    $id, 
                    $de
                ]);
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Allemand'" . $e->getMessage();
                exit();
            }

        } else {
            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = :bio, bio_artist.chemin_Imgart = :imageArt
            WHERE bio_artist.Id_Artiste = :Id_Artiste
            AND bio_artist.Id_Langue = :Id_Langue";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->bindValue(":bio", $_POST['bio-de'], PDO::PARAM_STR);
                $requeteBio->bindValue(":imageArt", $ancienneImageDe, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Langue", $de, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Artiste", $id, PDO::PARAM_STR);
                $requeteBio->execute();
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Allemand'" . $e->getMessage();
                exit();
            }
        }

    } elseif(isset($_POST['submit-bio-ch'])) {

        if(!empty($_FILES['photo-artiste-ch']['name'])) {
            $img = $_FILES['photo-artiste-ch']['name'];
            $cheminImage = '../assets/images/img-artiste/' . $_FILES['photo-artiste-fr']['name'];
            move_uploaded_file($_FILES['photo-artiste-ch']['tmp_name'], $cheminImage);

            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = ?, bio_artist.chemin_Imgart = ?
            WHERE bio_artist.Id_Artiste = ?
            AND bio_artist.Id_Langue = ?";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->execute([
                    $_POST['bio-ch'],
                    $img,
                    $id, 
                    $ch
                ]);
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Chinois'" . $e->getMessage();
                exit();
            }

        } else {
            $sqlBio = "UPDATE bio_artist SET bio_artist.description_artist = :bio, bio_artist.chemin_Imgart = :imageArt
            WHERE bio_artist.Id_Artiste = :Id_Artiste
            AND bio_artist.Id_Langue = :Id_Langue";
            try {
                $requeteBio = $db->prepare($sqlBio);
                $requeteBio->bindValue(":bio", $_POST['bio-ch'], PDO::PARAM_STR);
                $requeteBio->bindValue(":imageArt", $ancienneImageCh, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Langue", $ch, PDO::PARAM_STR);
                $requeteBio->bindValue(":Id_Artiste", $id, PDO::PARAM_STR);
                $requeteBio->execute();
            } catch (PDOException $e){
                echo "Erreur de la modification langue 'Chinois'" . $e->getMessage();
                exit();
            }
        }
    }
}

;?>

<div class="bio-artiste-add">
        <div class="btn-update-description spe-add-artiste">
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
                <?php include "includes/components/fr-bio.php";?>
            </div>

            <div class="composant">
                <?php include "includes/components/en-bio.php";?>
            </div>

            <div class="composant">
                <?php include "includes/components/de-bio.php";?>
            </div>

            <div class="composant">
                <?php include "includes/components/fa-bio.php";?>
            </div>

            <div class="composant">
                <?php include "includes/components/ch-bio.php";?>
            </div>
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