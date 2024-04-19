<?php

function filtrage($data) {
    $data = stripslashes($data);
    $data = trim($data);
    $data = strip_tags($data);
    $data = htmlspecialchars($data);
    return $data;
}

;?>