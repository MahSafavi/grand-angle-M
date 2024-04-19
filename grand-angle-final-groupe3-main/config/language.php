<?php
$lang_array= array("FR", "EN", "DE","FA","ZH" );
 
if(!isset($_SESSION['lang'])){
  if (!empty($_SERVER['HTTP_ACCEPT_LANGUAGE']))
    $_SESSION['lang'] = strtoupper(substr($_SERVER['HTTP_ACCEPT_LANGUAGE'],0,2));
else
$_SESSION['lang'] = "FR";
}
if(isset($_GET['lang']) && !empty($_GET['lang']) && in_array($_GET['lang'], $lang_array))
$_SESSION['lang']=$_GET['lang'];
 
include "lang_". $_SESSION['lang'].".php";
 
?>