
<div class="ch">
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="img-container-add-artiste">
            <div class="img-content-add-artiste">
                <img id="preview-img-artiste-ch" src="../assets/images/img-artiste/<?= $bioDe['chemin_Imgart']?>" alt="">
            </div>
            <div class="input-photo-artiste">
                <?php $imgUrl = !empty($bioCh['chemin_Imgart']) && file_exists($bioCh['chemin_Imgart']) ? $bioCh['chemin_Imgart'] : "./assets/img/imgvide.webp";?>
                
                <label for="photo-artiste">Photo de l'artiste :</label>
                <input type="file" id="photo-artiste-ch" name="photo-artiste-ch" accept="image/*">
                <img src="" alt="">
            </div>
        </div>
        
        <div class="div-bio">
            <label for="bio-ch">Biographie de l'artiste :</label>
            <textarea name="bio-ch" id="bio-ch" cols="40" rows="10"><?= $bioCh['description_artist']?></textarea>
        </div>
        <div class="div-artiste-bio">
            <p>Artiste concerné : <?= $artisteConc['Nom_Artiste'] . " " . $artisteConc['Prenom_Artiste']?></p>
        </div>

        <div class="submit-bio">
            <button name="submit-bio-ch" type="submit">Valider la biographie</button>
        </div>
    </form>
</div>