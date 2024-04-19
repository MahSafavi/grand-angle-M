<?php

require_once "../config/pdo.php"; 

$sqlArtPast = "SELECT oeuvres.Id_Oeuvres, oeuvres.libelle_Oeuvre, Image.chemin_Image, artiste.Nom_Artiste, artiste.Prenom_Artiste, exposition.Date_Debut, exposition.Date_Fin, exposition.libelle_Exposition
FROM oeuvres 
JOIN image ON oeuvres.Id_Oeuvres = image.Id_Oeuvres
JOIN artiste ON artiste.Id_Artiste = oeuvres.Id_Artiste
JOIN exposition ON oeuvres.Id_Exposition = exposition.Id_Exposition 
WHERE exposition.Date_Fin < CURRENT_DATE()";
$requeteArtPast = $db->query($sqlArtPast);
$oeuvresPast = $requeteArtPast->fetchAll(PDO::FETCH_ASSOC);



;?>
 

<div class="art-content-now">
    
    <div id="rect" class="expo-content-now">
        <h2 class="title-art">Liste des oeuvres pour les expositions passées :</h2>
        <div class="container-cards-art-now">
                <?php forEach($oeuvresPast as $oeuvrePast) : ?>
                <div class="card-art-now-expo" id="<?= $oeuvrePast['Id_Oeuvres'] ?>">

                    <div class="delete-panel" id="delete-project-overlay-<?= $oeuvrePast['Id_Oeuvres'] ?>">
                        <div class="container-delete">
                            <div class="info-delete">
                                <p>Voulez-vous vraiment supprimer l'oeuvre ?</p>
                                <div>
                                    <button id="confirm-delete" data-oeuvre-id="<?= $oeuvrePast['Id_Oeuvres']?>">Oui, supprimer</button>
                                    <button id="cancel-delete">Non, pas maintenant</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-row1">
                        <h2><?= $oeuvrePast["libelle_Exposition"] ;?></h2>
                    </div>
                    <div class="card-row2">
                        <div class="image-oeuvre-ongoing">
                            <a href=""><img src="../assets/images/artwork/<?= $oeuvrePast["chemin_Image"];?>" alt=""></a>
                        </div>
                        <div class="content-infos-oeuvre-ongoing">
                            
                            <div class="infos-oeuvre-ongoing">
                                <p class="libelle-art-now"><?= $oeuvrePast["libelle_Oeuvre"];?></p>
                                <p><?= $oeuvrePast["Nom_Artiste"];?> <?= $oeuvrePast["Prenom_Artiste"];?></p>
                                <p><?= date('d-m-Y', strtotime($oeuvrePast["Date_Debut"]));?> / <?= date('d-m-Y', strtotime($oeuvrePast["Date_Fin"]));?></p>
                            </div>
                            <div class="action-oeuvre-ongoing">
                                <div class="modify-art-ongoing">
                                    <a href="oeuvre-update.php?id=<?= $oeuvrePast['Id_Oeuvres']?>">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg>                                    </a>
                                </div>
                                <div class="delete-art-ongoing">
                                    <a href="#" class="delete-oeuvre-link link" data-id="<?= $oeuvrePast['Id_Oeuvres']?>">
                                        <svg viewBox="0 0 448 512"><path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach;?>
        </div> 
    </div>
    <div class="container-button-art-ongoing">
        <button type="button" id="add-oeuvre-expo-now"><a href="./add-oeuvre-unique.php">Ajouter une oeuvre</a><svg viewBox="0 0 448 512"><path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg></button>
    </div>
</div> 

<script>
    const deleteLinks = document.querySelectorAll(".delete-oeuvre-link");
        deleteLinks.forEach(function(deleteLink){
            const oeuvreCard = deleteLink.closest('.card-art-now-expo');
            const modal = oeuvreCard.querySelector('.delete-panel');
            const confirmBtn = modal.querySelector("#confirm-delete");
            const cancelBtn = modal.querySelector("#cancel-delete");

            deleteLink.addEventListener('click', function(event) {
                event.preventDefault();
                modal.style.display = 'block';
            })

            cancelBtn.addEventListener('click', function(event) {
                event.preventDefault();
                modal.style.display = 'none';
            })

            confirmBtn.addEventListener('click', function(event) {
                event.preventDefault();
                const oeuvreId = this.getAttribute('data-oeuvre-id');
                console.log(oeuvreId);
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'delete.php');
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function(){
                    if(xhr.status === 200) {
                        const oeuvreCard = deleteLink.closest('.card-art-now-expo');
                        oeuvreCard.parentNode.removeChild(oeuvreCard);
                    } else {
                        console.error('Erreur lors de la suppression du projet');
                    }
                };

                xhr.send('Id_Oeuvres=' + oeuvreId);
                
            })


        })
</script>