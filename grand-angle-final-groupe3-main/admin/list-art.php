<?php

session_start();

$title = "Liste des Oeuvres";

$title = "Liste des oeuvres";

include "includes/pages/header.php";
include "includes/pages/nav-head.php";
include "includes/pages/navbarr.php";

;?>

<button id="page-prec" class="button" onclick="goBack()">Page précédente</button>

<div class="btn-choose">
    
    <button type="button" id="past" class="expo-btn">Passées</button>

    <button type="button" id="now" class="expo-btn">En cours</button>

    <button type="button" id="next" class="expo-btn">A venir</button>

</div>

<div class="art-contain-by-btn">
    
        <div id="div-art-past" class="div-art-list">
            <?php include "includes/components/past-art.php";?>
        </div>
        <div id="div-art-now" class="div-art-list">
            <?php include "includes/components/now-art.php";?>
        </div>
        <div id="div-art-next" class="div-art-list">
            <?php include "includes/components/next-art.php";?>
        </div>
    
</div>

<script>

    const divPast = document.getElementById('div-art-past');
    const divNow = document.getElementById('div-art-now');
    const divNext = document.getElementById('div-art-next');

    document.addEventListener("DOMContentLoaded", function () {
        divPast.style.display = "none";
        divNow.style.display = "none";
        divNext.style.display = "flex";
        nextBtn.classList.toggle('btnActive');
    });

    const pastBtn = document.getElementById('past')
    pastBtn.addEventListener('click', function () {
        divPast.style.display = "flex";
        divNow.style.display = "none";
        divNext.style.display = "none";
        this.classList.replace('expo-btn', 'btnActive');
        nowBtn.classList.replace('btnActive', 'expo-btn');
        nextBtn.classList.replace('btnActive', 'expo-btn');
    })

    const nowBtn = document.getElementById('now')
    nowBtn.addEventListener('click', function () {
        divPast.style.display = "none";
        divNow.style.display = "flex";
        divNext.style.display = "none";
        this.classList.replace('expo-btn', 'btnActive');
        pastBtn.classList.replace('btnActive', 'expo-btn');
        nextBtn.classList.replace('btnActive', 'expo-btn');
    });

    const nextBtn = document.getElementById('next')
    nextBtn.addEventListener('click', function () {
        divPast.style.display = "none";
        divNow.style.display = "none";
        divNext.style.display = "flex";
        this.classList.replace('expo-btn', 'btnActive');
        pastBtn.classList.replace('btnActive', 'expo-btn');
        nowBtn.classList.replace('btnActive', 'expo-btn');
    });


</script>
 
<?php 
include "includes/pages/footer.php";
;?>