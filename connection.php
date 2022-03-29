<?php
try {
    $db = new PDO('mysql:host=localhost;dbname=computers', 'user', 'password');
} 
catch (PDOException $e) {
    print "Error: ".$e->getMessage();
    die();
}
?>