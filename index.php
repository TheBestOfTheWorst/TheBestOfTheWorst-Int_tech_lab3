<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лабораторная работа 3</title>
    <script src=buttonHandler.js> </script>
</head>

<body>

<p>Выбрать тип центрального процессора:<br>
<select name="procTypes">
<?php
    include 'connection.php';

    $stmt = $db->query("SELECT name FROM Processors");
    while ($proc = $stmt->fetchColumn())
        echo "<option>$proc</option>";
?>
</select><br>

<p>Выбрать установленное ПО:<br>
<select name="softTypes">
<?php
    include 'connection.php';

    $stmt = $db->query("SELECT name FROM Software");
    while ($soft = $stmt->fetchColumn())
        echo "<option>$soft</option>";
?>
</select><br>

<p>Выбрать пункт задания для выполнения ниже.
Они выполнены в формате <b>простого текста (1), xml (2)</b> и <b>json (3)</b> соответственно:<br>
<select name="mainSelect">
    <option>Задание 1 </option>
    <option>Задание 2</option>
    <option>Задание 3</option>
</select><br><br>
<button name="SubmButton" onclick="printDataTable()">Выполнить запрос</button>
</body> 
</html>