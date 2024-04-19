<?php 

require "../config/pdo.php";

if(isset($_POST['id_Collaborateur'])) {

    $collabId = $_POST['id_Collaborateur'];

    $sql = "DELETE FROM collaborateur WHERE id_Collaborateur = :collabId"; 
    try {
        $requete = $db->prepare($sql);
        $requete->bindParam(":collabId", $collabId, PDO::PARAM_INT);
        $requete->execute();
        echo "Collaborateur supprimé avec succès.";
    } catch(PDOException $e) {
        echo "Erreur lors de la suppression du collaborateur : " . $e->getMessage();
    }


  }

;?>