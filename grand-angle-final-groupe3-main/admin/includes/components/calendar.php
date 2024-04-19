
  <div class="container">
    <div class="row">
      <div class="col-lg-7">
        <div id="calendar"></div>
      </div>
    </div>
  </div>
  <br> 

<?php

require_once '../config/pdo.php';

$sql = 'SELECT libelle_Exposition, Date_Debut, Date_Fin FROM exposition';
$requete = $db->query($sql);
$expos = $requete->fetchAll(PDO::FETCH_ASSOC);


$events = [];
foreach ($expos as $expo) {
    $event = [
        'title' => $expo['libelle_Exposition'],
        'start' => date('Y-m-d', strtotime($expo['Date_Debut'])),
        'end' => date('Y-m-d', strtotime($expo['Date_Fin']))
    ];

    if (!in_array($event, $events)) {
      $events[] = $event;
  }
}

$exposToJason = json_encode($events, JSON_UNESCAPED_UNICODE);

file_put_contents('events.json', $exposToJason, LOCK_EX);
?>



 <script>
    $(document).ready(function() {
        $('#calendar').fullCalendar({
            events: 'events.json',
            eventRender: function(event, element) {
            },
            eventColor: 'green',
            eventTextColor: 'white'
        });
    });
</script>  

