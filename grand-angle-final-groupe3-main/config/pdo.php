<?php

define("DBHOST", "127.0.0.1");
define("DBUSER", "root");
define("DBPASS", "");
define("DBNAME", "GRANDANGLEFINAL");

$dsn = "mysql:dbname=".DBNAME.";host=".DBHOST;

try {
    $db = new PDO($dsn, DBUSER, DBPASS);
    $db->exec("SET NAMES utf8");
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch (PDOexception $e) {
    die("Erreur de connexion à la base de données".$e->getMessage());

}

;?>