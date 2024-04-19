<?php

require_once "../config/pdo.php";

;?>

<div class="nav-contain hide-on-print">
    
    <div class="user">
        <?php if(isset($_SESSION['user'])) : ?>
            <h1><?= $_SESSION["user"]["nom"] . " " . $_SESSION["user"]["prenom"];?></h1>
        <?php elseif(isset($_SESSION['admin'])) : ?>
            <h1><?= $_SESSION["admin"]["nom"] . " " . $_SESSION["admin"]["prenom"];?></h1>
        <?php endif;?> 
    </div> 
   
    <div class="searchbar"> 
        <div class="loupe">
            <svg id="svg-loupe" viewBox="0 0 512 512"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
        </div>
        <input type="text" placeholder="Rechercher...">
    </div>
    <div class="home-btn"><a href="home-dash.php">Home</a></div>
    <div class="home-btn deconnexion"><a href="deconnexion.php">Déconnexion</a></div>
</div>

