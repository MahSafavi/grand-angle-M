<?php
require_once "../config/pdo.php";
$sql = "SELECT *
FROM artiste 
LEFT JOIN dirart ON artiste.id_DirArt = dirart.id_DirArt
JOIN  bio_artist ON artiste.Id_Artiste = bio_artist.Id_Artiste
WHERE bio_artist.Id_Langue = 1 
ORDER BY artiste.Id_Artiste ASC";

if(isset($_GET['filter-artist']) && !empty($_GET['filter-artist'])) {

    $searchQuery = htmlspecialchars($_GET['filter-artist']);
    $sql = "SELECT *
            FROM artiste 
LEFT JOIN dirart ON artiste.id_DirArt = dirart.id_DirArt
JOIN  bio_artist ON artiste.Id_Artiste = bio_artist.Id_Artiste
WHERE bio_artist.Id_Langue = 1 AND Nom_Artiste LIKE '%$searchQuery%'
            ORDER BY Nom_Artiste ASC";
  }


$requete = $db -> query($sql);
$artists = $requete->fetchAll(PDO::FETCH_ASSOC);
;?>

<div class="art-content-now">
    <h2 class="title-page-artist">Liste des Artistes</h2>
    <div class="btn-dirart">
        <button><a href="./card-dirart.php">Liste des directeurs artistiques</a></button>
    </div>

    <div class="expo-content-now">
        <div class="search-container form-divs-list-artist">
            <form action="" method="GET">
                <label for="filter-artist">Filtrer par nom d'artiste</label>
                <input type="text" class="search-bar" id="filter-artist" name="filter-artist" placeholder="Entrer le nom de l'artiste">
                <button type="submit" class="search-btn"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg></button>
            </form>
        </div>
        <div class="container-cards-art-now">
            <?php forEach($artists as $artist) :?>
                <div class="card-art-now-expo" id="<?= $artist['Id_Artiste'] ?>">

                    <div class="delete-panel" id="delete-project-overlay-<?= $artist['Id_Artiste'] ?>">
                        <div class="container-delete">
                            <div class="info-delete">
                                <p>Voulez-vous vraiment supprimer l'artiste ?</p>
                                <div>
                                    <button id="confirm-delete-next" data-artist-id="<?= $artist['Id_Artiste']?>">Oui, supprimer</button>
                                    <button id="cancel-delete-next">Non, pas maintenant</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-row1">
                        <h2><?= $artist['Nom_Artiste']." ".$artist['Prenom_Artiste'];?></h2>
                    </div>
                    <div class="card-row2">
                        <div class="image-oeuvre-ongoing">
                            <a href=""><img src="../assets/images/img-artiste/<?= $artist['chemin_Imgart']?>" alt=""></a>
                        </div>
                        <div class="content-infos-oeuvre-ongoing">
                            <div class="infos-oeuvre-ongoing artist-info-content">
                                <p class=""><span class='info-atists'>Email :</span><a href="mailto:<?= $artist["Email_Artiste"];?>"><?= $artist["Email_Artiste"];?></a> </p>
                                <p><span class='info-atists'>Téléphone :</span> <?=  $artist["tel_Artiste"];?> </p>
                                <p><span class='info-atists'>Directeur artistique :</span> <?=  $artist["nom_DirArt"]." ".$artist["prenom_DirArt"];?> </p>
                            
                            </div>
                            <div class="action-oeuvre-ongoing">
                                <div class="modify-art-ongoing">
                                    <a href="update-artiste.php?id=<?= $artist['Id_Artiste'] ?>">
                                        <svg viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg>
                                    </a>
                                </div>
                                <div class="delete-art-ongoing">
                                <a href="#" class="delete-oeuvreNext-link link" data-id="<?= $artist['Id_Artiste'] ?>">
                                        <svg viewBox="0 0 448 512"><path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>   
                </div>
                <?php endforeach ;?>
                
        </div> 
    </div>
    <div class="container-button-art-ongoing">
        <button type="button" id="add-oeuvre-expo-now">
           <a href="./add-artiste.php">Ajouter un artiste</a><svg viewBox="0 0 448 512"><path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg></button>
    </div>
</div>

<script>
    const nextDeleteLinks = document.querySelectorAll(".delete-oeuvreNext-link");
        nextDeleteLinks.forEach(function(nextDeleteLink){
            const oeuvreCard = nextDeleteLink.closest('.card-art-now-expo');
            const modal = oeuvreCard.querySelector('.delete-panel');
            const nextConfirmBtn = modal.querySelector("#confirm-delete-next");
            const nextCancelBtn = modal.querySelector("#cancel-delete-next");

            nextDeleteLink.addEventListener('click', function(event) {
                event.preventDefault();
                modal.style.display = 'block';
            })

            nextCancelBtn.addEventListener('click', function(event) {
                event.preventDefault();
                modal.style.display = 'none';
            })

            nextConfirmBtn.addEventListener('click', function(event) {
                event.preventDefault();
                const artisteId = this.getAttribute('data-artist-id');
                console.log(artisteId);
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'delete-artist.php');
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function(){
                    if(xhr.status === 200) {
                        const oeuvreCard = nextDeleteLink.closest('.card-art-now-expo');
                        oeuvreCard.parentNode.removeChild(oeuvreCard);
                    } else {
                        console.error('Erreur lors de la suppression du artiste');
                    }
                };

                xhr.send('Id_Artiste=' + artisteId);

                
            })  


        }) 
</script>

