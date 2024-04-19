<?php 

$idArtiste = $_GET["id"];

$sqlArtiste = "SELECT artiste.Id_Artiste, artiste.Nom_Artiste, artiste.Prenom_Artiste, artiste.Email_Artiste, artiste.tel_Artiste, artiste.id_DirArt, oeuvres.Id_Oeuvres, oeuvres.libelle_Oeuvre, image.id_Image, image.chemin_Image, bio_artist.description_artist, bio_artist.chemin_Imgart, bio_artist.Id_Artiste, dirart.nom_DirArt, dirart.prenom_DirArt
FROM oeuvres
JOIN artiste ON oeuvres.Id_Artiste = artiste.Id_Artiste
JOIN bio_artist ON artiste.Id_Artiste = bio_artist.Id_Artiste
JOIN dirart ON artiste.id_DirArt = dirart.id_DirArt
JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
WHERE artiste.Id_Artiste = :Id_Artiste";
$requeteArtiste = $db->prepare($sqlArtiste);
$requeteArtiste->bindValue(":Id_Artiste", $idArtiste, PDO::PARAM_INT);
$requeteArtiste->execute();
$artiste = $requeteArtiste->fetch();


;?>

<div class="artist-title">
    <h2 class="title-fiche-artist">Fiche de <?= $artiste['Nom_Artiste'] . " " . $artiste['Prenom_Artiste']?></h2>
</div>

<div class="fiche-artist">
    <div class="container-fiche-artiste">

        <div class="img-keeper">
            <img src="./artwork/<?= $artiste['chemin_Imgart']?>" alt="Photo de l'artiste">
        </div>

        <div>
            <label for="img-artiste" class="costume-upload">Sélectionner une image</label>
            <input type="file" id="img-artiste" name="img-artiste"   accept="image/png,image/jpeg,image/jpg" >
        </div>

        <div class="info-artist">
            <a href="#" class="modif-info"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg></a>

            <div class="name-artist">
                <span class="info">Nom Prénom : <?= $artiste['Nom_Artiste'] . " " . $artiste['Prenom_Artiste']?></span>
                <span class="respond-info"><?= $artiste['Nom_Artiste'] . " " . $artiste['Prenom_Artiste']?></span>
            </div>

            <div class="email-artist">
                <span class="info">Email : </span>
                <span class="respond-info"><?= $artiste['Email_Artiste']?></span>
            </div>

            <div class="tel-artist">
                <span class="info">Téléphone : </span>
                <span class="respond-info"><?= $artiste['tel_Artiste']?></span>
            </div>
        </div>

        <div class="dir_artist">
            <h4 class="title-table-dir-art"><?= $artiste['nom_DirArt'] . " " . $artiste['prenom_DirArt']?></h4>
            <p>Leyli Golestan</p>
            <div class="svg-dir-art">
                <a href="#" class="ctr-icon"><svg class="plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg></a>
                <a href="#" class="ctr-icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg></a>
                <a href="#" class="ctr-icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg></a>
            </div>
        </div>
    </div>

    <div class="left-fiche-artist">
        <div class="bio-artiste">
            <a href="#" class="modif-info"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg></a>
            <p class="info-bio">Bio Artist</p>
            <p>
                Iran Darroudi, née le 22 avril 1936 à Téhéran, est une artiste iranienne de renommée internationale, célèbre pour ses contributions remarquables à la scène artistique contemporaine. Elle a étudié les beaux-arts à l'École des beaux-arts de Téhéran et a ensuite poursuivi ses études à l'École nationale supérieure des beaux-arts de Paris.
                Le style artistique d'Iran Darroudi est polyvalent, s'étendant de l'abstraction géométrique à des expressions plus figuratives. Elle a maîtrisé divers médiums, notamment la peinture à l'huile, la calligraphie, la céramique et la sculpture. Darroudi a influencé la scène artistique iranienne en tant que membre du groupe "Saqqakhaneh", un mouvement qui a fusionné les éléments de l'art traditionnel iranien avec des influences contemporaines.
                Son travail reflète souvent des thèmes profonds et des questions existentielles, explorant la spiritualité, la nature humaine et la dualité de la tradition et de la modernité. Darroudi a participé à de nombreuses expositions individuelles et collectives à travers le monde, consolidant sa réputation d'artiste visionnaire et innovante.
                Au-delà de sa carrière artistique, Iran Darroudi a également joué un rôle important en tant que conservatrice de musée et éducatrice, contribuant à l'évolution de l'éducation artistique en Iran. Son engagement envers l'art en tant que moyen d'expression et de compréhension transcende les frontières culturelles, faisant d'elle une figure emblématique de la scène artistique contemporaine en Iran.
            </p>
        </div>

        <div class="artwork-wrapper">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" id="back-btn"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"/></svg>
    
            <div class="list-artwork">
                <div class="card-keeper">
                    <div class="card">

                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="./assets/img/darroudi_awake.jpg" alt="" class="card-img">
                            </div>
                        </div>

                        <div class="card-content">
                            <h4 class="libelle-artwork">Awake</h4>
                            <a href="#"><button class="voir-plus">Voir plus</button></a>
                        </div>
                    </div>
                </div>
            </div>
  
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" id="next-btn"><path d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/></svg>
        </div>
    </div>
</div>
<!-- </div>
</div>  -->
<script>
  let cardWidth = document.querySelector('.card').offsetWidth + 10;
  let scrollContainer = document.querySelector(".list-artwork");
  let backBtn = document.getElementById("back-btn");
  let nextBtn = document.getElementById("next-btn");
  scrollContainer.addEventListener("wheel", (evt)=>{
    evt.preventDefault();
    scrollContainer.scrollLeft += evt.deltaY;
    scrollContainer.style.scrollBehviour = "auto";
    });
    nextBtn.addEventListener("click", ()=>{
        scrollContainer.style.scrollBehviour = "smooth";
        scrollContainer.scrollLeft += 630;
       // scrollContainer.scrollLeft -= cardWidth;
    });
    backBtn.addEventListener("click", ()=>{
        scrollContainer.style.scrollBehviour = "smooth";
        scrollContainer.scrollLeft -= 630;
       // scrollContainer.scrollLeft += cardWidth;
    });
</script>