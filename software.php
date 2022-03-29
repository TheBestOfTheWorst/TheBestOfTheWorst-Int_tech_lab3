<?php
include "connection.php";

$sqlSelect = "SELECT * FROM Computer 
INNER JOIN Computer_Software ON Computer.ID_Computer=Computer_Software.FID_Computer  
INNER JOIN Software ON Computer_Software.FID_Software=Software.ID_software 
WHERE Software.name=?;";

$prepStat = $db->prepare($sqlSelect);
$prepStat->execute([$_POST['softTypes']]);
$data = $prepStat->fetchAll(PDO::FETCH_ASSOC);
?>