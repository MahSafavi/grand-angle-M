<?php 

require "../config/pdo.php";

if(isset($_POST['Id_Artiste'])) {

    $artistId = $_POST['Id_Artiste'];

    $sql1 = "DELETE FROM bio_artist WHERE Id_Artiste = $artistId";
    try {
        $requete3 = $db->prepare($sql1);
        $requete3->execute();
    } catch(PDOException $e) {
        echo ('erreur 3') . $e->getMessage();
    }
    
    $sql2 = "DELETE FROM exposition WHERE Id_Artiste = $artistId";
    
    try {
        $requete = $db->prepare($sql2);
        $requete->execute();  
    } catch(PDOException $e) {
        echo ('erreur 1') . $e->getMessage();
    }

    $sql3 = "DELETE FROM oeuvres WHERE Id_Artiste = $artistId";
    try {
        $requete = $db->prepare($sql3);
        $requete->execute();  
    } catch(PDOException $e) {
        echo ('erreur 1') . $e->getMessage();
    }

    $sql4 = "DELETE FROM artiste WHERE Id_Artiste = $artistId";
    
    try {
        $requete = $db->prepare($sql4);
        $requete->execute();  
    } catch(PDOException $e) {
        echo ('erreur 1') . $e->getMessage();
    }
}

;?>