<?php

session_start();

if (isset($_SESSION["user"])) {
    header("Location: home-dash.php");
    exit;
}
$titre = "Connexion";



if (!empty($_POST)) {
    if (
        isset($_POST["email"], $_POST["pass"])
        && !empty($_POST["email"])
        && !empty($_POST["pass"])
    ) {
        if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
            
   
        }

        require_once "../config/pdo.php";
        $sql = "SELECT * FROM collaborateur WHERE Email_Collaborateur=:email";
        $query = $db->prepare($sql);
        $query->bindValue(":email", $_POST["email"], PDO::PARAM_STR);
        $query->execute();
        $user = $query->fetch();

        if ($user && password_verify($_POST['pass'], $user['Pass_Collaborateur'])) {
            
            $rolesArray = json_decode($user["roles"], true);
            
            if(in_array("ADMIN", $rolesArray)) {
                $_SESSION["admin"] = [
                    "id" => $user["id_Collaborateur"],
                    "nom" => $user["Nom_Collaborateur"],
                    "prenom" => $user["prenom_Collaborateur"],
                    "email" => $user["Email_Collaborateur"],
                    "roles" => $rolesArray
                ];

                header("Location: home-dash.php");
                exit;
                
            } elseif(in_array("USER", $rolesArray)){
            $_SESSION["user"] = [
                "id" => $user["id_Collaborateur"],
                "nom" => $user["Nom_Collaborateur"],
                "prenom" => $user["prenom_Collaborateur"],
                "email" => $user["Email_Collaborateur"],
                "roles" => $rolesArray
            ];

                header("Location: home-dash.php");
                exit;
            } else {
                header("Location: connexion.php");
                exit;
            }
        } else {
            die("Email ou mot de passe incorrect");
        }
    }
        
            
}
include "includes/pages/header.php";

?>

<div class="content-bienvenue">

    <h1 class="bienvenu">Bienvenue dans votre application de gestion</h1>
    
      <form class="form-login" method="POST" action="">
              <div class="from-divs">
                <label for="email" >Email :</label>
              </div>

              <div class="from-divs">
                <input type="email"  id="email" class="field-login"  name="email" placeholder="email@example.com">
                <div class="red"></div>
              </div>
              <div class="from-divs">
                  <label for="pass" >Mot de Passe :</label>
              </div>
              <div class="from-divs">
                  <input type="password"  class="field-login" id="pass"  name="pass">
              </div>
              <div class="from-divs login-input" >
                <input type="submit" class="input-sub-login" value="Confirm identity">
              </div>
              <div class="red"><?php if(!empty($error)) {echo $error;} ;?></div>
      </form>
</div>

<?php 
include "includes/pages/footer.php";
;?>