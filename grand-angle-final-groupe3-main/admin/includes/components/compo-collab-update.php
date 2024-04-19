<?php 

require_once "./../config/pdo.php";

$sqlService1 = "SELECT * FROM service ORDER BY Id_Service DESC";
  $requete = $db -> query($sqlService1);
  $services = $requete->fetchAll(PDO::FETCH_ASSOC);



 if (isset($_GET["id"])) { 
$id = $_GET["id"];
    $sql = 'SELECT *
        FROM collaborateur 
        WHERE id_Collaborateur =:id';

    try {
        $requete = $db->prepare($sql);
        $requete->bindValue(":id", $id, PDO::PARAM_INT);
        $requete->execute();
        $collabs = $requete->fetch();
    } catch (PDOException $e) {
        echo 'Erreur lors de la récupération du projet : ' . $e->getMessage();
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      if ($collabs['Id_Service'] != $_POST['service-select']) {
          
        $service_select = $_POST['service-select'];

        $sql = 'UPDATE collaborateur 
            SET Id_Service = :Id_Service 
            WHERE id_Collaborateur  = :id';

        try {
            $requete = $db->prepare($sql);
            $requete->bindParam(":Id_Service", $service_select);
            $requete->bindParam(":id", $id);
            $requete->execute();

            $message = "Succès de la modification de collaborateur";
        } catch (PDOException $e) {
            echo 'Erreur lors de la mise à jour du projet : ' . $e->getMessage();
            exit();
        }

        $nomCollab = $_POST['nom'];
        $pnomCollab = $_POST['prenom'];
        $emCollab = $_POST['email'];

        $sql = 'UPDATE collaborateur 
                SET  Nom_Collaborateur = :Nom_Collaborateur,
                prenom_Collaborateur = :prenom_Collaborateur, 
                Email_Collaborateur = :Email_Collaborateur 
                WHERE id_Collaborateur = :id';
        try {
            $requete = $db->prepare($sql);
            $requete->bindParam(":Nom_Collaborateur", $nomCollab);
            $requete->bindParam(":prenom_Collaborateur", $pnomCollab);
            $requete->bindParam(":Email_Collaborateur", $emCollab);
            $requete->bindParam(":id", $id);
            $requete->execute();
            $message = "Succès de la modification";
            //header("Location: gestion_des_collaborateurs.php");

        } catch (PDOException $e) {
            echo 'Erreur lors de la mise à jour du projet : ' . $e->getMessage();
            exit();
        }
    
} else {
    //echo 'updating is not possible!';
    //header("Location: gestion_des_collaborateurs.php");
      }
    }
} 

;?>


<form action="" method="POST" class="form-add-dirart">
    <h2 class="title-form-add-dirart">Modifier un Collaborateur  </h2>
   <div class="form-divs-artist">
     <label for="nom" >Nom du Collaborateur: </label>
   </div>
   <div class="form-divs-artist">
   <input type="text"  id="nom" class="field-add-artist"  name="nom" placeholder="" value="<?php echo $collabs['Nom_Collaborateur'];?>">
   </div>
   <div class="form-divs-artist">
     <label for="prenom" >Prenom du Collaborateur :</label>
   </div>
   <div class="form-divs-artist">
   <input type="text" id="prenom" class="field-add-artist"  name="prenom" value="<?php echo $collabs['prenom_Collaborateur'];?>" placeholder="">
   </div>

   <div class="form-divs-artist">
    <label for="email" >Email du Collaborateur : </label>
  </div>
  <div class="form-divs-artist">
  <input type="email"  id="email" class="field-add-artist"  name="email" placeholder="email@example.com" value="<?php echo $collabs['Email_Collaborateur'];?>">
  </div>
  <div class="form-divs">
      <select name="service-select" id="service-select" class="field-add-collab">
        <?php foreach($services as $servic):?>
        <option value="<?php echo $servic["Id_Service"]?>" <?php if($collabs['Id_Service'] == $servic["Id_Service"]) echo "selected"; ?>><?php echo $servic["libelle_Service"]?></option>
        <?php endforeach?>
      </select>

  </div>
<div class="form-divs-artist login-input" >
  <input  type="submit" name="submit" class="input-sub-add-collab" value="Mettre à jour">
</div>

</div>
 </form>