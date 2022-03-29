<?php
include "connection.php";

$sqlSelect = "SELECT * FROM Computer INNER JOIN Processors 
ON Computer.FID_processor=Processors.ID_Processor WHERE Processors.name=?";

$prepStat = $db->prepare($sqlSelect);
$prepStat->execute([$_POST['procTypes']]);
$data = $prepStat->fetchAll(PDO::FETCH_ASSOC);
?>