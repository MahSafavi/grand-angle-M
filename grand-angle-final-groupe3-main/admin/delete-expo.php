<?php 

require "../config/pdo.php";

if(isset($_POST['Id_Exposition'])) {

    $expoId = $_POST['Id_Exposition'];

    $sql1 = "DELETE FROM oeuvres WHERE Id_Exposition = $expoId ";
    try {
        $requete3 = $db->prepare($sql1);
        $requete3->execute();
    } catch(PDOException $e) {
        echo ('erreur 3') . $e->getMessage();
    }
    
    $sql2 = "DELETE FROM exposition WHERE Id_Exposition =$expoId";
    
    try {
        $requete = $db->prepare($sql2);
        $requete->execute();  
    } catch(PDOException $e) {
        echo ('erreur 1') . $e->getMessage();
    }
  }

;?>