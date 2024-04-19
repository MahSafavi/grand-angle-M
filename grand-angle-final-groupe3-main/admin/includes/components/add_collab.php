<?php

require_once "../config/pdo.php";

$nom = $prenom = $email = $pass= $service ='';
$errors = array('nom'=>'','prenom'=>'','email'=>'','pass'=>'','service-select' =>'');

if(isset($_POST['submit'])){
  if(empty($_POST['nom'])){
  $errors['nom']= 'Le Nom est obligatoire. ';
  }
 else{ 
  $nom = $_POST['nom'];
  if(!preg_match('/^[a-zA-Z\s]+$/',$nom)){
   $errors['nom']= 'Nom doit avoir des lettres';
 }
}


if(empty($_POST['prenom'])){
   $errors['prenom']= 'Le Prenom est obligatoire.';
} else{
   $prenom = $_POST['prenom'];
   if(!preg_match('/^[a-zA-Z\s]+$/',$prenom)){
       $errors['prenom']= 'Prenom doit avoir des lettres ';
     }
}


if(empty($_POST['email'])){
   $errors['email']= "L'email est obligatoire.";
} else{
   $email = $_POST['email'];
   if(!filter_var($email,FILTER_VALIDATE_EMAIL)){
       $errors['email']= "Le format d'email n'est pas valide.";
   }
}

if(empty($_POST['service-select'])){
  $errors['service-select']= "Selectioner une Service.";
} else{
  $service=$_POST["service-select"];
}

if(empty($_POST['pass'])){
   $errors['pass']= 'Mot de passe obligatoire';
} else{
  $pass = password_hash($_POST["pass"], PASSWORD_ARGON2ID);
}
  

if(!array_filter($errors)){
  
    $sqlService = "SELECT Id_Service,libelle_Service FROM service WHERE libelle_Service = :libelle_Service";
    $queryService = $db->prepare($sqlService);
    $queryService->bindParam(":libelle_Service", $_POST["service-select"], PDO::PARAM_STR);
    $queryService->execute();
    $row = $queryService->fetch(PDO::FETCH_ASSOC);
    $id_service = $row['Id_Service'];

    

    $roles = json_encode(["USER"]);
        $sqlCollab = "INSERT INTO collaborateur (Nom_Collaborateur,prenom_Collaborateur,Email_Collaborateur , Pass_Collaborateur,Id_service, roles) VALUES (:Nom_Collaborateur,:prenom_Collaborateur,:Email_Collaborateur , :Pass_Collaborateur,:Id_Service, :roles)";
        $queryCollab = $db->prepare($sqlCollab);
        $queryCollab->bindValue(":Nom_Collaborateur", $nom, PDO::PARAM_STR);
        $queryCollab->bindValue(":prenom_Collaborateur", $prenom , PDO::PARAM_STR);
        $queryCollab->bindValue(":Email_Collaborateur", $email);
        $queryCollab->bindValue(":Pass_Collaborateur", $pass, PDO::PARAM_STR);
        $queryCollab->bindValue(":Id_Service", $service, PDO::PARAM_INT);
        $queryCollab->bindValue(":Id_Service", $id_service, PDO::PARAM_INT);
        $queryCollab->bindValue(":roles", $roles, PDO::PARAM_STR);
        $queryCollab->execute();
        $id_collab = $db->lastInsertId();

        echo "Le collaborateur a bien été ajouté.";
} else{
  echo "";
}
}
$sqlService1 = "SELECT Id_Service,libelle_Service FROM service
ORDER BY Id_Service DESC";
$requete = $db -> query($sqlService1);
$services = $requete->fetchAll(PDO::FETCH_ASSOC);
 
 $error= array('creat-service'=>'');
 if(isset($_POST['valid'])){
   if(empty($_POST['creat-service'])){
   $error['creat-service']= 'Le Nom du service est obligatoire. ';
   }else{ 
   $servicee = $_POST['creat-service'];
   if(!preg_match('/^[a-zA-Z\s]+$/', $servicee)){
    $error['creat-service']= 'Le Nom du service est obligatoire.';
  }
 }
    
 if(!array_filter($error)){
   
     $sqlAddService = "INSERT INTO service  (libelle_Service) VALUES (:libelle_Service)";
     $queryAddService = $db->prepare( $sqlAddService);
     $queryAddService->bindValue(":libelle_Service", $servicee, PDO::PARAM_STR);
     $queryAddService->execute();
     $id_s = $db->lastInsertId();
         echo "Post inserted successfully!";
 } else{
   echo " ";
 }
 } 
   
?>

<div class="add-collab-contain">
      <form action="" method="POST" class="add-collab">
        <h2 class="title-form">Ajouter un collaborateur</h2>
        <div class="form-divs">
          <label for="nom">Nom :</label>
        </div>
        <div class="form-divs">
          <input type="text" id="nom" class="field-add-collab" name="nom" placeholder="Nom">
          <div class="red"><?php echo $errors['nom']; ?></div>
        </div>
        <div class="form-divs">
          <label for="prenom">Prenom :</label>
        </div>
        <div class="form-divs">
          <input type="text" id="prenom" class="field-add-collab" name="prenom" placeholder="Prenom">
          <div class="red"><?php echo $errors['prenom']; ?></div>
        </div>

        <div class="form-divs">
          <label for="service-select">Selectioner un service:</label>
        </div>

        <div class="form-divs">
          <select name="service-select" id="service-select" class="field-add-collab">
            <?php foreach($services as $servic):?>
            <option value="<?php echo $servic["libelle_Service"]?>"><?php echo $servic["libelle_Service"]?></option>
            <?php endforeach?>
          </select>
          <a href="#" >
            <svg class="plus" id="add-pup" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
              <path
                d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z" />
            </svg>
          </a>
        </div>

        <div class="form-divs">
          <label for="email">Email :</label>
        </div>
        <div class="form-divs">
          <input type="email" id="email" class="field-add-collab" name="email" placeholder="email@example.com">
          <div class="red"><?php echo $errors['email']; ?></div>
        </div>
        <div class="form-divs">
          <label for="pass">Mot De Passe :</label>
        </div>
        <div class="form-divs">
          <input type="password" class="field-add-collab" id="pass" name="pass">
        </div>
        <div class="red"><?php echo $errors['pass']; ?></div>
        <div class="form-divs login-input">
          <input type="submit" name="submit" class="input-sub-add-collab" value="Valider">
        </div>
      </form>

    <div class="service-pup">
        <div class="pup-up">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" id="close"><path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/></svg>
          <form class="form-add-service" action="" method="POST" id="service-popup">
            <h2 class="title-form">Créer un nouveau service</h2>
            <div class="form-divs">
              <label for="creat-service">Ajouter un service :</label>
            </div>
            <div class="form-divs">
              <input type="text" name="creat-service" id="creat-service" class="field-add-service" value="" placeholder="Nom du service :"/>
            </div>
            <div class="red"></div>
            <div class="login-input">
              <button type="submit" name="valid" class="valider-service" value="Valider">Valider</button>

            </div>
          </form>
        </div>
    </div> 
</div>

<script>
  document.getElementById("add-pup").addEventListener("click" , function(){
    document.querySelector(".service-pup").style.display="flex";
  })
  document.getElementById("close").addEventListener("click" , function(){
    document.querySelector(".service-pup").style.display="none";
  })


</script>


