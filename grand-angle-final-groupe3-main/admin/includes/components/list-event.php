<?php
require_once "../config/pdo.php";

$sqlCurrentEvent = "SELECT * FROM exposition WHERE exposition.Date_Debut <= DATE_ADD(CURRENT_DATE(), INTERVAL 3 DAY) AND CURRENT_DATE() <= exposition.Date_Fin";
$requeteCurrentEvent = $db->query($sqlCurrentEvent);
$currentEvents = $requeteCurrentEvent->fetchAll(PDO::FETCH_ASSOC);

$lastCurrentEventEndDate = end($currentEvents)['Date_Fin'];

$nextEventStartDate = date('Y-m-d', strtotime('+3 days', strtotime($lastCurrentEventEndDate)));

$nextEventEndDate = date('Y-m-d', strtotime('+25 days', strtotime($nextEventStartDate)));

$sqlEvent = "SELECT * FROM exposition WHERE exposition.Date_Debut = '$nextEventStartDate' AND exposition.Date_Fin = '$nextEventEndDate'";
$requeteEvent = $db->query($sqlEvent);
$events = $requeteEvent->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>list event</title>
</head>

<body>
  <h3>Actualités</h3>
  <div class="event">
    <?php foreach ($currentEvents as $currentEvent): ?> 
    <p><?= date('d-m-y', strtotime($currentEvent['Date_Debut'])) . " "; ?>-<?= " " . date('d-m-y', strtotime($currentEvent['Date_Fin'])); ?> </p>
    <p><?= $currentEvent["libelle_Exposition"]; ?></p>
    <?php endforeach;?>
  </div>



  <h3>Évènements à venir</h3>
  <div class="event">
    <?php foreach ($events as $even): ?> 
    <p><?= date('d-m-y', strtotime($even['Date_Debut'])) . " "; ?>-<?= " " . date('d-m-y', strtotime($even['Date_Fin'])); ?> </p>
    <p><?= $even["libelle_Exposition"]; ?></p>
    <?php endforeach;?>
  </div>
</body>

</html>