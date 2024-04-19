
<div class="fr">
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="img-container-add-artiste">
            <div class="img-content-add-artiste">
                <img id="preview-img-artiste-fr" src="../assets/images/img-artiste/<?= $bioDe['chemin_Imgart']?>" alt="">
            </div>
            <div class="input-photo-artiste">
                <?php $imgUrl = !empty($bioFr['chemin_Imgart']) && file_exists($bioFr['chemin_Imgart']) ? $bioFr['chemin_Imgart'] : "/./assets/img/imgvide.webp";?>
                
                <label for="photo-artiste">Photo de l'artiste :</label>
                <input type="file" id="photo-artiste-fr" name="photo-artiste-fr" accept="image/*">
                <img src="" alt="">
            </div>
        </div>
        
        <div class="div-bio">
            <label for="bio-fr">Biographie de l'artiste :</label>
            <textarea name="bio-fr" id="bio-fr" cols="40" rows="10"><?= $bioFr['description_artist']?></textarea>
        </div>
        <div class="div-artiste-bio">
            <p>Artiste concerné : <?= $artisteConc['Nom_Artiste'] . " " . $artisteConc['Prenom_Artiste']?></p>
        </div>

        <div class="submit-bio">
            <button name="submit-bio-fr" type="submit">Valider la biographie</button>
        </div>
    </form>
</div>

<script>

const inputFile = document.getElementById("photo-artiste-fr");

inputFile.addEventListener("change", function (event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.addEventListener('load', function () {
        const previewImage = document.querySelector('img#preview');
        previewImage.src = reader.result;
        previewImage.style.display = 'block';
    });

    reader.readAsDataURL(file);
});

</script>

