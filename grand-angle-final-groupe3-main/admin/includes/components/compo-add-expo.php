<?php 

function filtrage($data) {
  $data = stripslashes($data);
  $data = trim($data);
  $data = strip_tags($data);
  $data = htmlspecialchars($data);
  return $data;
}

  $sqlSelectTheme = "SELECT * FROM theme_exposition ORDER BY libelle_Theme";
  $requete1 = $db -> query($sqlSelectTheme);
  $themes = $requete1->fetchAll(PDO::FETCH_ASSOC);



  $sqlSelectArtiste = "SELECT * FROM artiste ORDER BY Nom_Artiste";
  $requete2 = $db -> query($sqlSelectArtiste);
  $artistes = $requete2->fetchAll(PDO::FETCH_ASSOC);

  $libelle_expo = $date_debut = $date_fin = $time_start= $time_fin ='';
  $errors = array('libelle_expo'=>'','date_debut'=>'','date_fin'=>'','time_start'=>'','time_fin' =>'');
  
  if(isset($_POST['submit'])){
    if(empty($_POST['libelle_expo'])){
      $errors['libelle_expo']= "Le Nom de l'exposition est obligatoire.";
      }elseif(strlen($_POST['libelle_expo']) >= 250){
        $errors['libelle_expo']= "Le Nom de l'exposition est trop longue ! ";
      }
     else{ 
      $libelle_expo = $_POST['libelle_expo'];
     }
  
      if(empty($_POST['date_debut'])){
        $errors['date_debut']= 'Le date debut est obligatoire.';
      }else{
        $date_debut = $_POST['date_debut'];
      }
  
      if(empty($_POST['date_fin'])){
      $errors['date_fin']= 'Le date fin est obligatoire.';
      }else{
        $date_fin = $_POST['date_fin'];
      }

      if(empty($_POST['time_start'])){
    $errors['time_start']= "L'horaire de début est obligatoire.";
     }else{
      $time_debut = $_POST['time_start'];
      }

     if(empty($_POST['time_fin'])){
      $errors['time_fin']= "L'Horaire de fin est obligatoire.";
      }else{
       $time_fin = $_POST['time_fin'];
      }
 
      $plan = $teaser = '';

      if (isset($_FILES['plan_upload']) && $_FILES['plan_upload']['error'] === UPLOAD_ERR_OK) {
          $plan_path = '../assets/images/plan' . $_FILES['plan_upload']['name'];
          move_uploaded_file($_FILES['plan_upload']['tmp_name'], $plan_path);
          $plan = $_FILES['plan_upload']['name'];
      }
  
      if (isset($_FILES['teaser_upload']) && $_FILES['teaser_upload']['error'] === UPLOAD_ERR_OK) {
          $teaser_path = '../assets/images/plan' . $_FILES['teaser_upload']['name'];
          move_uploaded_file($_FILES['teaser_upload']['tmp_name'], $teaser_path);
          $teaser = $_FILES['teaser_upload']['name'];
      }

  
  if(!array_filter($errors)){

      $sqlTheme = "SELECT Id_Theme,libelle_Theme FROM theme_exposition WHERE libelle_Theme = :libelle_Theme";
      $queryTheme = $db->prepare($sqlTheme);
      $queryTheme->bindParam(":libelle_Theme", $_POST["theme_select"], PDO::PARAM_STR);
      $queryTheme->execute();
      $row = $queryTheme->fetch(PDO::FETCH_ASSOC);
      $id_theme = $row['Id_Theme']; 


      $sqlArtiste = "SELECT * FROM artiste WHERE Nom_Artiste = :Nom_Artiste";
      $queryArtiste = $db->prepare($sqlArtiste);
      $queryArtiste->bindValue(":Nom_Artiste", $_POST['artist_select'], PDO::PARAM_STR);
      $queryArtiste->execute();
      $art = $queryArtiste->fetch(PDO::FETCH_ASSOC);
      $id_artiste = $art['Id_Artiste'];

          $sqlExpo = "INSERT INTO exposition (libelle_Exposition,Date_Debut,Date_Fin , Horaires_Debut,Horaires_Fin,chemin_Plan,chemin_Affiche,Id_Artiste,id_Theme ) VALUES (:libelle_Exposition,:Date_Debut,:Date_Fin ,:Horaires_Debut,:Horaires_Fin,:chemin_Plan,:chemin_Affiche,:Id_Artiste,:id_Theme )";
          $queryEXPO = $db->prepare($sqlExpo);
          $queryEXPO->bindValue(":libelle_Exposition", $libelle_expo, PDO::PARAM_STR);
          $queryEXPO->bindValue(":Date_Debut", $date_debut, PDO::PARAM_STR);
          $queryEXPO->bindValue(":Date_Fin", $date_fin , PDO::PARAM_STR);
          $queryEXPO->bindValue(":Horaires_Debut", $time_debut, PDO::PARAM_STR);
          $queryEXPO->bindValue(":Horaires_Fin", $time_fin, PDO::PARAM_STR);
          $queryEXPO->bindValue(":chemin_Plan",$plan , PDO::PARAM_STR);
          $queryEXPO->bindValue(":chemin_Affiche",$teaser, PDO::PARAM_STR);
          $queryEXPO->bindValue(":Id_Artiste", $id_artiste, PDO::PARAM_INT);
          $queryEXPO->bindValue(":id_Theme", $id_theme, PDO::PARAM_INT);
          $queryEXPO->execute();
          $id_Expo = $db->lastInsertId();
  
          echo "L'ajout a bien été effectué.";
  } else{
    echo "L'ajout a échoué.";
  }

}



;?>

<div class="contain-form-add-expo">
  <div class="sroll-add-expo">
<form action="" method="POST" class="add-collab"  enctype="multipart/form-data">
    <h2 class="title-form">Ajouter une exposition</h2>
      <div class="form-divs">
      <label for="libelle_expo">Nom de l'exposition* :</label>
      </div>
      <div class="form-divs">
      <input type="text" id="libelle_expo" class="field-add-collab" name="libelle_expo" placeholder="libelle de l'exposition - prenom nom de l'artiste" value="<?php echo $libelle_expo; ?>">
      <div class="red"><?php echo $errors['libelle_expo']; ?></div>
      </div>


      <div class="form-divs">
      <label for="theme_select">Thème de l'exposition *: </label>
      </div>
      <div class="form-divs">
          <select name="theme_select" id="theme_select" class="field-select">
            <?php foreach($themes as $theme):?>
          <option value="<?php echo $theme["libelle_Theme"]?>"><?php echo $theme["libelle_Theme"]?></option>
          <?php endforeach?>
          </select>
          <a href="#" ><svg class="plus" id="add-pup" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
          <path
            d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z" />
        </svg></a>
        </div>

<div class="info-date-hour">

  <div class="dat-time">
    <div class="form-divs">
      <label for="date_debut">Date de début* :</label>
    </div>
    <div class="form-divs">
      <input type="date" id="date_debut" class="field-dh" name="date_debut" placeholder="" value="<?php echo $date_debut; ?>">
    </div>
    <div class="red"><?php echo $errors['date_debut']; ?></div>
  </div>
  
  <div class="dat-time">
    <div class="form-divs">
      <label for="date_fin">Date de fin* :</label>
    </div>
    <div class="form-divs">
      <input type="date" id="date_fin" class="field-dh" name="date_fin" placeholder="" value="<?php echo $date_fin; ?>">
    </div>
    <div class="red"><?php echo $errors['date_fin']; ?></div>
  </div>

  <div class="dat-time">
    <div class="form-divs">
      <label for="time_start">Horaires de début* :</label>
    </div>
    <div class="form-divs">
      <input type="time" id="time_start" class="field-dh" name="time_start" placeholder="" value="<?php echo $time_start; ?>">
    </div>
    <div class="red"><?php echo $errors['time_start']; ?></div>
  </div>
  <div class="dat-time">
    <div class="form-divs">
      <label for="time_fin">Horaires de fin* :</label>
    </div>
    <div class="form-divs">
      <input type="time" id="time_fin" class="field-dh" name="time_fin" placeholder="" value="<?php echo $time_fin; ?>">
    </div>
    <div class="red"><?php echo $errors['time_fin']; ?></div>
  </div>

</div>
   
<div class="form-divs">
      <label for="artist-select">Artiste* : </label>
      </div>
      <div class="form-divs">
          <select name="artist_select" id="artist_select" class="field-select">
            <?php foreach($artistes as $artiste):?>
          <option value="<?php echo $artiste['Nom_Artiste']?>"><?php echo $artiste['Nom_Artiste']." ".$artiste['Prenom_Artiste']?></option>
          <?php endforeach?>
          </select>
          <a href="add-artiste.php" ><svg class="plus" id="add-theme-pup" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
          <path
            d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z" />
          </svg></a>
      </div>

      <div class="upload-pt">
          <div class="form-divs">
            <div class="file-add ">
                <label for="plan_upload" class="lable-upload">Aperçu du plan de l'exposition :</label>
                <img id="plan_preview" src="../assets/images/exposition/imgvide.webp" alt="Plan de l'exposition" class="preview-image">
               <input type="file" id="plan_upload" name="plan_upload" accept="image/*" class="upload-expo" onchange="previewPlanImage(this)">
           </div>
          </div>
          <div class="form-divs">
              <div class="file-add ">
                <label for="teaser_upload" class="lable-upload">Aperçu de l'affiche de l'exposition :</label>
                <img id="teaser_preview" src="../assets/images/exposition/imgvide.webp" alt="Affiche de l'exposition" class="preview-image">
                <input type="file" id="teaser_upload" name="teaser_upload" accept="image/*" class="upload-expo" onchange="previewTeaserImage(this)">
              </div>  
          </div>
        </div>
        <div class="form-divs login-input">
            <input type="submit" name="submit" class="input-sub-add-collab" value="Valider">
        </div>
   
  </form>
  </div>
</div>
<?php require_once 'add-theme-expo.php' ; ?>
  <div class="theme-pup">
    <div class="pup-up">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" id="close"><path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/></svg>
      <form class="form-add-service" action="" method="POST" id="theme-popup">
        <h2 class="title-form">Créer un nouveau Thème d'expostion  </h2>
        <div class="form-divs">
          <label for="create-theme">Ajouter un Thème d'expostion :</label>
        </div>
        <div class="form-divs">
          <input type="text" name="create-theme" id="create-theme" class="field-add-service" />
        </div>
        <div class="red"><?php echo $error['create-theme'] ?></div>
        <div class="login-input">
          <button type="submit" name="valid" class="valider-theme" value="Valider">Valider</button>

        </div>
      </form>
    </div>
  </div> 

  <?php include "includes/pages/footer.php";?>

<script>
  document.getElementById("add-pup").addEventListener("click" , function(){
    document.querySelector(".theme-pup").style.display="flex";
  })
  document.getElementById("close").addEventListener("click" , function(){
    document.querySelector(".theme-pup").style.display="none";
  })


</script>

<script>
function previewPlanImage(input) {
  const planImgElement = document.getElementById('plan_preview');
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function(e) {
      planImgElement.src = e.target.result;
    }
    reader.readAsDataURL(input.files[0]); 
  } else {
    planImgElement.src = "placeholder.jpg"; 
  }
}

function previewTeaserImage(input) {
  const teaserImgElement = document.getElementById('teaser_preview');
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function(e) {
      teaserImgElement.src = e.target.result;
    }
    reader.readAsDataURL(input.files[0]); 
  } else {
    teaserImgElement.src = "placeholder.jpg"; 
  }
}
  </script>