<?php


require_once '../config/pdo.php';

$themee="";
$error= array('create-theme'=>'');
if(isset($_POST['valid'])){
 if(empty($_POST['create-theme'])){
 $error['create-theme']= 'Le Thème du exposition est obligatoire. ';
 }else{ 
 $themee = $_POST['create-theme'];
 if(!preg_match('/^[a-zA-Z\s]+$/', $themee)){
  $error['create-theme']= 'Le Thème du exposition doit avoir des lettres.';
}
}
  
if(!array_filter($error)){
 
   $sqlAddTheme = "INSERT INTO theme_exposition (libelle_Theme) VALUES (:libelle_Theme)";
   $queryAddTheme = $db->prepare( $sqlAddTheme);
   $queryAddTheme->bindValue(":libelle_Theme",$themee , PDO::PARAM_STR);
   $queryAddTheme->execute();
   $idTheme = $db->lastInsertId();
       echo "Le thème a bien été ajouté.";
} else{
 echo "noooooo";
}
} 

  ?>
  