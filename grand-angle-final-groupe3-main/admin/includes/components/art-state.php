<?php 

require_once "../config/pdo.php";
$sql = "SELECT oeuvres.Id_Oeuvres, oeuvres.etat_Oeuvre, image.libelle_Image, image.chemin_Image, exposition.libelle_Exposition, exposition.Date_Debut, artiste.Id_Artiste
FROM oeuvres
JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition 
WHERE CURRENT_DATE() < exposition.Date_Debut
AND exposition.Date_Debut <= DATE_ADD(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY oeuvres.Id_Oeuvres, oeuvres.etat_Oeuvre, image.libelle_Image, image.chemin_Image, exposition.libelle_Exposition, exposition.Date_Debut, artiste.Id_Artiste";
$requete = $db->query($sql);
$oeuvres = $requete->fetchAll(PDO::FETCH_ASSOC);

;?>

 <div class="slider-container swiper">
    <h2 class="title-state">État de livraison des oeuvres pour la prochaine exposition :</h2>
    <div class="slide-content">
        <div class="card-wrapper swiper-wrapper">
        <?php forEach($oeuvres as $oeuvre) : ?>
            <div class="card swiper-slide">
                <div class="image-content">
                    <h2><?= $oeuvre["libelle_Exposition"] ?></h2>
                    <div class="card-image">
                        <a href="oeuvre-update.php?id=<?= $oeuvre['Id_Oeuvres']?>">
                            <img src="../assets/images/artwork/<?= $oeuvre["chemin_Image"];?>" alt="" class="card-img">
                        </a>
                    </div>
                    <div clas="card-content">
                        <h3 class="name"><?= $oeuvre["libelle_Image"]?></h3>
                        <?php if($oeuvre["etat_Oeuvre"] === 0): ?>
                        <span>Pas livrée</span>
                        <?php else : ?>
                        <span>Livrée</span>
                        <?php endif ;?>
                    </div>
                </div>
            </div>
        <?php endforeach ;?>
        </div>
    </div>

    <div class="swiper-button-next swiper-navBtn"></div>
    <div class="swiper-button-prev swiper-navBtn"></div>
 </div>

 <script src="../assets/javascript/swiper-bundle.min.js"></script>

 <script>
    
let swiper = new Swiper(".slide-content", {
    slidesPerView: 3,
    spaceBetween: 25,
    loop: true,
    centerSlide: 'true',
    fade: 'true',
    grabCursor: 'true',
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      dynamicBullets: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },

    breakpoints:{
        0: {
            slidesPerView: 1,
        },
        520: {
            slidesPerView: 2,
        },
        950: {
            slidesPerView: 3,
        },
    },
  });
 </script> 