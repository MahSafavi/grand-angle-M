<?php 

if (isset($_GET["id"])) {
    $id = $_GET["id"];
    $sqlSelectTheme = "SELECT * FROM theme_exposition ORDER BY libelle_Theme";
    $requete1 = $db->query($sqlSelectTheme);
    $themes = $requete1->fetchAll(PDO::FETCH_ASSOC);

    $sqlSelectArtiste = "SELECT * FROM artiste ORDER BY Nom_Artiste";
    $requete2 = $db->query($sqlSelectArtiste);
    $artistes = $requete2->fetchAll(PDO::FETCH_ASSOC);

    $sql = 'SELECT *
        FROM exposition
        JOIN theme_exposition ON theme_exposition.Id_Theme = exposition.Id_Theme
        JOIN artiste ON artiste.Id_Artiste = exposition.Id_Artiste
        WHERE Id_Exposition=:id';

    try {
        $requete = $db->prepare($sql);
        $requete->bindValue(":id", $id, PDO::PARAM_INT);
        $requete->execute();
        $expos = $requete->fetch();
    } catch (PDOException $e) {
        echo 'Erreur lors de la récupération du projet : ' . $e->getMessage();
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
     
        if ($expos['Id_Artiste'] != $_POST['artist_select'] || $expos['id_Theme'] != $_POST['theme_select']) {
          
            $artist_select = $_POST['artist_select'];
            $theme_select = $_POST['theme_select'];

            $sql = 'UPDATE exposition 
                SET Id_Theme = :theme_select, 
                    Id_Artiste = :artist_select
                WHERE Id_Exposition = :id';

            try {
                $requete = $db->prepare($sql);
                $requete->bindParam(":theme_select", $theme_select);
                $requete->bindParam(":artist_select", $artist_select);
                $requete->bindParam(":id", $id);
                $requete->execute();

                $message = "Succès de la modification de l'artiste et du thème";
            } catch (PDOException $e) {
                echo 'Erreur lors de la mise à jour du projet : ' . $e->getMessage();
                exit();
            }
        }

       
        $plan_filename = $expos['chemin_Plan'];  
        $teaser_filename = $expos['chemin_Affiche']; 

        if ($_FILES['plan_upload']['error'] === UPLOAD_ERR_OK) {
            $plan_filename = basename($_FILES['plan_upload']['name']);
            move_uploaded_file($_FILES['plan_upload']['tmp_name'], '../assets/images/plan/' . $plan_filename);
        }

        if ($_FILES['teaser_upload']['error'] === UPLOAD_ERR_OK) {
            $teaser_filename = basename($_FILES['teaser_upload']['name']);
            move_uploaded_file($_FILES['teaser_upload']['tmp_name'], '../assets/images/exposition/' . $teaser_filename);
        }

        
        $libelle_expo = $_POST['libelle_expo'];
        $date_debut = $_POST['date_debut'];
        $date_Fin = $_POST['date_fin'];
        $time_start = $_POST['time_start'];
        $time_fin = $_POST['time_fin'];

        $sql = 'UPDATE exposition 
            SET libelle_Exposition = :libelle_expo, 
                Date_Debut = :date_debut, 
                Date_Fin = :date_fin, 
                Horaires_Debut = :time_start, 
                Horaires_Fin = :time_fin, 
                chemin_Plan = :plan_filename,
                chemin_Affiche = :teaser_filename
            WHERE Id_Exposition = :id';

        try {
            $requete = $db->prepare($sql);
            $requete->bindParam(":libelle_expo", $libelle_expo);
            $requete->bindParam(":date_debut", $date_debut);
            $requete->bindParam(":date_fin", $date_Fin);
            $requete->bindParam(":time_start", $time_start);
            $requete->bindParam(":time_fin", $time_fin);
            $requete->bindParam(":plan_filename", $plan_filename);
            $requete->bindParam(":teaser_filename", $teaser_filename);
            $requete->bindParam(":id", $id);
            $requete->execute();

            $message = "Succès de la modification";
            //header("Location: expo-card.php");

        } catch (PDOException $e) {
            echo 'Erreur lors de la mise à jour du projet : ' . $e->getMessage();
            exit();
        }
    }
} else {
    echo 'updating is not possible!';
    header("Location: List-exposition-Mahsa.php");
}

;?>

<form action="" method="POST" class="add-collab"  enctype="multipart/form-data">
  <h2 class="title-form">Modifier l'exposition</h2>
  <div class="form-divs">
    <label for="libelle_expo">Nom de l'exposition :</label>
  </div>
  <div class="form-divs">
    <input type="text" id="libelle_expo" class="field-add-collab" name="libelle_expo" placeholder="libelle de l'exposition - prenom nom de l'artiste" value="<?php echo $expos['libelle_Exposition']; ?>">
  </div>

  <div class="form-divs">
    <label for="theme_select">Thème de l'exposition : </label>
  </div>
  <div class="form-divs">
    <select name="theme_select" id="theme_select" class="field-select">
      <?php foreach($themes as $theme):?>
        <option value="<?php echo $theme["id_Theme"]?>" <?php if($expos['id_Theme'] == $theme["id_Theme"]) echo "selected"; ?>><?php echo $theme["libelle_Theme"]?></option>
      <?php endforeach?>
    </select>
  </div>

  <div class="info-date-hour">
    <div class="dat-time">
      <div class="form-divs">
        <label for="date_debut">Date de début :</label>
      </div>
      <div class="form-divs">
        <input type="date" id="date_debut" class="field-dh" name="date_debut" placeholder="" value="<?php echo $expos['Date_Debut']; ?>">
      </div>
    </div>
 
  <div class="dat-time">
    <div class="form-divs">
      <label for="date_fin">Date de fin :</label>
    </div>
    <div class="form-divs">
      <input type="date" id="date_fin" class="field-dh" name="date_fin" placeholder="" value="<?php echo $expos['Date_Fin']; ?>">
    </div>
  </div>
 
  <div class="dat-time">
    <div class="form-divs">
      <label for="time_start">Horaires de début :</label>
    </div>
    <div class="form-divs">
      <input type="time" id="time_start" class="field-dh" name="time_start" placeholder="" value="<?php echo $expos['Horaires_Debut']; ?>">
    </div>
  </div>
  <div class="dat-time">
    <div class="form-divs">
      <label for="time_fin">Horaires de fin :</label>
    </div>
    <div class="form-divs">
      <input type="time" id="time_fin" class="field-dh" name="time_fin" placeholder="" value="<?php echo $expos['Horaires_Fin']; ?>">
    </div>
  </div>
 
</div>
   
<select name="artist_select" id="artist_select" class="field-select">
      <?php foreach($artistes as $art):?>
        <option value="<?php echo $art["Id_Artiste"]?>" <?php if($expos['Id_Artiste'] ==  $art["Id_Artiste"]) echo "selected"; ?>><?php echo $art["Nom_Artiste"]." ".$art["Prenom_Artiste"]?></option>
      <?php endforeach?>
    </select>
      <div class="upload-pt-flex">
      <div class="upload-pt">
              <div class="form-divs">
            <div class="file-add ">
            <label for="plan_upload" class="lable-upload">Aperçu du plan de l'exposition :</label>
            <img id="plan_preview" src="../assets/images/plan/<?php echo $expos['chemin_Plan'];?>" alt="Plan de l'exposition" class="preview-image">
            <input type="file" id="plan_upload" name="plan_upload" accept="image/*" class="upload-expo" onchange="previewPlanImage(this)">
              </div>
              </div>
              </div>
              <div class="upload-pt">   
          <div class="form-divs">
            <div class="file-add ">
            <label for="teaser_upload" class="lable-upload">Aperçu de l'affiche de l'exposition :</label>
            <img id="teaser_preview" src="../assets/images/exposition/<?php echo $expos['chemin_Affiche'];?>" alt="Affiche de l'exposition" class="preview-image">
          <input type="file" id="teaser_upload" name="teaser_upload" accept="image/*" class="upload-expo" onchange="previewTeaserImage(this)">
            </div>  
          </div>
      </div>
      </div>
      <div class="form-divs login-input">
            <input type="submit" name="submit" class="input-sub-add-collab" value="Mettre à jour">
      </div>  
  </form>
 
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
