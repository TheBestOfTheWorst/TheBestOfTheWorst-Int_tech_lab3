<?php
include "connection.php";

$sqlSelect = "SELECT * FROM Computer WHERE guarantee <= CURDATE();";

$stmt = $db->query($sqlSelect);
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>