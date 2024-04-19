<?php 

require "../config/pdo.php";

if(isset($_POST['Id_Oeuvres'])) {

    $oeuvreId = $_POST['Id_Oeuvres'];

    $sql2 = "DELETE FROM image WHERE Id_Oeuvres = $oeuvreId";
    try {
        $requete2 = $db->prepare($sql2);
        $requete2->execute(); 
    } catch(PDOException $e) {
        echo ('erreur 2') . $e->getMessage();
    }

    $sql3 = "DELETE FROM contenu WHERE Id_Oeuvres = $oeuvreId";
    try {
        $requete3 = $db->prepare($sql3);
        $requete3->execute();
    } catch(PDOException $e) {
        echo ('erreur 3') . $e->getMessage();
    }

    $sql = "DELETE FROM oeuvres WHERE Id_Oeuvres = $oeuvreId";
    try {
        $requete = $db->prepare($sql);
        $requete->execute();  
    } catch(PDOException $e) {
        echo ('erreur 1') . $e->getMessage();
    }
    
}

;?>