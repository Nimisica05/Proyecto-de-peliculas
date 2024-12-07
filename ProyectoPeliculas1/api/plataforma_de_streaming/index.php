<?php

require 'C:\xampp\htdocs\ProyectoPeliculas1\database.php';

$sql = 'SELECT * FROM plataforma_de_streaming';
$stmt = $conn->query($sql);
$platforms = $stmt->fetchAll();

header('Content-Type: application/json');
echo json_encode($platforms);
?>

