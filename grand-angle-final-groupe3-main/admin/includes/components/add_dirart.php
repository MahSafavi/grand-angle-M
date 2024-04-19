<?php


function filtrage($data) {
  $data = stripslashes($data);
  $data = trim($data);
  $data = strip_tags($data);
  $data = htmlspecialchars($data);
  return $data;
}

$nom = $prenom = $email = $tel ='';
$errors = array('nom'=>'','prenom'=>'','email'=>'','tel'=>'');

if(isset($_POST['submit'])){
  if(empty($_POST['nom'])){
  $errors['nom']= 'Le Nom est obligatoire. ';
  }elseif(strlen($_POST['nom']) >= 50){
    $errors['nom']= 'Le Nom est trop longe ! ';
  }
 else{ 
  $nom = $_POST['nom'];
  if(!preg_match('/^[a-zA-Z\s]+$/',$nom)){
   $errors['nom']= 'Nom doit avoir des lettres';
 }

}


if(empty($_POST['prenom'])){
   $errors['prenom']= 'Le Prenom est obligatoire.';
}elseif(strlen($_POST['prenom'])>=50){
  $errors['prenom']= 'Le Prenom est trop longe !';
}else{
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

if(empty($_POST['tel'])){
  $errors['tel']= "Le numero du téléphone est obligatoire.";
} else{
  $tel = $_POST['tel'];
  if(!preg_match('/^[0-9]+$/', $tel)){
      $errors['tel']= "le numero du déléphon doit contiante des chiffres !.";
  }
 
}
  

if(!array_filter($errors)){
      $nom = filtrage($nom);
      $prenom = filtrage($prenom);
      $tel = filtrage($tel);

        $sqladdDir = "INSERT INTO dirart (nom_DirArt,prenom_DirArt,email_DirArt, tel_DirArt) VALUES (:nom_DirArt,:prenom_DirArt,:email_DirArt, :tel_DirArt)";
        $queryDirArt = $db->prepare($sqladdDir);
        $queryDirArt->bindValue(":nom_DirArt", $nom, PDO::PARAM_STR);
        $queryDirArt->bindValue(":prenom_DirArt", $prenom , PDO::PARAM_STR);
        $queryDirArt->bindValue(":email_DirArt", $_POST["email"]);
        $queryDirArt->bindValue(":tel_DirArt", $tel, PDO::PARAM_STR);
        $queryDirArt->execute();
        $id_dirArt = $db->lastInsertId();

        echo "Le nouveau directeur artistique a bien été ajouté.";
} else{
  echo "L'ajout n'a pas fonctionné.";
}
}
?>

<div>
    <form action="" method="POST" class="form-add-dirart">
        <h2 class="title-form-add-dirart">Ajouter un directeur artistique  </h2>

    <div class="form-divs-artist">
        <label for="nom" >Nom du directeur artistique : <span class="star">*</span></label>
    </div>

    <div class="form-divs-artist">
        <input type="text"  id="nom" class="field-add-artist"  name="nom" placeholder="" value="<?php echo $nom;?>">
        <div class="red"><?php echo $errors['nom'];?></div>
    </div>

    <div class="form-divs-artist">
        <label for="prenom" >Prenom du directeur artistique :<span class="star">*</span></label>
    </div>

    <div class="form-divs-artist">
        <input type="text" id="prenom" class="field-add-artist"  name="prenom" value="<?php echo $prenom;?>" placeholder="">
        <div class="red"><?php echo $errors['prenom'];?></div>
    </div>

    <div class="form-divs-artist">
        <label for="email" >Email du directeur artistique : <span class="star">*</span></label>
    </div>

    <div class="form-divs-artist">
        <input type="email"  id="email" class="field-add-artist"  name="email" placeholder="email@example.com" value="<?php echo $email;?>">
        <div class="red"><?php echo $errors['email'];?></div>
    </div>

    <div class="form-divs-artist">
        <label for="tel" >Téléphone du directeur artistique : <span class="star">*</span></label>
    </div>

    <div class="form-divs-artist">
        <input type="tel"  id="tel" class="field-add-artist"  name="tel" value="<?php echo $tel;?>" >
        <div class="red"><?php echo $errors['tel'];?></div>
    </div>

    </div>
    
    <div class="form-divs-artist login-input">
        <input  type="submit" name="submit" class="input-sub-add-collab" value="Valider">
    </div>

    </form>
</div>