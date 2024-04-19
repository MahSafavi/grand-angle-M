<?php

require_once "../config/connect.php";
require_once "../config/language.php";
require_once "../config/pdo.php";


$sqlSelectLangue = "SELECT *
FROM langue";
$requestLangue = $db->query($sqlSelectLangue);
$langues = $requestLangue->fetchAll(PDO::FETCH_ASSOC);

?>

<?php
$current_page = basename($_SERVER['REQUEST_URI']);
?>




<!DOCTYPE html>
<html lang="fr, en, zh, de, fa">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--FAVICON-->
  <link rel="apple-touch-icon" sizes="180x180" href="assets/favicon/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
  <link rel="manifest" href="assets/favicon/site.webmanifest">
  <meta name="msapplication-TileColor" content="#da532c">
  <meta name="theme-color" content="#ffffff">
  <!--FAVICON-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
  <!--CDNJS-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <!--Stylesheet-->
  <link rel="stylesheet" href="../assets/css-public/style.css">
  <link rel="stylesheet" href="../assets/css-public/mediaqueries.css">
  <title><?php echo $titre ?></title>
</head>


<body>
  <header id="header">
    <div class="container">
      <div class="subcontainer">
        <nav class="navbar-container">
          <div class="navbar-left">
            <a href="accueil.php" class="nav-branding-1"><img src="../assets/images/2 1.png" alt=""></a>
            <div class="nav-menu">
              <a href="accueil.php" class="nav-branding-2"><img src="../assets/images/2 1.png" alt=""></a>
              <a href="listeExposition.php" class="nav-link <?php if ($current_page === 'listeExposition.php') echo 'active'; ?>"><?php echo EXPONAV; ?></a>
              <a href="listeArtiste.php" class="nav-link <?php if ($current_page === 'listeArtiste.php') echo 'active'; ?>"><?php echo ARTISTENAV; ?></a>
              <a href="collection.php" class="nav-link <?php if ($current_page === 'collection.php') echo 'active'; ?>"><?php echo COLLECNAV; ?></a>
              <a href="contact.php" class="nav-link <?php if ($current_page === 'contact.php') echo 'active'; ?>"><?php echo CONTACTNAV; ?></a>
              <ul>
                <li class="nav-liens">
                  <a href="listeExposition.php" class=""><?php echo EXPONAV; ?></a><br>
                </li>
                <li class="nav-liens">
                  <a href="listeArtiste.php" class=""><?php echo ARTISTENAV; ?></a><br>
                </li>
                <li class="nav-liens">
                  <a href="collection.php" class=""><?php echo COLLECNAV; ?></a><br>
                </li>
                <li class="nav-liens">
                  <a href="contact.php" class=""><?php echo CONTACTNAV; ?></a><br>
                </li>
              </ul>

              <div class="menu_langues">
                <form action="" method="GET" id="form_lang">
                  <ul>
                    <?php foreach ($langues as $lan) : ?>
                      <li>
                        <input style="display:none;" type="radio" name="lang" id="<?php echo $lan['value_Langue'] ?>" data-lang="<?php echo $lan['value_Langue'] ?>" onclick="changeLang();" value="<?php echo $lan['value_Langue'] ?>" <?php if (isset($_SESSION['lang']) && $_SESSION['lang'] ==  $lan['value_Langue']) {
                                                                                                                                                                                                                                          echo "checked";
                                                                                                                                                                                                                                        } ?>>
                      </li>
                      <label for="<?php echo $lan['value_Langue'] ?>"><img class="flag" src="../assets/images/flag/<?php echo $lan['chemin_Flag'] ?>" alt="<?php echo $lan['libelle_Langue'] ?>"><?php echo $lan['libelle_Langue'] ?></label>
                    <?php endforeach ?>
                  </ul>
                </form>
              </div>
            </div>
          </div>

          <div class="navbar-right">
            <div class="hamburger">
              <span class="bar"></span>
              <span class="bar"></span>
              <span class="bar"></span>
            </div>
          </div>

        </nav>
      </div>
    </div>
  </header>
  <main>

    <script>
      function changeLang() {
        let selectedLangue = document.querySelector('input[name="lang"]:checked').value;
        let currentURL = window.location.href;
        let [baseURL, queryString] = currentURL.split('?');
        let newURL = baseURL + "?lang=" + selectedLangue;
        if (queryString) {
          let queryParams = queryString.split('&');
          for (let param of queryParams) {
            if (!param.startsWith('lang=')) {
              newURL += '&' + param;
            }
          }
        }
        window.location.href = newURL;
      }
    </script>