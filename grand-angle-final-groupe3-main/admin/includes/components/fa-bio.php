
<div class="fa">
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="img-container-add-artiste">
            <div class="img-content-add-artiste">
                <img id="preview-img-artiste-fa" src="../assets/images/img-artiste/<?= $bioDe['chemin_Imgart']?>" alt="">
            </div>
            <div class="input-photo-artiste">
                <?php $imgUrl = !empty($bioFa['chemin_Imgart']) && file_exists($bioFa['chemin_Imgart']) ? $bioFa['chemin_Imgart'] : "./assets/img/imgvide.webp";?>
                
                <label for="photo-artiste">Photo de l'artiste :</label>
                <input type="file" id="photo-artiste-fa" name="photo-artiste-fa" accept="image/*">
                <img src="" alt="">
            </div>
        </div>
        
        <div class="div-bio">
            <label for="bio-fa">Biographie de l'artiste :</label>
            <textarea name="bio-fa" id="bio-fa" cols="40" rows="10"><?= $bioFa['description_artist']?></textarea>
        </div>
        <div class="div-artiste-bio">
            <p>Artiste concerné : <?= $artisteConc['Nom_Artiste'] . " " . $artisteConc['Prenom_Artiste']?></p>
        </div>

        <div class="submit-bio">
            <button name="submit-bio-fa" type="submit">Valider la biographie</button>
        </div>
    </form>
</div>