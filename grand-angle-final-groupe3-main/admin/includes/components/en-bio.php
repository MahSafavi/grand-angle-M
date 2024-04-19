
<div class="en">
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="img-container-add-artiste">
            <div class="img-content-add-artiste">
                <img id="preview-img-artiste-en" src="../assets/images/img-artiste/<?= $bioDe['chemin_Imgart']?>" alt="">
            </div>
            <div class="input-photo-artiste">
                <?php $imgUrl = !empty($bioEn['chemin_Imgart']) && file_exists($bioEn['chemin_Imgart']) ? $bioEn['chemin_Imgart'] : "./assets/img/imgvide.webp";?>
                
                <label for="photo-artiste">Photo de l'artiste :</label>
                <input type="file" id="photo-artiste-en" name="photo-artiste-en" accept="image/*">
                <img src="" alt="">
            </div>
        </div>
        
        <div class="div-bio">
            <label for="bio-en">Biographie de l'artiste :</label>
            <textarea name="bio-en" id="bio-en" cols="40" rows="10"><?= $bioEn['description_artist']?></textarea>
        </div>
        <div class="div-artiste-bio">
            <p>Artiste concerné : <?= $artisteConc['Nom_Artiste'] . " " . $artisteConc['Prenom_Artiste']?></p>
        </div>

        <div class="submit-bio">
            <button name="submit-bio-en" type="submit">Valider la biographie</button>
        </div>
    </form>
</div>